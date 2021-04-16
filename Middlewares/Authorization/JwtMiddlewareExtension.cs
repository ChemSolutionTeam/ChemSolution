using ChemSolution.Middlewares.Authorization.Settings;
using Microsoft.AspNetCore.Builder;

namespace ChemSolution.Middlewares.Authorization
{
    public static class JwtMiddlewareExtension
    {
        public static IApplicationBuilder UseJwtToken(this IApplicationBuilder builder, IUserGetter userGetter)
        {
            return builder.UseMiddleware<JwtMiddleware>(userGetter);
        }
    }
}