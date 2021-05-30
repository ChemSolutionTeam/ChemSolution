using System;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Order
    {
        public int OrderId { set; get; }
        [Range(0, Int32.MaxValue)]
        public int CoinsAmount { set; get; }
        public string UserEmail { set; get; }
        public User User { set; get; }
        public string Data { set; get; }
        public string Signature { set; get;}
    }
}