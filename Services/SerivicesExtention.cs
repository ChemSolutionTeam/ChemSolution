using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;

namespace ChemSolution.Services
{
    public static class SerivicesExtention
    {

        public static void AddCheckFieldService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<CheckPropertiesService>();
        }

        public static void AddEmailService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddTransient<EmailService>();
        }
        public static void AddSecurityEmailService(this IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<SecurityEmailService>();
        }
    }
}
