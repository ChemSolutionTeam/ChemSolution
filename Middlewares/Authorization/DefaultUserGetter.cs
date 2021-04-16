using System.Linq;
using System.Threading.Tasks;
using ChemSolution.Data;
using ChemSolution.Middlewares.Authorization.Models;
using ChemSolution.Middlewares.Authorization.Settings;
using ChemSolution.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace ChemSolution.Middlewares.Authorization
{
    public class DefaultUserGetter:IUserGetter
    {
        public JwtUser GetUser(DbContext context, string login, string password)
        {
            throw new System.NotImplementedException();
        }

        public async Task<JwtUser> GetUserAsync(DbContext context, string login, string password)
        {
            await using (context)
            {
                if (context is DataContext curContext)
                {
                    var user = await curContext.Users.SingleOrDefaultAsync(u => u.UserEmail == login && u.Password == password);
                    if (user != null)
                    {
                        return new JwtUser() {Login = user.UserEmail, Password = user.Password, Role = "User"};
                    }
                }
            }
            return null;
        }
    }
}