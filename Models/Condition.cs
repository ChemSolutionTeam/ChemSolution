using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ChemSolution.Models
{
    public class Condition
    {
        [Key]
        public int Id { get; set; }
        public string GroupName { get; set; }
        [Range(0, int.MaxValue)]
        public int CountGoal { get; set; }
    }
}