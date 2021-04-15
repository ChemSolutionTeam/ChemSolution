using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Material
    {
        [Key]
        public int Id { get; set; }
        public string Image { get; set; }
        [StringLength(50, MinimumLength = 1)]
        public string Formula { get; set; }
        [StringLength(50, MinimumLength = 1)]
        public string Name { get; set; }
        public string Info { get; set; }
    }
}