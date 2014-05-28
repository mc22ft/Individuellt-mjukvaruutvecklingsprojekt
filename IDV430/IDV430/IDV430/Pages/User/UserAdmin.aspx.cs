using IDV430.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDV430.Pages.Blog
{
    public partial class Blog : System.Web.UI.Page
    {

        //Fält
        private Service _service;

        //Skapar ett service objekt
        private Service Service
        {
            //Om det inte är skapat så skapare det ett service objekt
            get { return _service ?? (_service = new Service()); }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {

                }
                else
                {
                    Response.RedirectToRoute("Default", null);
                    Context.ApplicationInstance.CompleteRequest();
                }
            }
        }

        //
        public void CreateBlog_InsertItem(IDV430.Model.Blog blog)
        {
            //var item = new IDV430.Model.Blog();
            //TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                try 
                {
                    blog.UserID = User.Identity.Name;  
                    Service.SaveBlog(blog);
                    //Service.SaveBlog(blog);

                }
                catch (Exception) //Fångar upp fel
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade när blogen skulle läggas till");
                }
                // Save changes here

            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IEnumerable<IDV430.Model.Blog> GetmyListView_GetData()
        {

            var id = User.Identity.Name;

            return Service.GetAllBlogById(id);
        }


    }
}