
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace ChemSolution.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class UserSecurityController:ControllerBase
    {
        private readonly ILogger<UserSecurityController> _logger;
        private readonly SecurityEmailService _securityEmailService;
        private readonly DataContext _context;
        public UserSecurityController(ILogger<UserSecurityController> logger, 
            SecurityEmailService securityEmailService, DataContext context)
        {
            _logger = logger;
            _securityEmailService = securityEmailService;
            _context = context;
        }

        [HttpPost("ChangePassword/{newPassword}")]
        public async Task<IActionResult> ChangePassword(string newPassword)
        {
            var id = User.Identity?.Name;
            if (id != null)
            {
                await _securityEmailService.ChangePassword(_context,id, GetPasswordHash(newPassword));
                return Ok();
            }
            return NotFound();
        }
        
        [HttpPost("RecoverPassword/{userEmail}/{newPassword}")]
        public async Task<IActionResult> RecoverPassword(string userEmail, string newPassword)
        {
            var id = userEmail;
            if (id != null)
            {
                await _securityEmailService.ChangePassword(_context,id, GetPasswordHash(newPassword));
                return Ok();
            }
            return NotFound();
        }

        private string GetPasswordHash(string password)
        {
            byte[] hash;
            using (var sha1 = new SHA1CryptoServiceProvider())
                hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(password));
            return Convert.ToBase64String(hash);
            
        }

        [HttpGet("SetPassword/{code}")]
        public async Task<IActionResult> SetPassword(string code)
        {
            var info = _securityEmailService.GetInfobyCode(code);
            if (info != (email:null, newPassword:null))
            {
               var user = await _context.Users.FindAsync(info.email);
               if (user != null)
               {
                   try
                   {
                       user.Password = info.newPassword;
                       await _context.SaveChangesAsync();
                       return Ok();
                   }
                   catch
                   {
                       _logger.LogError($"Error user: {info.email} couldn't change password Date: {DateTime.UtcNow}");
                   }
               }
            }
            return BadRequest();
        }
    }
}