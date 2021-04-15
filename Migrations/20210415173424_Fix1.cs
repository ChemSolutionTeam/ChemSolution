using Microsoft.EntityFrameworkCore.Migrations;

namespace ChemSolution.Migrations
{
    public partial class Fix1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "AchievementId",
                table: "Condition",
                newName: "ConditionId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ConditionId",
                table: "Condition",
                newName: "AchievementId");
        }
    }
}
