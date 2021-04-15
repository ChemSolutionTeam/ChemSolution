using Microsoft.EntityFrameworkCore.Migrations;

namespace ChemSolution.Migrations
{
    public partial class Fix2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievement_Condition_ConditionId",
                table: "Achievement");

            migrationBuilder.DropTable(
                name: "Condition");

            migrationBuilder.RenameColumn(
                name: "ConditionId",
                table: "Achievement",
                newName: "MaterialGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_Achievement_ConditionId",
                table: "Achievement",
                newName: "IX_Achievement_MaterialGroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_Achievement_MaterialGroup_MaterialGroupId",
                table: "Achievement",
                column: "MaterialGroupId",
                principalTable: "MaterialGroup",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievement_MaterialGroup_MaterialGroupId",
                table: "Achievement");

            migrationBuilder.RenameColumn(
                name: "MaterialGroupId",
                table: "Achievement",
                newName: "ConditionId");

            migrationBuilder.RenameIndex(
                name: "IX_Achievement_MaterialGroupId",
                table: "Achievement",
                newName: "IX_Achievement_ConditionId");

            migrationBuilder.CreateTable(
                name: "Condition",
                columns: table => new
                {
                    ConditionId = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    CountGoal = table.Column<int>(type: "INTEGER", nullable: false),
                    MaterialGroupId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Condition", x => x.ConditionId);
                    table.ForeignKey(
                        name: "FK_Condition_MaterialGroup_MaterialGroupId",
                        column: x => x.MaterialGroupId,
                        principalTable: "MaterialGroup",
                        principalColumn: "MaterialGroupId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Condition_MaterialGroupId",
                table: "Condition",
                column: "MaterialGroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_Achievement_Condition_ConditionId",
                table: "Achievement",
                column: "ConditionId",
                principalTable: "Condition",
                principalColumn: "ConditionId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
