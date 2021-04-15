using System.Collections.Generic;

namespace ChemSolution.Models
{
    public class MaterialGroup
    {
        public int MaterialGroupId { set; get; }
        public List<Material> Materials { set; get; } = new List<Material>();
        public List<Achievement> Achievement { set; get; } = new List<Achievement>();
        public string GroupName { set; get; }
    }
}