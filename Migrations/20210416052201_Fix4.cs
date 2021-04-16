using Microsoft.EntityFrameworkCore.Migrations;

namespace ChemSolution.Migrations
{
    public partial class Fix4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievement_MaterialGroup_MaterialGroupId",
                table: "Achievement");

            migrationBuilder.DropForeignKey(
                name: "FK_AchievementUser_Achievement_AchievementId",
                table: "AchievementUser");

            migrationBuilder.DropForeignKey(
                name: "FK_AchievementUser_User_UsersUserEmail",
                table: "AchievementUser");

            migrationBuilder.DropForeignKey(
                name: "FK_BlogPostUser_BlogPost_BlogPostsBlogPostId",
                table: "BlogPostUser");

            migrationBuilder.DropForeignKey(
                name: "FK_BlogPostUser_User_UsersUserEmail",
                table: "BlogPostUser");

            migrationBuilder.DropForeignKey(
                name: "FK_Element_User_UserEmail",
                table: "Element");

            migrationBuilder.DropForeignKey(
                name: "FK_ElementMaterials_Element_ElementId",
                table: "ElementMaterials");

            migrationBuilder.DropForeignKey(
                name: "FK_ElementMaterials_Material_MaterialId",
                table: "ElementMaterials");

            migrationBuilder.DropForeignKey(
                name: "FK_Material_MaterialGroup_MaterialGroupId",
                table: "Material");

            migrationBuilder.DropForeignKey(
                name: "FK_Request_User_UserEmail1",
                table: "Request");

            migrationBuilder.DropForeignKey(
                name: "FK_ResearchHistorys_Material_MaterialId",
                table: "ResearchHistorys");

            migrationBuilder.DropForeignKey(
                name: "FK_ResearchHistorys_User_UserEmail",
                table: "ResearchHistorys");

            migrationBuilder.DropForeignKey(
                name: "FK_Valence_Element_ElementId",
                table: "Valence");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Valence",
                table: "Valence");

            migrationBuilder.DropPrimaryKey(
                name: "PK_User",
                table: "User");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Request",
                table: "Request");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MaterialGroup",
                table: "MaterialGroup");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Material",
                table: "Material");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Element",
                table: "Element");

            migrationBuilder.DropPrimaryKey(
                name: "PK_BlogPost",
                table: "BlogPost");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Achievement",
                table: "Achievement");

            migrationBuilder.RenameTable(
                name: "Valence",
                newName: "Valences");

            migrationBuilder.RenameTable(
                name: "User",
                newName: "Users");

            migrationBuilder.RenameTable(
                name: "Request",
                newName: "Requests");

            migrationBuilder.RenameTable(
                name: "MaterialGroup",
                newName: "MaterialGroups");

            migrationBuilder.RenameTable(
                name: "Material",
                newName: "Materials");

            migrationBuilder.RenameTable(
                name: "Element",
                newName: "Elements");

            migrationBuilder.RenameTable(
                name: "BlogPost",
                newName: "BlogPosts");

            migrationBuilder.RenameTable(
                name: "Achievement",
                newName: "Achievements");

            migrationBuilder.RenameIndex(
                name: "IX_Request_UserEmail1",
                table: "Requests",
                newName: "IX_Requests_UserEmail1");

            migrationBuilder.RenameIndex(
                name: "IX_Material_MaterialGroupId",
                table: "Materials",
                newName: "IX_Materials_MaterialGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_Element_UserEmail",
                table: "Elements",
                newName: "IX_Elements_UserEmail");

            migrationBuilder.RenameIndex(
                name: "IX_Achievement_MaterialGroupId",
                table: "Achievements",
                newName: "IX_Achievements_MaterialGroupId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Valences",
                table: "Valences",
                columns: new[] { "ElementId", "ValenceVal" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_Users",
                table: "Users",
                column: "UserEmail");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Requests",
                table: "Requests",
                columns: new[] { "UserEmail", "DateTimeSended" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_MaterialGroups",
                table: "MaterialGroups",
                column: "MaterialGroupId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Materials",
                table: "Materials",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Elements",
                table: "Elements",
                column: "ElementId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_BlogPosts",
                table: "BlogPosts",
                column: "BlogPostId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Achievements",
                table: "Achievements",
                column: "AchievementId");

            migrationBuilder.AddForeignKey(
                name: "FK_Achievements_MaterialGroups_MaterialGroupId",
                table: "Achievements",
                column: "MaterialGroupId",
                principalTable: "MaterialGroups",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_AchievementUser_Achievements_AchievementId",
                table: "AchievementUser",
                column: "AchievementId",
                principalTable: "Achievements",
                principalColumn: "AchievementId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_AchievementUser_Users_UsersUserEmail",
                table: "AchievementUser",
                column: "UsersUserEmail",
                principalTable: "Users",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_BlogPostUser_BlogPosts_BlogPostsBlogPostId",
                table: "BlogPostUser",
                column: "BlogPostsBlogPostId",
                principalTable: "BlogPosts",
                principalColumn: "BlogPostId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_BlogPostUser_Users_UsersUserEmail",
                table: "BlogPostUser",
                column: "UsersUserEmail",
                principalTable: "Users",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ElementMaterials_Elements_ElementId",
                table: "ElementMaterials",
                column: "ElementId",
                principalTable: "Elements",
                principalColumn: "ElementId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ElementMaterials_Materials_MaterialId",
                table: "ElementMaterials",
                column: "MaterialId",
                principalTable: "Materials",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Elements_Users_UserEmail",
                table: "Elements",
                column: "UserEmail",
                principalTable: "Users",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Materials_MaterialGroups_MaterialGroupId",
                table: "Materials",
                column: "MaterialGroupId",
                principalTable: "MaterialGroups",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Requests_Users_UserEmail1",
                table: "Requests",
                column: "UserEmail1",
                principalTable: "Users",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ResearchHistorys_Materials_MaterialId",
                table: "ResearchHistorys",
                column: "MaterialId",
                principalTable: "Materials",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ResearchHistorys_Users_UserEmail",
                table: "ResearchHistorys",
                column: "UserEmail",
                principalTable: "Users",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Valences_Elements_ElementId",
                table: "Valences",
                column: "ElementId",
                principalTable: "Elements",
                principalColumn: "ElementId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Achievements_MaterialGroups_MaterialGroupId",
                table: "Achievements");

            migrationBuilder.DropForeignKey(
                name: "FK_AchievementUser_Achievements_AchievementId",
                table: "AchievementUser");

            migrationBuilder.DropForeignKey(
                name: "FK_AchievementUser_Users_UsersUserEmail",
                table: "AchievementUser");

            migrationBuilder.DropForeignKey(
                name: "FK_BlogPostUser_BlogPosts_BlogPostsBlogPostId",
                table: "BlogPostUser");

            migrationBuilder.DropForeignKey(
                name: "FK_BlogPostUser_Users_UsersUserEmail",
                table: "BlogPostUser");

            migrationBuilder.DropForeignKey(
                name: "FK_ElementMaterials_Elements_ElementId",
                table: "ElementMaterials");

            migrationBuilder.DropForeignKey(
                name: "FK_ElementMaterials_Materials_MaterialId",
                table: "ElementMaterials");

            migrationBuilder.DropForeignKey(
                name: "FK_Elements_Users_UserEmail",
                table: "Elements");

            migrationBuilder.DropForeignKey(
                name: "FK_Materials_MaterialGroups_MaterialGroupId",
                table: "Materials");

            migrationBuilder.DropForeignKey(
                name: "FK_Requests_Users_UserEmail1",
                table: "Requests");

            migrationBuilder.DropForeignKey(
                name: "FK_ResearchHistorys_Materials_MaterialId",
                table: "ResearchHistorys");

            migrationBuilder.DropForeignKey(
                name: "FK_ResearchHistorys_Users_UserEmail",
                table: "ResearchHistorys");

            migrationBuilder.DropForeignKey(
                name: "FK_Valences_Elements_ElementId",
                table: "Valences");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Valences",
                table: "Valences");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Users",
                table: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Requests",
                table: "Requests");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Materials",
                table: "Materials");

            migrationBuilder.DropPrimaryKey(
                name: "PK_MaterialGroups",
                table: "MaterialGroups");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Elements",
                table: "Elements");

            migrationBuilder.DropPrimaryKey(
                name: "PK_BlogPosts",
                table: "BlogPosts");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Achievements",
                table: "Achievements");

            migrationBuilder.RenameTable(
                name: "Valences",
                newName: "Valence");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "User");

            migrationBuilder.RenameTable(
                name: "Requests",
                newName: "Request");

            migrationBuilder.RenameTable(
                name: "Materials",
                newName: "Material");

            migrationBuilder.RenameTable(
                name: "MaterialGroups",
                newName: "MaterialGroup");

            migrationBuilder.RenameTable(
                name: "Elements",
                newName: "Element");

            migrationBuilder.RenameTable(
                name: "BlogPosts",
                newName: "BlogPost");

            migrationBuilder.RenameTable(
                name: "Achievements",
                newName: "Achievement");

            migrationBuilder.RenameIndex(
                name: "IX_Requests_UserEmail1",
                table: "Request",
                newName: "IX_Request_UserEmail1");

            migrationBuilder.RenameIndex(
                name: "IX_Materials_MaterialGroupId",
                table: "Material",
                newName: "IX_Material_MaterialGroupId");

            migrationBuilder.RenameIndex(
                name: "IX_Elements_UserEmail",
                table: "Element",
                newName: "IX_Element_UserEmail");

            migrationBuilder.RenameIndex(
                name: "IX_Achievements_MaterialGroupId",
                table: "Achievement",
                newName: "IX_Achievement_MaterialGroupId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Valence",
                table: "Valence",
                columns: new[] { "ElementId", "ValenceVal" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_User",
                table: "User",
                column: "UserEmail");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Request",
                table: "Request",
                columns: new[] { "UserEmail", "DateTimeSended" });

            migrationBuilder.AddPrimaryKey(
                name: "PK_Material",
                table: "Material",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_MaterialGroup",
                table: "MaterialGroup",
                column: "MaterialGroupId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Element",
                table: "Element",
                column: "ElementId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_BlogPost",
                table: "BlogPost",
                column: "BlogPostId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Achievement",
                table: "Achievement",
                column: "AchievementId");

            migrationBuilder.AddForeignKey(
                name: "FK_Achievement_MaterialGroup_MaterialGroupId",
                table: "Achievement",
                column: "MaterialGroupId",
                principalTable: "MaterialGroup",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_AchievementUser_Achievement_AchievementId",
                table: "AchievementUser",
                column: "AchievementId",
                principalTable: "Achievement",
                principalColumn: "AchievementId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_AchievementUser_User_UsersUserEmail",
                table: "AchievementUser",
                column: "UsersUserEmail",
                principalTable: "User",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_BlogPostUser_BlogPost_BlogPostsBlogPostId",
                table: "BlogPostUser",
                column: "BlogPostsBlogPostId",
                principalTable: "BlogPost",
                principalColumn: "BlogPostId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_BlogPostUser_User_UsersUserEmail",
                table: "BlogPostUser",
                column: "UsersUserEmail",
                principalTable: "User",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Element_User_UserEmail",
                table: "Element",
                column: "UserEmail",
                principalTable: "User",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ElementMaterials_Element_ElementId",
                table: "ElementMaterials",
                column: "ElementId",
                principalTable: "Element",
                principalColumn: "ElementId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ElementMaterials_Material_MaterialId",
                table: "ElementMaterials",
                column: "MaterialId",
                principalTable: "Material",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Material_MaterialGroup_MaterialGroupId",
                table: "Material",
                column: "MaterialGroupId",
                principalTable: "MaterialGroup",
                principalColumn: "MaterialGroupId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Request_User_UserEmail1",
                table: "Request",
                column: "UserEmail1",
                principalTable: "User",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ResearchHistorys_Material_MaterialId",
                table: "ResearchHistorys",
                column: "MaterialId",
                principalTable: "Material",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_ResearchHistorys_User_UserEmail",
                table: "ResearchHistorys",
                column: "UserEmail",
                principalTable: "User",
                principalColumn: "UserEmail",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Valence_Element_ElementId",
                table: "Valence",
                column: "ElementId",
                principalTable: "Element",
                principalColumn: "ElementId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
