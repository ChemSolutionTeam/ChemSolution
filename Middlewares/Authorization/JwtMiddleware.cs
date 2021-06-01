using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using ChemSolution.Data;
using ChemSolution.Middlewares.Authorization.Models;
using ChemSolution.Middlewares.Authorization.Settings;
using ChemSolution.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace ChemSolution.Middlewares.Authorization
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IUserGetter _userGetter;
        public JwtMiddleware(RequestDelegate next, IUserGetter userGetter)
        {
            this._userGetter = userGetter;
            this._next = next;
        }
        public async Task InvokeAsync(HttpContext context, DataContext dbContext)
        {
            if(context.Request.Path.Value?.Split("/").Last() == "getjwt")
            {
                var identity = await GetIdentityAsync(dbContext, context.Request.Query["email"],
                    context.Request.Query["password"]);

                var tmp = context.Request.Body;
                
                if (identity != null)
                {
                    var now = DateTime.UtcNow;
                    var jwt = new JwtSecurityToken(
                        issuer: JwtSettings.ISSUER,
                        audience: JwtSettings.AUDIENCE,
                        notBefore: now,
                        claims: identity.Claims,
                        expires: now.Add(TimeSpan.FromMinutes(JwtSettings.LIFETIME)),
                        signingCredentials: new SigningCredentials(JwtSettings.GetSymmetricSecurityKey(), SecurityAlgorithms.HmacSha256));
                    var encodedJwt = new JwtSecurityTokenHandler().WriteToken(jwt);

                    var response = new
                    {
                        access_token = encodedJwt,
                        username = identity.Name
                    };
                    context.Response.StatusCode = 201;
                    context.Response.ContentType = "json";
                    await context.Response.WriteAsync(JsonSerializer.Serialize(response));
                }
                else
                {
                    context.Response.StatusCode = 403;
                }
            }
            else
            {
                await _next.Invoke(context);
            }
            
        }
        
        private string GetPasswordHash(string password)
        {
            byte[] hash;
            using (var sha1 = new SHA1CryptoServiceProvider())
                hash = sha1.ComputeHash(Encoding.UTF8.GetBytes(password));
            return Convert.ToBase64String(hash);
            
        }
        
        private async Task<ClaimsIdentity> GetIdentityAsync(DbContext context, string login, string password)
        {
            JwtUser user = await _userGetter.GetUserAsync(context, login, GetPasswordHash(password));
            if (user != null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimsIdentity.DefaultNameClaimType, user.Login),
                    new Claim(ClaimsIdentity.DefaultRoleClaimType, user.Role)
                };
                ClaimsIdentity claimsIdentity =
                    new ClaimsIdentity(claims, "Token", ClaimsIdentity.DefaultNameClaimType,
                        ClaimsIdentity.DefaultRoleClaimType);
                return claimsIdentity;
            }
            return null;
        }

    }
}