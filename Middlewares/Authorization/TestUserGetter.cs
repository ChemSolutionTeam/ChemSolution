using ChemSolution.Middlewares.Authorization.Models;
using ChemSolution.Middlewares.Authorization.Settings;

namespace ChemSolution.Middlewares.Authorization
{
    public class TestUserGetter:IUserGetter
    {
        public JwtUser GetUser(string login, string password)
        {
            return new JwtUser() {Login = "Test", Password = "Test", Role = "Test"};
        }
    }
}