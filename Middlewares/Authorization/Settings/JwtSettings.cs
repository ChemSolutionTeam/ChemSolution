using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace ChemSolution.Middlewares.Authorization.Settings
{
    public class JwtSettings
    {
        public const string ISSUER = "ChemSolution"; 
        public const string AUDIENCE = "ChemSolutionClient";
        private static readonly string KEY = RandomKey.CreateKey(30);
        public const int LIFETIME = 60; // Life time is measured in minutes
        public static SymmetricSecurityKey GetSymmetricSecurityKey()
        {
            return new SymmetricSecurityKey(Encoding.ASCII.GetBytes(KEY));
        }
    }
}