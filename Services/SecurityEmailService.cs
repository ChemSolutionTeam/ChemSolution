
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

        private readonly List<string> _securityCodes = new List<string>();

        private readonly EmailService _emailService;

        private readonly ILogger<SecurityEmailService> _logger;

        private readonly DataContext _context;

        public SecurityEmailService(EmailService emailService, DataContext context,
            ILogger<SecurityEmailService> logger)
        {
            _logger = logger;
            _emailService = emailService;
            _context = context;
        }

        public bool CheckCode(string code)
        {
            if (_securityCodes.Contains(code))
            {
                _securityCodes.Remove(code);
                return true;
            }

            return false;
        }

        public async Task ChangePassword(string email, string newPassword)
        {
            if (await _context.Users.FindAsync(email) != null)
            {
                string code = PasswordGenerator.Generate(length: 10, allowed: Sets.Alphanumerics);
                try
                {
                    string message = $"Link: <a href={code}></a>";
                    await _emailService.SendEmailAsync(email, "Change password in ChemSolution", message);
                    _securityCodes.Add(code);
                    _logger.LogInformation($"Success ChangePassword for user: {email}");
                }
                catch
                {
                    _logger.LogError($"Error in ChangePassword for user: {email}");
                }
            }

        }

    }

}