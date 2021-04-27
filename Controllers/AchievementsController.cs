using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Services;
using Microsoft.AspNetCore.Authorization;

namespace ChemSolution.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class AchievementsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly CheckFieldService _checkField;

        public AchievementsController(DataContext context, CheckFieldService checkField)
        {
            _context = context;
            _checkField = checkField;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Achievement>>> GetAchievements()
        {
            return await _context.Achievements.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Achievement>> GetAchievement(int id)
        {
            var achievement = await _context.Achievements.FindAsync(id);

            if (achievement == null)
            {
                return NotFound();
            }

            return achievement;
        }

        
        [HttpPut("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutAchievement(int id, Achievement achievement)
        {
            
            var tmpAchievement = await _context.Achievements.FindAsync(id);
            
            if (tmpAchievement != null)
            {
                tmpAchievement.CountGoal = _checkField.CheckModelField(tmpAchievement.CountGoal, achievement.CountGoal);
                tmpAchievement.Heading   = _checkField.CheckModelField(tmpAchievement.Heading, achievement.Heading);
                tmpAchievement.Description = _checkField.CheckModelField(tmpAchievement.Description, achievement.Description);
                tmpAchievement.ImgAchievemen = _checkField.CheckModelField(tmpAchievement.ImgAchievemen, achievement.ImgAchievemen);
                tmpAchievement.MoneyReward = _checkField.CheckModelField(tmpAchievement.MoneyReward, achievement.MoneyReward);
                tmpAchievement.RatingReward = _checkField.CheckModelField(tmpAchievement.RatingReward, achievement.RatingReward);
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
                if (!AchievementExists(id))
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
        public async Task<ActionResult<Achievement>> PostAchievement(Achievement achievement)
        {
            await _context.Achievements.AddAsync(achievement);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAchievement", new { id = achievement.AchievementId }, achievement);
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteAchievement(int id)
        {
            var achievement = await _context.Achievements.FindAsync(id);
            if (achievement == null)
            {
                return NotFound();
            }

            _context.Achievements.Remove(achievement);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool AchievementExists(int id)
        {
            return _context.Achievements.Any(e => e.AchievementId == id);
        }
    }
}
