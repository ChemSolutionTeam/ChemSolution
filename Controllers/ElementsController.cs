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
            return await _context.Elements.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Element>> GetElement(int id)
        {
            var element = await _context.Elements.FindAsync(id);

            if (element == null)
            {
                return NotFound();
            }

            return element;
        }

        [HttpPut("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutElement(int id, Element element)
        {
            var tmpElement = await _context.Elements.FindAsync(id);
            if (tmpElement != null)
            {
                tmpElement.Symbol = _checkProperties.CheckModelProperty(tmpElement.Symbol, element.Symbol);
                tmpElement.Name = _checkProperties.CheckModelProperty(tmpElement.Name, element.Name);
                tmpElement.AtomicWeight = _checkProperties.CheckModelProperty(tmpElement.AtomicWeight, element.AtomicWeight);
                tmpElement.ElectronQuantity = _checkProperties.CheckModelProperty(tmpElement.ElectronQuantity, element.ElectronQuantity);
                tmpElement.ProtonQuantity = _checkProperties.CheckModelProperty(tmpElement.ProtonQuantity, element.ProtonQuantity);
                tmpElement.NeutronQuantity = _checkProperties.CheckModelProperty(tmpElement.NeutronQuantity, element.NeutronQuantity);
                tmpElement.AtomicRadius = _checkProperties.CheckModelProperty(tmpElement.AtomicRadius, element.AtomicRadius);
                tmpElement.Electronegativity = _checkProperties.CheckModelProperty(tmpElement.Electronegativity, element.Electronegativity);
                tmpElement.Category = _checkProperties.CheckModelProperty(tmpElement.Category, element.Category);
                tmpElement.EnergyLevels = _checkProperties.CheckModelProperty(tmpElement.EnergyLevels, element.EnergyLevels);
                tmpElement.MeltingTemperature = _checkProperties.CheckModelProperty(tmpElement.MeltingTemperature, element.MeltingTemperature);
                tmpElement.BoilingTemperature = _checkProperties.CheckModelProperty(tmpElement.BoilingTemperature, element.BoilingTemperature);
                tmpElement.IsLocked = _checkProperties.CheckModelProperty(tmpElement.IsLocked, element.IsLocked);
                tmpElement.Info = _checkProperties.CheckModelProperty(tmpElement.Info, element.Info);
                tmpElement.ImgSymbol = _checkProperties.CheckModelProperty(tmpElement.ImgSymbol, element.ImgSymbol);
                tmpElement.ImgAtom = _checkProperties.CheckModelProperty(tmpElement.ImgAtom, element.ImgAtom);
                tmpElement.Group = _checkProperties.CheckModelProperty(tmpElement.Group, element.Group);
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
