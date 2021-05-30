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
            ClearOptions options = new ClearOptions()
            {
                ClearInLinkedModel = new Dictionary<string, string[]>()
                {
                    {"Status", new[]{"Requests"}}
                }
            };
            return await _context.Requests
                .Include( r=> r.Status)
                .Select( r=> _checkProperties.PrepareModelForJson(r, options))
                .ToListAsync();
        }

        [HttpGet("{email}/{date}")]
        public async Task<ActionResult<Request>> GetRequest(string email, string date)
        {
            ClearOptions options = new ClearOptions()
            {
                ClearInLinkedModel = new Dictionary<string, string[]>()
                {
                    {"Status", new[]{"Requests"}}
                }
            };
            var request = await _context.Requests
                .Include( r=> r.Status)
                .SingleOrDefaultAsync(r => r.UserEmail == email && r.DateTimeSended == Convert.ToDateTime(date));

            if (request == null)
            {
                return NotFound();
            }
            return _checkProperties.PrepareModelForJson(request, options);
        }

        [HttpPut("{email}/{date}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> PutRequest(string email, string date, Request request)
        {
            var tmpRequest = await _context.Requests.SingleOrDefaultAsync(r => r.UserEmail == email && r.DateTimeSended == Convert.ToDateTime(date));
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
                if (!RequestExists(email))
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

        [HttpPut("set/status/{statusId}/{email}/{date}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> SetStatus(int statusId,string email, string date)
        {
            var request =
                await _context.Requests.SingleOrDefaultAsync(r => r.UserEmail == email && r.DateTimeSended == Convert.ToDateTime(date));
            if (request != null)
            {
                var status = await _context.Status.FindAsync(statusId);
                if (status != null)
                {
                    request.Status = status;
                    await _context.SaveChangesAsync();
                }
                return Ok();
            }
            return Problem();
        } 
        

        [HttpPost]
        [Authorize]
        public async Task<ActionResult<Request>> PostRequest(Request request)
        {
            var user = await _context.Users.FindAsync(User.Identity?.Name);
            if (user != null)
            {
                await _context.Requests.AddAsync(request);
                user.Requests.Add(request);
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

                return Ok();
            }
            return NotFound();
        }

        [HttpDelete("{email}/{date}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteRequest(string email, string date)
        {
            var request = await _context.Requests.SingleOrDefaultAsync(r => r.UserEmail == email && r.DateTimeSended == Convert.ToDateTime(date));;
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
