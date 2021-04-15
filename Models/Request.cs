using System;

namespace ChemSolution.Models
{
    public class Request
    {
        public string UserEmail { set; get; }
        public DateTime DateTimeSended { set; get; }
        public string Theme { set; get; }
        public string Text { set; get; }
    }
}