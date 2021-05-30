using System;
using System.Threading.Tasks;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Services.Pay;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MlkPwgen;

namespace ChemSolution.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class DonateController : ControllerBase
    {
        private readonly PayService _payService;
        private readonly DataContext _context;
    
        public DonateController(PayService payService, DataContext context)
        {
            _payService = payService;
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<PayButtonModel>> GetDonate(string amount)
        {
            var orderId = PasswordGenerator.Generate(length: 10, allowed: Sets.Alphanumerics);    
            var payButton = _payService.GetPayButton(new PayOptions(){ Amount = amount, 
                Currency = "UAH", Description = "Get game currency", Version = "3", OrderId = orderId});
            _context.Orders.Add(new Order()
            {
                CoinsAmount = Convert.ToInt32(amount), Data = payButton.Data, Signature = payButton.Signature,
                UserEmail = User.Identity.Name
            });
            await _context.SaveChangesAsync();
            return payButton;
        }
    }
}