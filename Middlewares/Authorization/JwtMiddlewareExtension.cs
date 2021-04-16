using ChemSolution.Middlewares.Authorization.Settings;
using Microsoft.AspNetCore.Builder;

namespace ChemSolution.Middlewares.Authorization
{
    public static class JwtMiddlewareExtension
    {
        public static IApplicationBuilder UseJwtToken(this IApplicationBuilder builder, IUserGetterAsync userGetterAsync)
        {
            return builder.UseMiddleware<JwtMiddleware>(userGetterAsync);
        }
    }
}