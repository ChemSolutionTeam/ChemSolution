using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ChemSolution.Migrations
{
    public partial class Initial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BlogPost",
                columns: table => new
                {
                    BlogPostId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Title = table.Column<string>(type: "TEXT", nullable: true),
                    Category = table.Column<string>(type: "TEXT", nullable: true),
                    Information = table.Column<string>(type: "TEXT", nullable: true),
                    Image = table.Column<string>(type: "TEXT", nullable: true),
                    IsLocked = table.Column<bool>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BlogPost", x => x.BlogPostId);
                });

            migrationBuilder.CreateTable(
                name: "MaterialGroup",
                columns: table => new
                {
                    MaterialGroupId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    GroupName = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MaterialGroup", x => x.MaterialGroupId);
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    UserEmail = table.Column<string>(type: "TEXT", nullable: false),
                    UserName = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    Password = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    Balance = table.Column<int>(type: "INTEGER", nullable: false),
                    Rating = table.Column<int>(type: "INTEGER", nullable: false),
                    Honesty = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_User", x => x.UserEmail);
                });

            migrationBuilder.CreateTable(
                name: "Condition",
                columns: table => new
                {
                    AchievementId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    MaterialGroupId = table.Column<int>(type: "INTEGER", nullable: false),
                    CountGoal = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Condition", x => x.AchievementId);
                    table.ForeignKey(
                        name: "FK_Condition_MaterialGroup_MaterialGroupId",
                        column: x => x.MaterialGroupId,
                        principalTable: "MaterialGroup",
                        principalColumn: "MaterialGroupId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Material",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Image = table.Column<string>(type: "TEXT", nullable: true),
                    Formula = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    Info = table.Column<string>(type: "TEXT", nullable: true),
                    MaterialGroupId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Material", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Material_MaterialGroup_MaterialGroupId",
                        column: x => x.MaterialGroupId,
                        principalTable: "MaterialGroup",
                        principalColumn: "MaterialGroupId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BlogPostUser",
                columns: table => new
                {
                    BlogPostsBlogPostId = table.Column<int>(type: "INTEGER", nullable: false),
                    UsersUserEmail = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BlogPostUser", x => new { x.BlogPostsBlogPostId, x.UsersUserEmail });
                    table.ForeignKey(
                        name: "FK_BlogPostUser_BlogPost_BlogPostsBlogPostId",
                        column: x => x.BlogPostsBlogPostId,
                        principalTable: "BlogPost",
                        principalColumn: "BlogPostId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BlogPostUser_User_UsersUserEmail",
                        column: x => x.UsersUserEmail,
                        principalTable: "User",
                        principalColumn: "UserEmail",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Element",
                columns: table => new
                {
                    ElementId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Symbol = table.Column<string>(type: "TEXT", maxLength: 5, nullable: true),
                    Name = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    AtomicWeight = table.Column<double>(type: "REAL", nullable: false),
                    ElectronQuantity = table.Column<int>(type: "INTEGER", nullable: false),
                    ProtonQuantity = table.Column<int>(type: "INTEGER", nullable: false),
                    NeutronQuantity = table.Column<int>(type: "INTEGER", nullable: false),
                    AtomicRadius = table.Column<double>(type: "REAL", nullable: false),
                    Electronegativity = table.Column<double>(type: "REAL", nullable: false),
                    Category = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    EnergyLevels = table.Column<int>(type: "INTEGER", nullable: false),
                    MeltingTemperature = table.Column<int>(type: "INTEGER", nullable: false),
                    BoilingTemperature = table.Column<int>(type: "INTEGER", nullable: false),
                    IsLocked = table.Column<bool>(type: "INTEGER", nullable: false),
                    Info = table.Column<string>(type: "TEXT", nullable: true),
                    ImgSymbol = table.Column<string>(type: "TEXT", nullable: true),
                    ImgAtom = table.Column<string>(type: "TEXT", nullable: true),
                    Group = table.Column<int>(type: "INTEGER", nullable: false),
                    UserEmail = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Element", x => x.ElementId);
                    table.ForeignKey(
                        name: "FK_Element_User_UserEmail",
                        column: x => x.UserEmail,
                        principalTable: "User",
                        principalColumn: "UserEmail",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Request",
                columns: table => new
                {
                    UserEmail = table.Column<string>(type: "TEXT", nullable: false),
                    DateTimeSended = table.Column<DateTime>(type: "TEXT", nullable: false),
                    Theme = table.Column<string>(type: "TEXT", nullable: true),
                    Text = table.Column<string>(type: "TEXT", nullable: true),
                    UserEmail1 = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Request", x => new { x.UserEmail, x.DateTimeSended });
                    table.ForeignKey(
                        name: "FK_Request_User_UserEmail1",
                        column: x => x.UserEmail1,
                        principalTable: "User",
                        principalColumn: "UserEmail",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Achievement",
                columns: table => new
                {
                    AchievementId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Heading = table.Column<string>(type: "TEXT", maxLength: 50, nullable: true),
                    Description = table.Column<string>(type: "TEXT", maxLength: 100, nullable: true),
                    MoneyReward = table.Column<int>(type: "INTEGER", nullable: false),
                    RatingReward = table.Column<int>(type: "INTEGER", nullable: false),
                    ConditionId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Achievement", x => x.AchievementId);
                    table.ForeignKey(
                        name: "FK_Achievement_Condition_ConditionId",
                        column: x => x.ConditionId,
                        principalTable: "Condition",
                        principalColumn: "AchievementId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ResearchHistorys",
                columns: table => new
                {
                    UserEmail = table.Column<string>(type: "TEXT", nullable: false),
                    MaterialId = table.Column<int>(type: "INTEGER", nullable: false),
                    DateTime = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ResearchHistorys", x => new { x.UserEmail, x.MaterialId });
                    table.ForeignKey(
                        name: "FK_ResearchHistorys_Material_MaterialId",
                        column: x => x.MaterialId,
                        principalTable: "Material",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ResearchHistorys_User_UserEmail",
                        column: x => x.UserEmail,
                        principalTable: "User",
                        principalColumn: "UserEmail",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ElementMaterials",
                columns: table => new
                {
                    MaterialId = table.Column<int>(type: "INTEGER", nullable: false),
                    ElementId = table.Column<int>(type: "INTEGER", nullable: false),
                    Amount = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ElementMaterials", x => new { x.ElementId, x.MaterialId });
                    table.ForeignKey(
                        name: "FK_ElementMaterials_Element_ElementId",
                        column: x => x.ElementId,
                        principalTable: "Element",
                        principalColumn: "ElementId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ElementMaterials_Material_MaterialId",
                        column: x => x.MaterialId,
                        principalTable: "Material",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Valence",
                columns: table => new
                {
                    ElementId = table.Column<int>(type: "INTEGER", nullable: false),
                    ValenceVal = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Valence", x => new { x.ElementId, x.ValenceVal });
                    table.ForeignKey(
                        name: "FK_Valence_Element_ElementId",
                        column: x => x.ElementId,
                        principalTable: "Element",
                        principalColumn: "ElementId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AchievementUser",
                columns: table => new
                {
                    AchievementId = table.Column<int>(type: "INTEGER", nullable: false),
                    UsersUserEmail = table.Column<string>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AchievementUser", x => new { x.AchievementId, x.UsersUserEmail });
                    table.ForeignKey(
                        name: "FK_AchievementUser_Achievement_AchievementId",
                        column: x => x.AchievementId,
                        principalTable: "Achievement",
                        principalColumn: "AchievementId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AchievementUser_User_UsersUserEmail",
                        column: x => x.UsersUserEmail,
                        principalTable: "User",
                        principalColumn: "UserEmail",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Achievement_ConditionId",
                table: "Achievement",
                column: "ConditionId");

            migrationBuilder.CreateIndex(
                name: "IX_AchievementUser_UsersUserEmail",
                table: "AchievementUser",
                column: "UsersUserEmail");

            migrationBuilder.CreateIndex(
                name: "IX_BlogPostUser_UsersUserEmail",
                table: "BlogPostUser",
                column: "UsersUserEmail");

            migrationBuilder.CreateIndex(
                name: "IX_Condition_MaterialGroupId",
                table: "Condition",
                column: "MaterialGroupId");

            migrationBuilder.CreateIndex(
                name: "IX_Element_UserEmail",
                table: "Element",
                column: "UserEmail");

            migrationBuilder.CreateIndex(
                name: "IX_ElementMaterials_MaterialId",
                table: "ElementMaterials",
                column: "MaterialId");

            migrationBuilder.CreateIndex(
                name: "IX_Material_MaterialGroupId",
                table: "Material",
                column: "MaterialGroupId");

            migrationBuilder.CreateIndex(
                name: "IX_Request_UserEmail1",
                table: "Request",
                column: "UserEmail1");

            migrationBuilder.CreateIndex(
                name: "IX_ResearchHistorys_MaterialId",
                table: "ResearchHistorys",
                column: "MaterialId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AchievementUser");

            migrationBuilder.DropTable(
                name: "BlogPostUser");

            migrationBuilder.DropTable(
                name: "ElementMaterials");

            migrationBuilder.DropTable(
                name: "Request");

            migrationBuilder.DropTable(
                name: "ResearchHistorys");

            migrationBuilder.DropTable(
                name: "Valence");

            migrationBuilder.DropTable(
                name: "Achievement");

            migrationBuilder.DropTable(
                name: "BlogPost");

            migrationBuilder.DropTable(
                name: "Material");

            migrationBuilder.DropTable(
                name: "Element");

            migrationBuilder.DropTable(
                name: "Condition");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "MaterialGroup");
        }
    }
}
