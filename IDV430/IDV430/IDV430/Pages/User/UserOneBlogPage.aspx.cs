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
            //Undersöker om är inloggad
            if (User.Identity.IsAuthenticated)
            {
                
            }
            else
            {
                Response.RedirectToRoute("Default", null);
                Context.ApplicationInstance.CompleteRequest();
            }            
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        //Hämtar en bloggpost
        public IDV430.Model.Blog GetOneBlogPost_GetItem([RouteData]int id)
        {
            try
            {
                var blog = Service.GetOneBlogById(id);   
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
                    //Skickar meddelande om att kommentar har 
                    //Page.SetTempData("SuccessMessage", "Bloggen är updaterad.");
                    //Skickas till Bloggen som har updaterats in med hjälp av id
                    Response.RedirectToRoute("OneBlogPage", null);
                    Context.ApplicationInstance.CompleteRequest();
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
    }
}