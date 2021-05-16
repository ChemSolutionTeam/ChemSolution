using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Element
    {
        [Key]
        public int ElementId { get; set; }
        [StringLength(5, MinimumLength = 1)]
        public string Symbol { get; set; }
        [StringLength(50, MinimumLength = 1)]
        public string Name { get; set; }
        [Range(0, double.MaxValue)]
        public double? AtomicWeight { get; set; }
        [Range(0, int.MaxValue)]
        public int? ElectronQuantity { get; set; }
        [Range(0, int.MaxValue)]
        public int? ProtonQuantity { get; set; }
        [Range(0, int.MaxValue)]
        public int? NeutronQuantity { get; set; }
        [Range(0, double.MaxValue)]
        public  double?  AtomicRadius { get; set; }
        [Range(0, double.MaxValue)]
        public  double?  Electronegativity { get; set; }
        [Range(0, int.MaxValue)]
        public int? EnergyLevels { get; set; }
        [Range(0, int.MaxValue)]
        public int? MeltingTemperature { get; set; }
        [Range(0, int.MaxValue)]
        public int? BoilingTemperature { get; set; }
        public bool? IsLocked { get; set; }
        public string Info { get; set; }
        public string ImgSymbol { get; set; }
        public string ImgAtom { get; set; }
        [Range(0, int.MaxValue)]
        public int? Group { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }
        public List<ElementMaterial> ElementMaterials { set; get; } = new List<ElementMaterial>();
        public List<Material> Materials { get; set; } = new List<Material>();
        public List<Valence> Valences { get; set; } = new List<Valence>();
        public List<User> Users { get; set; } = new List<User>();
    }
}