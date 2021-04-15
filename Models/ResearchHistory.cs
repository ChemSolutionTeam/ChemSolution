using System;

namespace ChemSolution.Models
{
    public class ResearchHistory
    {
        public string UserEmail { set; get; }
        public int MaterialId { set; get; }
        public DateTime DateTime { set; get; }
    }
}