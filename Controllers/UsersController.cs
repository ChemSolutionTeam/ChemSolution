﻿using System;
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
        [HttpGet("all")]
        [Authorize(Roles = Startup.Roles.Admin)]
        public async Task<ActionResult<IEnumerable<User>>> GetUsers()
        {
            return await _context.Users.Select(u => ClearForbidetedInfo(u)).ToListAsync();
        }
        
        [HttpGet]
        [Authorize]
        public async Task<ActionResult<User>> GetUser()
        {
            var id = User.Identity?.Name;
            var user = await _context.Users.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }
            return ClearForbidetedInfo(user);
        }
        [HttpPut]
        [Authorize]
        public async Task<IActionResult> PutUser( User user )
        {
            var id = User.Identity?.Name;
           
            var tmpUser = await _context.Users.FindAsync(id);
            if (tmpUser != null)
            {
                tmpUser.UserName = _checkField.CheckModelField(tmpUser.UserName, user.UserName);
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
        private static User ClearForbidetedInfo (User user)
        {
            user.Password = string.Empty;
            return user;
        }
    }
}
