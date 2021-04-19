using System;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models.BuuferModels.Authorization
{
    public class UserRegister
    {
        [Required]
        [EmailAddress]
        public string UserEmail { set; get; }
        [StringLength(50, MinimumLength = 3)]
        public string UserName { set; get; }
        public DateTime DateOfBirth { set; get; }
        [StringLength(50,MinimumLength = 8)]
        public string Password { set; get; }
    }
}