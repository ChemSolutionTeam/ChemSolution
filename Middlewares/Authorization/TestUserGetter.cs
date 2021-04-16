using System.Threading.Tasks;
using ChemSolution.Middlewares.Authorization.Models;
using ChemSolution.Middlewares.Authorization.Settings;
using Microsoft.EntityFrameworkCore;

namespace ChemSolution.Middlewares.Authorization
{
    public class TestUserGetter:IUserGetter
    {
        public JwtUser GetUser(DbContext context, string login, string password)
        {
            throw new System.NotImplementedException();
        }

        public async Task<JwtUser> GetUserAsync(DbContext context, string login, string password)
        {
            return new JwtUser() {Login = "Test", Password = "Test", Role = "Test"};
        }
    }
}