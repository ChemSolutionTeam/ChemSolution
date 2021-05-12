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
    public class ElementsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly CheckPropertiesService _checkProperties;

        public ElementsController(DataContext context, CheckPropertiesService checkProperties)
        {
            _context = context;
            _checkProperties = checkProperties;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Element>>> GetElements()
        {
            return await _context.Elements
                .Include(p=>p.Materials)
                .Select(e=>_checkProperties.PrepareModelForJson(e))
                .ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Element>> GetElement(int id)
        {
            var element = await _context.Elements
                .Include(p => p.Materials)
                .FirstAsync(e=> e.ElementId == id);
            if (element == null)
            {
                return NotFound();
            }
            _checkProperties.PrepareModelForJson(element);
            return element;
        }

        [HttpPut("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutElement(int id, Element element)
        {
            var tmpElement = await _context.Elements.FindAsync(id);
            if (tmpElement != null)
            {
               _checkProperties.CheckModelProperties(tmpElement, element);
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
                if (!ElementExists(id))
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
        public async Task<ActionResult<Element>> PostElement(Element element)
        {
            await _context.Elements.AddAsync(element);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetElement", new { id = element.ElementId }, element);
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteElement(int id)
        {
            var element = await _context.Elements.FindAsync(id);
            if (element == null)
            {
                return NotFound();
            }

            _context.Elements.Remove(element);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ElementExists(int id)
        {
            return _context.Elements.Any(e => e.ElementId == id);
        }
    }
}
