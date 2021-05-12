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

            return CreatedAtAction("GetMaterial", new { id = material.Id }, material);
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
            return _context.Materials.Any(e => e.Id == id);
        }
    }
}
