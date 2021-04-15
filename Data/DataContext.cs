using Microsoft.EntityFrameworkCore;

namespace ChemSolution.Data
{
    public class DataContext:DbContext
    {
        public DataContext(DbContextOptions<DataContext> options):base(options)
        {
            
        }
        
    }
}