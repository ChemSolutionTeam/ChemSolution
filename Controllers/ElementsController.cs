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
using ChemSolution.Services.CheckProperties;
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
        
        
        private Element SetCategory(Element el)
        {
            var category =  _context.Categories.Find(el.CategoryId);
            category.Elements = null;
            el.Category = category;
            return el;
        }
        

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Element>>> GetElements()
        {
            
            return _context.Elements
                .Include(p => p.Materials)
                .Include(p=> p.Valences)
                .AsEnumerable()
                .Select(e => _checkProperties.PrepareModelForJson(e, new ClearOptions()
                {
                    ClearInModel = new[] {"Category"},
                    ClearInLinkedList = new Dictionary<string, string[]>()
                    {
                        {"Materials", new[] {"MaterialGroup"}},
                        {"ElementMaterials", new[] {"Material", "Element"}},
                        {"Valences", new []{"Element"}}
                    }
                }))
                .Select(e=>SetCategory(e))
                .ToList();
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
            return SetCategory(_checkProperties.PrepareModelForJson(element, new ClearOptions()
            {
                ClearInModel = new[] {"Category"},
                ClearInLinkedList = new Dictionary<string, string[]>()
                {
                    {"Materials", new[] {"MaterialGroup"}},
                    {"ElementMaterials", new[] {"Material", "Element"}},
                    {"Valences", new []{"Element"}}
                }
            }));
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
