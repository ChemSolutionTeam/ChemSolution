using System.Threading.Tasks;
using ChemSolution.Middlewares.Authorization.Models;
using Microsoft.EntityFrameworkCore;

namespace ChemSolution.Middlewares.Authorization.Settings
{
    public interface IUserGetter
    {
        public JwtUser GetUser(DbContext context, string login, string password);
        public Task<JwtUser> GetUserAsync(DbContext context, string login, string password);
        
    }
}