using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class User
    {
        [Key]
        [EmailAddress]
        public string UserEmail { set; get; }
        [StringLength(50, MinimumLength = 3)]
        public string UserName { set; get; }
        public DateTime DateOfBirth { set; get; }
        [StringLength(50,MinimumLength = 8)]
        public string Password { set; get; }
        [Range(0, int.MaxValue)] 
        public int Balance { set; get; }
        [Range(0, int.MaxValue)]
        public int Rating { set; get; }
        [Range(0, int.MaxValue)]
        public int Honesty { set; get; }
        public string Role { set; get; } = Startup.Roles.User; 
        public List<BlogPost> BlogPosts { set; get; } = new List<BlogPost>();
        public List<Achievement> Achievement { set; get; } = new List<Achievement>();
        public List<Element> Elements { set; get; } = new List<Element>();
        public List<Request> Requests { set; get; } = new List<Request>();
        public List<ResearchHistory> ResearchHistorys { set; get; } = new List<ResearchHistory>();
        public List<Material> Materials { set; get; } = new List<Material>();
        public List<Order> Orders { set; get; } = new List<Order>();
    }
}