using ChemSolution.Models;
using Microsoft.EntityFrameworkCore;

namespace ChemSolution.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
            
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
            modelBuilder.Entity<Request>()
                .HasKey(t => new {t.UserEmail, t.DateTimeSended});

            modelBuilder.Entity<Valence>()
                .HasKey(t => new {t.ElementId, t.ValenceVal});
            
            
            //Start ElementMaterial
            modelBuilder
                .Entity<Element>()
                .HasMany(c => c.Materials)
                .WithMany(s => s.Elements)
                .UsingEntity<ElementMaterial>(
                j => j
                    .HasOne(pt => pt.Material)
                    .WithMany(t => t.ElementMaterials)
                    .HasForeignKey(pt => pt.MaterialId),
                j => j
                    .HasOne(pt => pt.Element)
                    .WithMany(p => p.ElementMaterials)
                    .HasForeignKey(pt => pt.ElementId),
                j =>
                {
                    j.HasKey(t => new { t.ElementId, t.MaterialId });
                    j.ToTable("ElementMaterials");
                });
            //End ElementMaterial
            
            //Start ResearchHistorys
            modelBuilder
                .Entity<User>()
                .HasMany(c => c.Materials)
                .WithMany(s => s.Users)
                .UsingEntity<ResearchHistory>(
            j => j
                .HasOne(pt => pt.Material)
                .WithMany(t => t.ResearchHistories)
               .HasForeignKey(pt => pt.MaterialId),
            j => j
                .HasOne(pt => pt.User)
                .WithMany(p => p.ResearchHistorys)
                .HasForeignKey(pt => pt.UserEmail),   
            j =>
                {
                    j.HasKey(t => new { t.UserEmail, t.MaterialId });
                    j.ToTable("ResearchHistorys");
                });
            //End ResearchHistorys
            
            
            
            
        }
    }
}