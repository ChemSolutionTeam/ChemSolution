namespace ChemSolution.Middlewares.Authorization.Models
{
    public class JwtUser
    {
        public string Login { set;get;}
        public string Password {set;get;}
        public string Role { set; get; }
    }
}