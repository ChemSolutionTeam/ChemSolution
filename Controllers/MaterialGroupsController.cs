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
    public class MaterialGroupsController : ControllerBase
    {
        private readonly DataContext _context;

        public MaterialGroupsController(DataContext context)
        {
            _context = context;
        }

        // GET: api/MaterialGroups
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MaterialGroup>>> GetMaterialGroups()
        {
            return await _context.MaterialGroups.ToListAsync();
        }

        // GET: api/MaterialGroups/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MaterialGroup>> GetMaterialGroup(int id)
        {
            var materialGroup = await _context.MaterialGroups.FindAsync(id);

            if (materialGroup == null)
            {
                return NotFound();
            }

            return materialGroup;
        }

        // PUT: api/MaterialGroups/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMaterialGroup(int id, MaterialGroup materialGroup)
        {
            if (id != materialGroup.MaterialGroupId)
            {
                return BadRequest();
            }

            _context.Entry(materialGroup).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MaterialGroupExists(id))
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

        // POST: api/MaterialGroups
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<MaterialGroup>> PostMaterialGroup(MaterialGroup materialGroup)
        {
            _context.MaterialGroups.Add(materialGroup);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMaterialGroup", new { id = materialGroup.MaterialGroupId }, materialGroup);
        }

        // DELETE: api/MaterialGroups/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMaterialGroup(int id)
        {
            var materialGroup = await _context.MaterialGroups.FindAsync(id);
            if (materialGroup == null)
            {
                return NotFound();
            }

            _context.MaterialGroups.Remove(materialGroup);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MaterialGroupExists(int id)
        {
            return _context.MaterialGroups.Any(e => e.MaterialGroupId == id);
        }
    }
}
