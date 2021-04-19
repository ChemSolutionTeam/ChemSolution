using System;
using System.Net.Http;
using System.Threading.Tasks;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Models.BuuferModels.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace ChemSolution.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserController:ControllerBase
    {
        private readonly ILogger<UserController> _logger;
        private readonly DataContext _context;
        public UserController(ILogger<UserController> logger, DataContext context)
        {
            _logger = logger;
            _context = context;
        }
        [HttpPost] 
        public async Task Post(UserRegister user)
        {
            if (ModelState.IsValid)
            {
                if (await _context.Users.FindAsync(user.UserEmail) == null)
                {
                    await _context.Users.AddAsync(new User()
                    {
                        UserEmail = user.UserEmail, UserName = user.UserName, Password = user.Password,
                        DateOfBirth = user.DateOfBirth
                    });
                    await _context.SaveChangesAsync();
                    HttpContext.Response.StatusCode = 201;
                    _logger.LogInformation($"User {user.UserName} was created {DateTime.UtcNow.ToString()}");
                }
                else
                {
                    HttpContext.Response.StatusCode = 409;
                }
            }
            else
            {
                HttpContext.Response.StatusCode = 400;
            }
        }
    }
}