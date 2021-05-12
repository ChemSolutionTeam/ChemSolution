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
            return await _context.Materials.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Material>> GetMaterial(int id)
        {
            var material = await _context.Materials.FindAsync(id);

            if (material == null)
            {
                return NotFound();
            }

            return material;
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

        [HttpPost("Search")]
        [Authorize]
        public async Task<IActionResult> Search(SearchMaterialRequest searchRequest)
        {
            bool IsEquals(Material material)
            {
                var tmpU1 = material.ElementMaterials
                    .Select(e => (ElementId: e.ElementId, Amount: e.Amount))
                    .ToList();
                var tmpU2 = searchRequest.Value
                    .Select(rm => (ElementId: rm.ElementId, Amount: rm.Amount))
                    .ToList();
                return !tmpU1.Except(tmpU2).Any();
            }
            Material material = _context.Materials
                .Include(p => p.ElementMaterials)
                .AsEnumerable()
                .SingleOrDefault(m => IsEquals(m));
            if (material != null)
            {
                User user = _context.Users
                    .Include( u=> u.ResearchHistorys)
                    .SingleOrDefault(u => u.UserEmail == User.Identity.Name);
                if (user != null)
                {
                    bool isNew = user.ResearchHistorys.SingleOrDefault(m => m.MaterialId == material.MaterialId) == null;
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
                    }
                    return new JsonResult(new SearchMaterialResponse()
                    {
                        ResultMaterialId = material.MaterialId,
                        IsNew = isNew
                    });
                }
                else
                {
                    return Unauthorized();
                }
            }
            return NotFound();
        }
        
    }
}
