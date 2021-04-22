using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ChemSolution.Data;
using ChemSolution.Models;

namespace ChemSolution.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AchievementsController : ControllerBase
    {
        private readonly DataContext _context;

        public AchievementsController(DataContext context)
        {
            _context = context;
        }

        // GET: api/Achievements
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Achievement>>> GetAchievements()
        {
            return await _context.Achievements.ToListAsync();
        }

        // GET: api/Achievements/5
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

        // PUT: api/Achievements/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAchievement(int id, Achievement achievement)
        {
            if (id != achievement.AchievementId)
            {
                return BadRequest();
            }

            _context.Entry(achievement).State = EntityState.Modified;

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

        // POST: api/Achievements
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Achievement>> PostAchievement(Achievement achievement)
        {
            _context.Achievements.Add(achievement);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAchievement", new { id = achievement.AchievementId }, achievement);
        }

        // DELETE: api/Achievements/5
        [HttpDelete("{id}")]
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
