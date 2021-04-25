using Microsoft.EntityFrameworkCore.Migrations;

namespace ChemSolution.Migrations
{
    public partial class Fix7 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievements_MaterialGroups_MaterialGroupId",
                table: "Achievements");

            migrationBuilder.AlterColumn<int>(
                name: "MaterialGroupId",
                table: "Achievements",
                type: "INTEGER",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "INTEGER");

            migrationBuilder.AddForeignKey(
                name: "FK_Achievements_MaterialGroups_MaterialGroupId",
                table: "Achievements",
                column: "MaterialGroupId",
                principalTable: "MaterialGroups",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievements_MaterialGroups_MaterialGroupId",
                table: "Achievements");

            migrationBuilder.AlterColumn<int>(
                name: "MaterialGroupId",
                table: "Achievements",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "INTEGER",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Achievements_MaterialGroups_MaterialGroupId",
                table: "Achievements",
                column: "MaterialGroupId",
                principalTable: "MaterialGroups",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
