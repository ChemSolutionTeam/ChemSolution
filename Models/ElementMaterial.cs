﻿using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class ElementMaterial
    {
        public int MaterialId { get; set; }
        public Material Material { get; set; }
        public int ElementId { get; set; }
        public Element Element { get; set; }
        [Range(0, int.MaxValue)]
        public int Amount { get; set; }
    }
}