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
    }
}