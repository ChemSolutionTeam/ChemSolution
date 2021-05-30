using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Models.BufferModels.RequestModels;
using ChemSolution.Models.BufferModels.ResponseModels;
using ChemSolution.Services;
using ChemSolution.Services.CheckProperties;
using Microsoft.AspNetCore.Authorization;

namespace ChemSolution.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class MaterialsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly CheckPropertiesService _checkProperties;

        public MaterialsController(DataContext context, CheckPropertiesService checkProperties)
        {
            _context = context;
            _checkProperties = checkProperties;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Material>>> GetMaterials()
        {
            ClearOptions options = new ClearOptions()
            {
                ClearInLinkedModel = new()
                {
                    {"MaterialGroup", new[] {"Materials", "Achievement"}}
                }
            };
            return await _context.Materials
                .Include(m=>m.MaterialGroup)
                .Select(m=>_checkProperties.PrepareModelForJson(m, options))
                .ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Material>> GetMaterial(int id)
        {
            ClearOptions options = new ClearOptions()
            {
                ClearInLinkedModel = new()
                {
                    {"MaterialGroup", new[] {"Materials", "Achievement"}}
                }
            };
            var material = await _context.Materials
                .Include(m=>m.MaterialGroup)
                .SingleOrDefaultAsync(m=>m.MaterialId ==id);

            if (material == null)
            {
                return NotFound();
            }

            return _checkProperties.PrepareModelForJson(material, options);
        }

        [HttpPut("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutMaterial(int id, Material material)
        {
            var tmpMaterial = await _context.Materials.FindAsync(id);
            if (tmpMaterial != null)
            {
              _checkProperties.CheckModelProperties(tmpMaterial, material);
            }
            else
            {
                return NotFound();
            }

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MaterialExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<ActionResult<Material>> PostMaterial(Material material)
        {
            _context.Materials.Add(material);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMaterial", new { id = material.MaterialId }, material);
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteMaterial(int id)
        {
            var material = await _context.Materials.FindAsync(id);
            if (material == null)
            {
                return NotFound();
            }

            _context.Materials.Remove(material);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        [Authorize(Roles = Startup.Roles.Admin)]
        private bool MaterialExists(int id)
        {
            return _context.Materials.Any(e => e.MaterialId == id);
        }

        [HttpPost("search")]
        public async Task<IActionResult> Search(SearchMaterialRequest searchRequest)
        {
            bool IsEqual(Material material)
            {
                
                var tmpU1 = material.ElementMaterials
                    .Select(e => (ElementId: e.ElementId, Amount: e.Amount))
                    .ToList();
                
                var tmpU2 = searchRequest.Value
                    .Select(rm => (ElementId: rm.ElementId, Amount: rm.Amount))
                    .ToList();
                
                return !tmpU1.Except(tmpU2).Any() && !tmpU2.Except(tmpU1).Any();
            }
            
            Material material = _context.Materials
                .Include(p => p.ElementMaterials)
                .AsEnumerable()
                .SingleOrDefault(m => IsEqual(m));
            if (material != null)
            {
                 User user = await _context.Users
                    .Include( u=> u.ResearchHistorys)
                    .Include(u=>u.Achievement)
                    .SingleOrDefaultAsync(u => u.UserEmail == User.Identity.Name);
                if (user != null)
                {
                    bool isNew = user.ResearchHistorys.SingleOrDefault(m => m.MaterialId == material.MaterialId) == null;
                    var achievementsId = new List<int>();
                    if(isNew) {
                        user.ResearchHistorys.Add(
                        new ResearchHistory()
                        {
                            UserEmail = user.UserEmail,
                            MaterialId = material.MaterialId,
                            Material = material,
                            DateTime = DateTime.Today
                        });
                        await _context.SaveChangesAsync();
                        achievementsId = await ComplateAchivmentsAsync(user);
                    }
                    return new JsonResult(new SearchMaterialResponse()
                    {
                        ResultMaterialId = material.MaterialId,
                        IsNew = isNew,
                        NewAchievementsId = achievementsId
                    });
                }
                return new JsonResult(new SearchMaterialResponse()
                    {
                        ResultMaterialId = material.MaterialId,
                        IsNew = true,
                        NewAchievementsId = null
                    });
            }
            return NotFound();
        }
        
        private async Task<List<int>> ComplateAchivmentsAsync (User user)
        {
            var tmpU1 = user.Materials.GroupBy(u => u.MaterialGroupId)
                .Select(ug => (Key: ug.Key, Amount: (int?) ug.Count()  )).ToList();
            var tmpU2 = _context.Achievements.AsEnumerable()
                .Select(a => (Key: a.MaterialGroupId, Amount: a.CountGoal)).ToList();
            var res = tmpU1.Intersect(tmpU2);

            var achievementsId = new List<int>();
            
            foreach (var tmp in res)
            {
                var tmpAchievement =
                    await _context.Achievements.SingleOrDefaultAsync(a => a.MaterialGroupId == tmp.Key && a.CountGoal == tmp.Amount);
                if (tmpAchievement != null)
                {
                    if (!user.Achievement.Contains(tmpAchievement))
                    {
                        achievementsId.Add(tmpAchievement.AchievementId);
                        user.Balance += tmpAchievement.MoneyReward ?? 0;
                        user.Rating += tmpAchievement.RatingReward ?? 0;
                        user.Achievement.Add(tmpAchievement);
                    }
                }
            }
            await _context.SaveChangesAsync();

            return achievementsId;
        }
        
    }
}
