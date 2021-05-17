﻿// <auto-generated />
using System;
using ChemSolution.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace ChemSolution.Migrations
{
    [DbContext(typeof(DataContext))]
    partial class DataContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "5.0.5");

            modelBuilder.Entity("AchievementUser", b =>
                {
                    b.Property<int>("AchievementId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UsersUserEmail")
                        .HasColumnType("TEXT");

                    b.HasKey("AchievementId", "UsersUserEmail");

                    b.HasIndex("UsersUserEmail");

                    b.ToTable("AchievementUser");
                });

            modelBuilder.Entity("BlogPostUser", b =>
                {
                    b.Property<int>("BlogPostsBlogPostId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UsersUserEmail")
                        .HasColumnType("TEXT");

                    b.HasKey("BlogPostsBlogPostId", "UsersUserEmail");

                    b.HasIndex("UsersUserEmail");

                    b.ToTable("BlogPostUser");
                });

            modelBuilder.Entity("ChemSolution.Models.Achievement", b =>
                {
                    b.Property<int>("AchievementId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("CountGoal")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Description")
                        .HasMaxLength(100)
                        .HasColumnType("TEXT");

                    b.Property<string>("Heading")
                        .HasMaxLength(50)
                        .HasColumnType("TEXT");

                    b.Property<string>("ImgAchievement")
                        .HasMaxLength(250)
                        .HasColumnType("TEXT");

                    b.Property<int?>("MaterialGroupId")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("MoneyReward")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("RatingReward")
                        .HasColumnType("INTEGER");

                    b.HasKey("AchievementId");

                    b.HasIndex("MaterialGroupId");

                    b.ToTable("Achievements");
                });

            modelBuilder.Entity("ChemSolution.Models.BlogPost", b =>
                {
                    b.Property<int>("BlogPostId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Category")
                        .HasColumnType("TEXT");

                    b.Property<string>("Image")
                        .HasColumnType("TEXT");

                    b.Property<string>("Information")
                        .HasColumnType("TEXT");

                    b.Property<bool>("IsLocked")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Title")
                        .HasColumnType("TEXT");

                    b.HasKey("BlogPostId");

                    b.ToTable("BlogPosts");
                });

            modelBuilder.Entity("ChemSolution.Models.Category", b =>
                {
                    b.Property<int>("CategoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("CategoryName")
                        .HasColumnType("TEXT");

                    b.HasKey("CategoryId");

                    b.ToTable("Categories");
                });

            modelBuilder.Entity("ChemSolution.Models.Element", b =>
                {
                    b.Property<int>("ElementId")
                        .HasColumnType("INTEGER");

                    b.Property<double?>("AtomicRadius")
                        .HasColumnType("REAL");

                    b.Property<double?>("AtomicWeight")
                        .HasColumnType("REAL");

                    b.Property<int?>("BoilingTemperature")
                        .HasColumnType("INTEGER");

                    b.Property<int>("CategoryId")
                        .HasColumnType("INTEGER");

                    b.Property<double?>("Electronegativity")
                        .HasColumnType("REAL");

                    b.Property<int?>("EnergyLevels")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("Group")
                        .HasColumnType("INTEGER");

                    b.Property<string>("ImgAtom")
                        .HasColumnType("TEXT");

                    b.Property<string>("ImgSymbol")
                        .HasColumnType("TEXT");

                    b.Property<string>("Info")
                        .HasColumnType("TEXT");

                    b.Property<bool?>("IsLocked")
                        .HasColumnType("INTEGER");

                    b.Property<int?>("MeltingTemperature")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasMaxLength(50)
                        .HasColumnType("TEXT");

                    b.Property<int?>("NeutronQuantity")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Symbol")
                        .HasMaxLength(5)
                        .HasColumnType("TEXT");

                    b.HasKey("ElementId");

                    b.HasIndex("CategoryId");

                    b.ToTable("Elements");
                });

            modelBuilder.Entity("ChemSolution.Models.ElementMaterial", b =>
                {
                    b.Property<int>("ElementId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("MaterialId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("Amount")
                        .HasColumnType("INTEGER");

                    b.HasKey("ElementId", "MaterialId");

                    b.HasIndex("MaterialId");

                    b.ToTable("ElementMaterials");
                });

            modelBuilder.Entity("ChemSolution.Models.Material", b =>
                {
                    b.Property<int>("MaterialId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Formula")
                        .HasMaxLength(50)
                        .HasColumnType("TEXT");

                    b.Property<string>("Image")
                        .HasColumnType("TEXT");

                    b.Property<string>("Info")
                        .HasColumnType("TEXT");

                    b.Property<int?>("MaterialGroupId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasMaxLength(50)
                        .HasColumnType("TEXT");

                    b.HasKey("MaterialId");

                    b.HasIndex("MaterialGroupId");

                    b.ToTable("Materials");
                });

            modelBuilder.Entity("ChemSolution.Models.MaterialGroup", b =>
                {
                    b.Property<int>("MaterialGroupId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("GroupName")
                        .HasColumnType("TEXT");

                    b.HasKey("MaterialGroupId");

                    b.ToTable("MaterialGroups");
                });

            modelBuilder.Entity("ChemSolution.Models.Request", b =>
                {
                    b.Property<string>("UserEmail")
                        .HasColumnType("TEXT");

                    b.Property<DateTime>("DateTimeSended")
                        .HasColumnType("TEXT");

                    b.Property<int>("StatusId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Text")
                        .HasColumnType("TEXT");

                    b.Property<string>("Theme")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserEmail1")
                        .HasColumnType("TEXT");

                    b.HasKey("UserEmail", "DateTimeSended");

                    b.HasIndex("StatusId");

                    b.HasIndex("UserEmail1");

                    b.ToTable("Requests");
                });

            modelBuilder.Entity("ChemSolution.Models.ResearchHistory", b =>
                {
                    b.Property<string>("UserEmail")
                        .HasColumnType("TEXT");

                    b.Property<int?>("MaterialId")
                        .HasColumnType("INTEGER");

                    b.Property<DateTime>("DateTime")
                        .HasColumnType("TEXT");

                    b.HasKey("UserEmail", "MaterialId");

                    b.HasIndex("MaterialId");

                    b.ToTable("ResearchHistorys");
                });

            modelBuilder.Entity("ChemSolution.Models.Status", b =>
                {
                    b.Property<int>("StatusId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("StatusName")
                        .HasColumnType("TEXT");

                    b.HasKey("StatusId");

                    b.ToTable("Status");
                });

            modelBuilder.Entity("ChemSolution.Models.User", b =>
                {
                    b.Property<string>("UserEmail")
                        .HasColumnType("TEXT");

                    b.Property<int?>("Balance")
                        .HasColumnType("INTEGER");

                    b.Property<DateTime>("DateOfBirth")
                        .HasColumnType("TEXT");

                    b.Property<int?>("Honesty")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Password")
                        .HasMaxLength(50)
                        .HasColumnType("TEXT");

                    b.Property<int?>("Rating")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Role")
                        .HasColumnType("TEXT");

                    b.Property<string>("UserName")
                        .HasMaxLength(50)
                        .HasColumnType("TEXT");

                    b.HasKey("UserEmail");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("ChemSolution.Models.Valence", b =>
                {
                    b.Property<int?>("ElementId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("ValenceVal")
                        .HasColumnType("INTEGER");

                    b.HasKey("ElementId", "ValenceVal");

                    b.ToTable("Valences");
                });

            modelBuilder.Entity("ElementUser", b =>
                {
                    b.Property<int>("ElementsElementId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("UsersUserEmail")
                        .HasColumnType("TEXT");

                    b.HasKey("ElementsElementId", "UsersUserEmail");

                    b.HasIndex("UsersUserEmail");

                    b.ToTable("ElementUser");
                });

            modelBuilder.Entity("AchievementUser", b =>
                {
                    b.HasOne("ChemSolution.Models.Achievement", null)
                        .WithMany()
                        .HasForeignKey("AchievementId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChemSolution.Models.User", null)
                        .WithMany()
                        .HasForeignKey("UsersUserEmail")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("BlogPostUser", b =>
                {
                    b.HasOne("ChemSolution.Models.BlogPost", null)
                        .WithMany()
                        .HasForeignKey("BlogPostsBlogPostId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChemSolution.Models.User", null)
                        .WithMany()
                        .HasForeignKey("UsersUserEmail")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("ChemSolution.Models.Achievement", b =>
                {
                    b.HasOne("ChemSolution.Models.MaterialGroup", "MaterialGroup")
                        .WithMany("Achievement")
                        .HasForeignKey("MaterialGroupId");

                    b.Navigation("MaterialGroup");
                });

            modelBuilder.Entity("ChemSolution.Models.Element", b =>
                {
                    b.HasOne("ChemSolution.Models.Category", "Category")
                        .WithMany("Elements")
                        .HasForeignKey("CategoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Category");
                });

            modelBuilder.Entity("ChemSolution.Models.ElementMaterial", b =>
                {
                    b.HasOne("ChemSolution.Models.Element", "Element")
                        .WithMany("ElementMaterials")
                        .HasForeignKey("ElementId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChemSolution.Models.Material", "Material")
                        .WithMany("ElementMaterials")
                        .HasForeignKey("MaterialId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Element");

                    b.Navigation("Material");
                });

            modelBuilder.Entity("ChemSolution.Models.Material", b =>
                {
                    b.HasOne("ChemSolution.Models.MaterialGroup", "MaterialGroup")
                        .WithMany("Materials")
                        .HasForeignKey("MaterialGroupId");

                    b.Navigation("MaterialGroup");
                });

            modelBuilder.Entity("ChemSolution.Models.Request", b =>
                {
                    b.HasOne("ChemSolution.Models.Status", "Status")
                        .WithMany("Requests")
                        .HasForeignKey("StatusId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChemSolution.Models.User", "User")
                        .WithMany("Requests")
                        .HasForeignKey("UserEmail1");

                    b.Navigation("Status");

                    b.Navigation("User");
                });

            modelBuilder.Entity("ChemSolution.Models.ResearchHistory", b =>
                {
                    b.HasOne("ChemSolution.Models.Material", "Material")
                        .WithMany("ResearchHistories")
                        .HasForeignKey("MaterialId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChemSolution.Models.User", "User")
                        .WithMany("ResearchHistorys")
                        .HasForeignKey("UserEmail")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Material");

                    b.Navigation("User");
                });

            modelBuilder.Entity("ChemSolution.Models.Valence", b =>
                {
                    b.HasOne("ChemSolution.Models.Element", "Element")
                        .WithMany("Valences")
                        .HasForeignKey("ElementId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Element");
                });

            modelBuilder.Entity("ElementUser", b =>
                {
                    b.HasOne("ChemSolution.Models.Element", null)
                        .WithMany()
                        .HasForeignKey("ElementsElementId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("ChemSolution.Models.User", null)
                        .WithMany()
                        .HasForeignKey("UsersUserEmail")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("ChemSolution.Models.Category", b =>
                {
                    b.Navigation("Elements");
                });

            modelBuilder.Entity("ChemSolution.Models.Element", b =>
                {
                    b.Navigation("ElementMaterials");

                    b.Navigation("Valences");
                });

            modelBuilder.Entity("ChemSolution.Models.Material", b =>
                {
                    b.Navigation("ElementMaterials");

                    b.Navigation("ResearchHistories");
                });

            modelBuilder.Entity("ChemSolution.Models.MaterialGroup", b =>
                {
                    b.Navigation("Achievement");

                    b.Navigation("Materials");
                });

            modelBuilder.Entity("ChemSolution.Models.Status", b =>
                {
                    b.Navigation("Requests");
                });

            modelBuilder.Entity("ChemSolution.Models.User", b =>
                {
                    b.Navigation("Requests");

                    b.Navigation("ResearchHistorys");
                });
#pragma warning restore 612, 618
        }
    }
}
