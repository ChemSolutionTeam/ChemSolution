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
        public int StatusId { get; set; }
        public Status Status { get; set; }
        public User User { set; get; }
    }
}