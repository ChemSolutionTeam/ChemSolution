using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class BlogPost
    {
        [Key] 
        public int BlogPostId { set; get; }
        public string Title { set; get; }
        public string Category { set; get; }
        public string Information { set; get; }
        public string Image { set; get; }
        public bool IsLocked { set; get; }
        public List<User> Users { set; get; } = new List<User>();
    }
}