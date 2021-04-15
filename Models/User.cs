using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class User
    {
        [Key]
        [EmailAddress]
        public string UserEmail { set; get; }
        [StringLength(50, MinimumLength = 3)]
        public string UserName { set; get; }
        [StringLength(50,MinimumLength = 8)]
        public string Password { set; get; }
        [Range(0, int.MaxValue)] 
        public int Balance { set; get; } = 0;
        [Range(0, int.MaxValue)]
        public int Rating { set; get; } = 0;
        [Range(0, int.MaxValue)]
        public int Honesty { set; get; } = 0;
    }
}