using System.Collections.Generic;

namespace ChemSolution.Models
{
    public class Status
    {
        public int StatusId { set; get; }
        public List<Request> Requests { set; get; } = new List<Request>();
        public string StatusName { set; get; }
    }
}