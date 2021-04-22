using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Achievement
    {
        [Key]
        public int AchievementId { get; set; }
        [StringLength(50, MinimumLength = 5)]
        public string Heading { get; set; }
        [StringLength(100, MinimumLength = 1)]
        public string Description { get; set; }
        [Range(0, int.MaxValue)]
        public int MoneyReward { get; set; }
        [Range(0, int.MaxValue)]
        public int RatingReward { get; set; }
        [Range(0, int.MaxValue)]
        public int CountGoal { get; set; }
        public string ImgAchievemen { set; get; }
        public int MaterialGroupId { get; set; }
        public MaterialGroup Condition { get; set; }
        public List<User> Users { set; get; } = new List<User>();
    }
}