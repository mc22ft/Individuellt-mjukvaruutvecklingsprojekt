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
            
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    //call the recursive FindControl method
                    Control ctrl = this.FindControlRecursive("temptest");
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
        public IDV430.Model.Blog GetOneBlogPost_GetItem([RouteData]int id)
        {
            try
            {
                var blog = Service.GetOneBlogById(id);
                               
                //blog.newDate = blog.Date.ToString("yyyymmdd");

               

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
                    //Page.SetTempData("SuccessMessage", "Annonsen är updaterad.");
                    //Skickas till annonsen som har updaterats in med hjälp av id
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

        


        


       

        





       




       //Control ctrl = this.FindControlRecursive("Label1");
       //     ctrl.Visible = true;
    }







    public static class ControlExtensions
{
        public static T FindControl<T>(System.Web.UI.ControlCollection Controls) where T : class
        {

            T found = default(T);

            if (Controls != null && Controls.Count > 0)
            {

                for (int i = 0; i < Controls.Count; i++)
                {

                    found = Controls[i] as T;

                    if (found != null)
                    {

                        break;

                    }

                    else

                        found = FindControl<T>(Controls[i].Controls);

                }

            }

            return found;

        }
    /// <summary>
    /// recursively finds a child control of the specified parent.
    /// </summary>
    /// <param name="control"></param>
    /// <param name="id"></param>
    /// <returns></returns>
    public static Control FindControlRecursive(this Control control, string id)
    {
        if (control == null) return null;
         //try to find the control at the current level
        Control ctrl = control.FindControl(id);

        if (ctrl == null)
        {
            //search the children
            foreach (Control child in control.Controls)
            {
                ctrl = FindControlRecursive(child, id);

                if (ctrl != null) break;
            }
        }
        return ctrl;
    }

 public static Control FindAnyControl(this Page page, string controlId)
        {
            return FindControlRecursive(controlId, page.Form);
        }

        public static Control FindAnyControl(this UserControl control, string controlId)
        {
            return FindControlRecursive(controlId, control);
        }

        public static Control FindControlRecursive(string controlId, Control parent)
        {
            foreach (Control control in parent.Controls)
            {
                Control result = FindControlRecursive(controlId, control);
                if (result != null)
                {
                    return result;
                }
            }
            return parent.FindControl(controlId);
        }






}

    //public void Page_Load(object sender, EventArgs e)
    //{
    //    //call the recursive FindControl method
    //    Control ctrl = this.FindControlRecursive("my_control_id");
    //}


}

