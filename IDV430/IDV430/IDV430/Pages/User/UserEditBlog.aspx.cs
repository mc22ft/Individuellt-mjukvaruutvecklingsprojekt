using IDV430.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDV430.Pages.User
{
    public partial class UserEditBlog : System.Web.UI.Page
    {
        //Fält
        private Service _service;

        // Ett Service-objekt skapas först då det behövs för första gången
        private Service Service
        {
            get { return _service ?? (_service = new Service()); }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    FormView1.Visible = false;
                }
                else
                {
                    Response.RedirectToRoute("Default", null);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public IDV430.Model.Blog EditGetFormView_GetItem([RouteData] int id)
        {
            //Try catch ska in
            return Service.GetOneBlogById(id);
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void EditFormView_UpdateItem(int PostBlogID)
        {
            var blog = Service.GetOneBlogById(PostBlogID);

            
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (blog == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", PostBlogID));
                return;
            }
            TryUpdateModel(blog);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                Service.SaveBlog(blog);
                //Skickar meddelande om att blog har updaterats
               //Page.SetTempData("SuccessMessage", "Annonsen är updaterad.");
                //Skickas till annonsen som har updaterats in med hjälp av id
                Response.RedirectToRoute("OneBlogPage", new { id = blog.PostBlogID });
                Context.ApplicationInstance.CompleteRequest();

            }
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public IDV430.Model.Blog GetOneBlogPostEdit_GetItem([RouteData]int id)
        {
            return Service.GetOneBlogById(id);
        }


        //Tar bort en annons med hjälp av id som "fångas" av "e.CommandArgument"
        protected void DeleteLinkButton_Command(object sender, CommandEventArgs e)
        {
            //ModelState.IsValid = när man jobbar med data annotation(bindning)
            if (ModelState.IsValid)
            {
                try
                {

                    //Får ut id
                    var id = int.Parse(e.CommandArgument.ToString());

                    //var idUser = User.Identity.Name;                    
                    // User id och id på blog inlägg finns = Mathias och 16

                    //Hämta från databasen vem som skrivit blog inlägg

                    //var blogobj = Service.GetOneBlogById(id);

                    //obj tomt
                    //var obj = new IDV430.Model.Blog();                   

                    Service.DeleteBlog(id);

                    //Service.DeleteAnnons(id);
                    ////Skickar meddelande om att annonsen sparades
                    //Page.SetTempData("SuccessMessage", "Annonsen är raderad.");
                    ////Skickas till annonsen som har lagts in med hjälp av id
                    Response.RedirectToRoute("UserAdmin", null);
                    Context.ApplicationInstance.CompleteRequest();

                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade då annonsen skulle tas bort.");
                }

            }
        }


        //HÄMTAR ALLA KOMMENTARER TILL ETT BLOG INLÄGG
        public IEnumerable<IDV430.Model.Comment> GetListComments_GetItem([RouteData]int id)
        {
            return Service.GetComments(id);
        }

        //TAR BORT EN KOMMENTAR
        protected void DeleteCommentLinkButton_Command(object sender, CommandEventArgs e)
        {
            //ModelState.IsValid = när man jobbar med data annotation(bindning)
            if (ModelState.IsValid)
            {
                try
                {

                    //Får ut id
                    var id = int.Parse(e.CommandArgument.ToString());

                    //var idUser = User.Identity.Name;                    
                    // User id och id på blog inlägg finns = Mathias och 16

                    //Hämta från databasen vem som skrivit blog inlägg

                    //var blogobj = Service.GetOneBlogById(id);

                    //obj tomt
                    //var obj = new IDV430.Model.Blog();

                    Service.DeleteComment(id);

                    //Service.DeleteAnnons(id);
                    ////Skickar meddelande om att annonsen sparades
                    //Page.SetTempData("SuccessMessage", "Annonsen är raderad.");

                    ////Skickas till annonsen som har lagts in med hjälp av id
                    Response.RedirectToRoute("UserEditBlog", null); //In med blog id
                    Context.ApplicationInstance.CompleteRequest();

                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade då annonsen skulle tas bort.");
                }

            }
        }


       

        // The id parameter name should match the DataKeyNames value set on the control
        public void BlogEditFormView_UpdateItem(int PostBlogID)
        {
            try
            {
                var blog = Service.GetOneBlogById(PostBlogID);
                if (blog == null)
                {
                    // Hittade inte kunden.
                    ModelState.AddModelError(String.Empty,
                        String.Format("Annonsen med annonsnummer {0} hittades inte.", PostBlogID));
                    return;
                }

                //TryUpdateModel validerar
                if (TryUpdateModel(blog))
                {
                    Service.SaveBlog(blog);
                    //Skickar meddelande om att annonsen har updaterats
                    //Page.SetTempData("SuccessMessage", "Annonsen är updaterad.");
                    //Skickas till annonsen som har updaterats in med hjälp av id
                    Response.RedirectToRoute("UserEditBlog", new { id = blog.PostBlogID });
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
            //Blev något fel i updateringen så fångas det upp här och precenteras i ValidationSummary
            catch (Exception)
            {
                ModelState.AddModelError(String.Empty, "Fel inträffade då Annonsen skulle uppdateras.");
            }
        }

        public void Redigera_Command(object sender, CommandEventArgs e)
        {
            FormView2.Visible = false;

            FormView1.Visible = true;

        }


        


    }
}