using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace IDV430.App_Start
{
    //Länkar
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            ////Annonser
            //routes.MapPageRoute("AnnonsList", "Annonser", "~/Pages/AnnonsPages/AnnonsList.aspx");
            //routes.MapPageRoute("AnnonsCreate", "Annonser/nyAnnons", "~/Pages/AnnonsPages/AnnonsCreate.aspx");
            //routes.MapPageRoute("AnnonsDetails", "Annons/{id}", "~/Pages/AnnonsPages/AnnonsDetails.aspx");
            //routes.MapPageRoute("AnnonsEdit", "Annonser/{id}/redigera", "~/Pages/AnnonsPages/AnnonsEdit.aspx");
            //Logga in/Registrering
            routes.MapPageRoute("Login", "Login", "~/Login.aspx");
            routes.MapPageRoute("Register", "Register", "~/Register.aspx");
            //Navigering
            routes.MapPageRoute("OneBlogPage", "OneBlogPage/{id}", "~/pages/User/UserOneBlogPage.aspx");
            routes.MapPageRoute("BlogListPage", "Blog", "~/pages/User/UserMainPage.aspx");
            routes.MapPageRoute("UserEditBlog", "Edit/{id}", "~/pages/User/UserEditBlog.aspx");
            routes.MapPageRoute("UserAdmin", "UserPage", "~/pages/User/UserAdmin.aspx");

            //Deafult
            routes.MapPageRoute("Default", "", "~/Pages/Main/Main.aspx");
            ////Error
            //routes.MapPageRoute("Error", "serverfel", "~/Pages/Shared/Error.aspx");
        }
    }
}