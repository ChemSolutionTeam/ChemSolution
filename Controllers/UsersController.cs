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
    public class UsersController : ControllerBase
    {
        private readonly DataContext _context;
        private readonly CheckPropertiesService _checkProperties;
        public UsersController(DataContext context, CheckPropertiesService checkProperties)
        {
            _checkProperties = checkProperties;
            _context = context;
        }
        [HttpGet("all")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users
                .Include(p => p.BlogPosts)
                .Include(p => p.Requests)
                .Include(p => p.ResearchHistorys)
                .Include(p => p.Elements)
                .Include(p => p.Achievement)
                .Select(u => _checkProperties
                    .PrepareModelForJson(ClearForbidetedInfo(u))).ToListAsync();
        }
        [HttpGet]
        [Authorize]
        public async Task<JsonResult> GetUser()
        {
            var id = User.Identity?.Name;
            var user = await _context.Users
                .Include(p=>p.BlogPosts)
                .Include(p => p.Requests)
                .Include(p=>p.ResearchHistorys)
                .Include(p=>p.Elements)
                .Include(p=>p.Achievement)
                .FirstAsync(u=>u.UserEmail == id);
            if (user == null)
            {
                return new JsonResult(null);
            }
            _checkProperties.PrepareModelForJson(user);
            return new JsonResult(ClearForbidetedInfo(user));
        }
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> PutUser( User user )
        {
            var id = User.Identity?.Name;
           
            var tmpUser = await _context.Users.FindAsync(id);
            if (tmpUser != null)
            {
                tmpUser.UserName = _checkProperties.CheckModelProperty(tmpUser.UserName, user.UserName);
                tmpUser.DateOfBirth = _checkProperties.CheckModelProperty(tmpUser.DateOfBirth, user.DateOfBirth);
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
                if (!UserExists(id))
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
        public async Task<ActionResult<User>> PostUser(User user)
        {
            await _context.Users.AddAsync(user);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (UserExists(user.UserEmail))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }
            return CreatedAtAction("GetUser", new { id = user.UserEmail }, user);
        }
        [HttpDelete("{id}")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<IActionResult> DeleteUser(string id)
        {
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpPost("liked/add/{postId}")]
        [Authorize]
        public async Task<IActionResult> AddLikedPost(int postId)
        {
            User user = await _context.Users.FindAsync(User.Identity?.Name);
            if (user != null)
            {
                BlogPost post = await _context.BlogPosts.FindAsync(postId);
                if (post != null)
                {
                    try
                    {
                        user.BlogPosts.Add(post);
                        await _context.SaveChangesAsync();
                        return Ok();
                    }
                    catch(Exception e)
                    {
                        return Conflict();
                    }
                }
                return BadRequest();
            }
            return Unauthorized();
        }

        [HttpPost("liked/remove/{postId}")]
        [Authorize]
        public async Task<IActionResult> RemoveLikedPost(int postId)
        {
            User user = await _context.Users
                .Include(p => p.BlogPosts)
                .FirstAsync(u => u.UserEmail == User.Identity.Name);
            if (user != null)
            {
                BlogPost post = await _context.BlogPosts.FindAsync(postId);
                if (post != null)
                {
                    try
                    {
                        user.BlogPosts.Remove(post);
                        await _context.SaveChangesAsync();
                        return Ok();
                    }
                    catch (Exception e)
                    {
                        return Conflict();
                    }
                }
                return BadRequest();
            }
            return Unauthorized();
        }
        
        private bool UserExists(string id)
        {
            return _context.Users.Any(e => e.UserEmail == id);
        }
        private static User ClearForbidetedInfo (User user)
        {
            user.Password = string.Empty;
            return user;
        }
        
    }
}
