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
    public partial class UserOneBlogPage : System.Web.UI.Page
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

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public IDV430.Model.Blog GetOneBlogPost_GetItem([RouteData]int id)
        {
            try
            {
                var blog = Service.GetOneBlogById(id);

                if (User.Identity.Name == blog.UserID)
                {
                    DeleteLinkButton.visible = true;
                    //BackHyperLink.visble = true;
                }



                return blog;
            }
            catch (Exception)
            {
                throw new Exception();
            }
        }



        //SKAPAR EN KOMMENTAR
        public void CreateComment_InsertItem([RouteData]int id, Comment Comment)
        {
            //var item = new IDV430.Model.Comment();
            //TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                try
                {
                    Comment.UserID = User.Identity.Name;
                    Comment.PostBlogID = id;
                    Service.SaveComment(Comment);
                }
                catch (Exception) //Fångar upp fel
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade när kommentaren skulle läggas till");
                }

            }
        }



        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        //HÄMTAR ALLA KOMMENTARER TILL ETT BLOG INLÄGG
        public IEnumerable<IDV430.Model.Comment> GetListComments_GetItem([RouteData]int id)
        {
            return Service.GetComments(id);
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
                    //Response.RedirectToRoute("AnnonsList", null);
                    //Context.ApplicationInstance.CompleteRequest();

                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade då annonsen skulle tas bort.");
                }

            }
        }
    }
}

