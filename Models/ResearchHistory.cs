using System;
using System.Collections.Generic;

namespace ChemSolution.Models
{
    public class ResearchHistory
    {
        public string UserEmail { set; get; }
        public int? MaterialId { set; get; }
        public Material Material { set; get; }
        public User User { set; get; }
        public DateTime DateTime { set; get; }
    }
}