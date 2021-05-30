namespace ChemSolution.Services.Pay
{
    public class PayOptions
    {
        public string Version { get; set; }
        public string Amount { get; set; }
        public string Currency { get; set; }
        public string Description { get; set; }
        public string OrderId { get; set; }
    }
}