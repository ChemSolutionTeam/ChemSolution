using System;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Request
    {
        [EmailAddress]
        public string UserEmail { set; get; }
        [DataType(DataType.DateTime)]
        public DateTime DateTimeSended { set; get; }
        public string Theme { set; get; }
        public string Text { set; get; }
        public bool? Status { set; get; }
        public User User { set; get; }
    }
}