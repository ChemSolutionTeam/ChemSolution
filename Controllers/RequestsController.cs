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
    public class RequestsController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly CheckPropertiesService _checkProperties;

        public RequestsController(DataContext context, CheckPropertiesService checkProperties)
        {
            _checkProperties = checkProperties;
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Request>>> GetRequests()
        {
            return await _context.Requests
                .ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Request>> GetRequest(string id)
        {
            var request = await _context.Requests.FindAsync(id);

            if (request == null)
            {
                return NotFound();
            }

            return request;
        }

        [HttpPut("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutRequest(string id, Request request)
        {
            var tmpRequest = await _context.Requests.FindAsync(id);
            if (tmpRequest != null)
            {
                _checkProperties.CheckModelProperties(tmpRequest, request);
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
                if (!RequestExists(id))
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
        [Authorize(Roles = Startup.Roles.User)]
        public async Task<ActionResult<Request>> PostRequest(Request request)
        {
            _context.Requests.Add(request);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (RequestExists(request.UserEmail))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetRequest", new { id = request.UserEmail }, request);
        }

        [HttpDelete("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteRequest(string id)
        {
            var request = await _context.Requests.FindAsync(id);
            if (request == null)
            {
                return NotFound();
            }

            _context.Requests.Remove(request);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        [Authorize(Roles = Startup.Roles.Admin)]
        private bool RequestExists(string id)
        {
            return _context.Requests.Any(e => e.UserEmail == id);
        }
    }
}
