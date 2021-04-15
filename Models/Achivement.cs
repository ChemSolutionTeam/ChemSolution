using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Achivement
    {
        [Key]
        public int Id { get; set; }
        [StringLength(50, MinimumLength = 5)]
        public string Heading { get; set; }
        [StringLength(100, MinimumLength = 1)]
        public string Description { get; set; }
        [Range(0, int.MaxValue)]
        public double MoneyReward { get; set; }
        [Range(0, int.MaxValue)]
        public double RatingReward { get; set; }
        
        public int ConditionId { get; set; }
    }
}