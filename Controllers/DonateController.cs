using System;
using System.Threading.Tasks;
using ChemSolution.Data;
using ChemSolution.Models;
using ChemSolution.Models.BufferModels;
using ChemSolution.Services.Pay;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MlkPwgen;

namespace ChemSolution.Controllers
{
    [Route("[controller]")]
    [ApiController]
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
        [Authorize]
        public async Task<ActionResult<PayButtonModel>> GetDonate(int amount)
        {
            var orderId = PasswordGenerator.Generate(length: 10, allowed: Sets.Alphanumerics);    
            var payButton = _payService.GetPayButton(new PayOptions(){ Amount = amount.ToString(), 
                Currency = "UAH", Description = "Get game currency", Version = "3", OrderId = orderId});
            _context.Orders.Add(new Order()
            {
                OrderId = orderId, CoinsAmount = amount, Data = payButton.Data, Signature = payButton.Signature, User = await _context.Users.FindAsync(User.Identity.Name)
            });
            await _context.SaveChangesAsync();
            return payButton;
        }

        [HttpPost]
        public async Task<ActionResult> Post(LiqPayAnswer answer)
        {
            var order = await _context.Orders.Include(o=>o.User).SingleOrDefaultAsync(o =>
                o.Data == answer.Data && o.Signature == answer.Signature);
            if (order != null)
            {
                // do later checking status
                if (order.User.Balance != null)
                {
                    order.User.Balance += order.CoinsAmount;
                }
                else
                {
                    order.User.Balance = order.CoinsAmount;
                }
                _context.Orders.Remove(order);
                await _context.SaveChangesAsync();
                return Ok();
            }
            return BadRequest();
        }
        
        
    }
}