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
        private readonly CheckFieldService _checkField;

        public ElementsController(DataContext context, CheckFieldService checkField)
        {
            _context = context;
            _checkField = checkField;
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
                tmpElement.Symbol = _checkField.CheckModelField(tmpElement.Symbol, element.Symbol);
                tmpElement.Name = _checkField.CheckModelField(tmpElement.Name, element.Name);
                tmpElement.AtomicWeight = _checkField.CheckModelField(tmpElement.AtomicWeight, element.AtomicWeight);
                tmpElement.ElectronQuantity = _checkField.CheckModelField(tmpElement.ElectronQuantity, element.ElectronQuantity);
                tmpElement.ProtonQuantity = _checkField.CheckModelField(tmpElement.ProtonQuantity, element.ProtonQuantity);
                tmpElement.NeutronQuantity = _checkField.CheckModelField(tmpElement.NeutronQuantity, element.NeutronQuantity);
                tmpElement.AtomicRadius = _checkField.CheckModelField(tmpElement.AtomicRadius, element.AtomicRadius);
                tmpElement.Electronegativity = _checkField.CheckModelField(tmpElement.Electronegativity, element.Electronegativity);
                tmpElement.Category = _checkField.CheckModelField(tmpElement.Category, element.Category);
                tmpElement.EnergyLevels = _checkField.CheckModelField(tmpElement.EnergyLevels, element.EnergyLevels);
                tmpElement.MeltingTemperature = _checkField.CheckModelField(tmpElement.MeltingTemperature, element.MeltingTemperature);
                tmpElement.BoilingTemperature = _checkField.CheckModelField(tmpElement.BoilingTemperature, element.BoilingTemperature);
                tmpElement.IsLocked = _checkField.CheckModelField(tmpElement.IsLocked, element.IsLocked);
                tmpElement.Info = _checkField.CheckModelField(tmpElement.Info, element.Info);
                tmpElement.ImgSymbol = _checkField.CheckModelField(tmpElement.ImgSymbol, element.ImgSymbol);
                tmpElement.ImgAtom = _checkField.CheckModelField(tmpElement.ImgAtom, element.ImgAtom);
                tmpElement.Group = _checkField.CheckModelField(tmpElement.Group, element.Group);
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
