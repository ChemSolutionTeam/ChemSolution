using ChemSolution.Middlewares.Authorization.Models;

namespace ChemSolution.Middlewares.Authorization.Settings
{
    public interface IUserGetter
    {
        public JwtUser GetUser(string login, string password);
    }
}