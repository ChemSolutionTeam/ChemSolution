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
        private readonly CheckFieldService _checkField;
        public UsersController(DataContext context, CheckFieldService checkField)
        {
            _checkField = checkField;
            _context = context;
        }
        [HttpGet]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users.Select(u => ClearForbidetedInfo(u)).ToListAsync();
        }
        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<User>> GetUser(string id)
        {
            var user = await _context.Users.FindAsync(id);

            if (user == null)
            {
                return NotFound();
            }
            return ClearForbidetedInfo(user);
        }
        [HttpPut("{id}&{key}")]
        [Authorize]
        public async Task<IActionResult> PutUser(string id,string key, User user)
        {
            if (id != user.UserEmail)
            {
                return BadRequest();
            }
            var tmpUser = await _context.Users.FindAsync(user.UserEmail);
            if (tmpUser != null)
            {
                tmpUser.UserName = _checkField.CheckModelField(tmpUser.UserName, user.UserName);
                tmpUser.Password = _checkField.CheckModelField(tmpUser.Password, user.Password);
                tmpUser.DateOfBirth = _checkField.CheckModelField(tmpUser.DateOfBirth, user.DateOfBirth);
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
        private bool UserExists(string id)
        {
            return _context.Users.Any(e => e.UserEmail == id);
        }
        private User ClearForbidetedInfo (User user)
        {
            user.Password = string.Empty;
            return user;
        }
    }
    
    
}
