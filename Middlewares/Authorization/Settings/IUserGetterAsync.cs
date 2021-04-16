using System.Threading.Tasks;
using ChemSolution.Middlewares.Authorization.Models;
using Microsoft.EntityFrameworkCore;

namespace ChemSolution.Middlewares.Authorization.Settings
{
    public interface IUserGetterAsync
    {
        public Task<JwtUser> GetUserAsync(DbContext context, string login, string password);
    }
}