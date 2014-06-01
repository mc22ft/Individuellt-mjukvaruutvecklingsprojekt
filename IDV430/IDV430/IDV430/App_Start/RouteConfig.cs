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
            //Logga in/Registrering
            routes.MapPageRoute("Login", "Login", "~/Login.aspx");
            routes.MapPageRoute("Register", "Register", "~/Register.aspx");

            //Navigering
            routes.MapPageRoute("OneBlogPage", "EnBlogg/{id}", "~/pages/User/UserOneBlogPage.aspx");
            routes.MapPageRoute("BlogListPage", "BloggLista", "~/pages/User/UserMainPage.aspx");
            routes.MapPageRoute("UserEditBlog", "Edit/{id}", "~/pages/User/UserEditBlog.aspx");
            routes.MapPageRoute("UserAdmin", "MinSida", "~/pages/User/UserAdmin.aspx");

            //Gallery
            routes.MapPageRoute("GalleryPage", "Galleriet", "~/pages/User/GalleryPage.aspx");

            //Contact
            routes.MapPageRoute("Contact", "Kontakt", "~/pages/User/Contact.aspx");

            //Deafult
            routes.MapPageRoute("Default", "", "~/Pages/Main/Main.aspx");
            ////Error
            routes.MapPageRoute("Error", "serverfel", "~/Pages/Shared/Error.aspx");
        }
    }
}