
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ChemSolution.Data;
using MailKit.Net.Smtp;
using Microsoft.Extensions.Logging;
using MimeKit;
using MlkPwgen;

namespace ChemSolution.Services
{
    public class SecurityEmailService
    {
        private readonly Dictionary<string, (string email, string newPassword)> _securityCodeDictionary = new Dictionary<string, (string, string)>();
        private readonly EmailService _emailService;
        public (string email, string newPassword) GetInfobyCode(string code)
        {
            if (_securityCodeDictionary.ContainsKey(code))
            {
                var tmp = _securityCodeDictionary[code];
                _securityCodeDictionary.Remove(code);
                return tmp;
            }
            return (email:null, newPassword:null);
        }
        public SecurityEmailService()
        {
            _emailService = new EmailService();
        }
        public async Task ChangePassword(DataContext context, string email, string newPassword)
        {
            if (await context.Users.FindAsync(email) != null)
            {
                string code;
                while (_securityCodeDictionary.ContainsKey( code = PasswordGenerator.Generate(length: 10, allowed: Sets.Alphanumerics) )) { }
                string message = $"Link: <a href=https://localhost:5001/UserSecurity/SetPassword?code={code}></a>";
                //await _emailService.SendEmailAsync(email, "Change password in ChemSolution", message);
                _securityCodeDictionary[code] = (email: email, newPassword: newPassword);
            }

        }

    }

}