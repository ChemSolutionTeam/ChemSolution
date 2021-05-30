using System;
using System.ComponentModel.DataAnnotations;

namespace ChemSolution.Models
{
    public class Order
    {
        [Key]
        public string OrderId { set; get; }
        [Range(0, Int32.MaxValue)]
        public int CoinsAmount { set; get; }
        public User User { set; get; }
        public string Data { set; get; }
        public string Signature { set; get;}
        public DateTime DateTime { set; get; } = DateTime.UtcNow;
    }
}