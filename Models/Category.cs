using System.Collections.Generic;

namespace ChemSolution.Models
{
    public class Category
    {
        public int CategoryId { set; get; }
        public List<Element> Elements { set; get; } = new List<Element>();
        public string CategoryName { set; get; }
    }
}