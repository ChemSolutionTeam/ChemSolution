using System;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Element
    {
        [Key]
        public int Id { get; set; }
        [StringLength(5, MinimumLength = 1)]
        public string Symbol { get; set; }
        [StringLength(50, MinimumLength = 1)]
        public string Name { get; set; }
        [Range(0, int.MaxValue)]
        public double AtomicWeight { get; set; }
        [Range(0, int.MaxValue)]
        public int ElectronQuantity { get; set; }
        [Range(0, int.MaxValue)]
        public int ProtonQuantity { get; set; }
        [Range(0, int.MaxValue)]
        public int NeutronQuantity { get; set; }
        [Range(0, double.MaxValue)]
        public double AtomicRadius { get; set; }
        [Range(0, double.MaxValue)]
        public double Electronegativity { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string Category { get; set; }
        [Range(0, int.MaxValue)]
        public int EnergyLevels { get; set; }
        [Range(0, int.MaxValue)]
        public int MeltingTemperature { get; set; }
        [Range(0, int.MaxValue)]
        public int BoilingTemperature { get; set; }
        public bool IsLocked { get; set; }
        public string Info { get; set; }
        public string ImgSymbol { get; set; }
        public string ImgAtom { get; set; }
        [Range(0, int.MaxValue)]
        public int Group { get; set; }
    }
}