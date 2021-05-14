using System.Collections.Generic;

namespace ChemSolution.Models.BufferModels.ResponseModels
{
    public class SearchMaterialResponse
    {
        public int ResultMaterialId { set; get;}
        public bool IsNew { get; set; }
        
        public List<int> NewAchievementsId { get; set; } = new List<int>();
    }
}