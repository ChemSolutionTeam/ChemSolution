using System.Collections.Generic;
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
        public List<Element> Elements {get; set; } = new List<Element>();
        public List<User> Users = new List<User>();
        public List<ElementMaterial> ElementMaterials { set; get; } = new List<ElementMaterial>();
        public List<ResearchHistory> ResearchHistories { set; get; } = new List<ResearchHistory>();

        public MaterialGroup MaterialGroup { set; get; }
        public int? MaterialGroupId { set; get; }

    }
}