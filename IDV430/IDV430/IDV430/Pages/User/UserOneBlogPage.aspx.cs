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
            //call the recursive FindControl method
            Control ctrl = this.FindControlRecursive("temptest");
            //var t = ctrl.ClientID;
            //ctrl.FindControl("HyperTest").Visible = false;
            
            //ctrl.Visible = false;
            //var test = ctrl.ToString();
            //http://stackoverflow.com/questions/4955769/better-way-to-find-control-in-asp-net
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public IDV430.Model.Blog GetOneBlogPost_GetItem([RouteData]int id)
        {
            try
            {
                var blog = Service.GetOneBlogById(id);
                               
                //blog.newDate = blog.Date.ToString("yyyymmdd");

                if (User.Identity.Name == blog.UserID)
                {


                    Control con = this.FindAnyControl("HyperTest");


                    con.Visible = false;


                    //Redigera.Visible = true;
                    //DeleteLinkButton99.Visible = true;
                    //BackHyperLink.Visible = true;

                    //LoginView1.LoggedInTemplate.FindControl("LoginName1");

                    //LoginView LoginV = (LoginView)FindControl("LoginView1");
                    //LoggedInTemplate tre = (LoggedInTemplate)LoginV.FindControl("FormView1");


                    //FormView tre = (FormView)LoginV.FindControl("FormView1");
                    
                    //HyperLink ett = (HyperLink)FindControl("HyperTest");

                    //ett.Visible = false;

                    ////HyperTest
                    
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
                    Response.RedirectToRoute("BlogListPage", null);
                    Context.ApplicationInstance.CompleteRequest();

                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade då annonsen skulle tas bort.");
                }

            }
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
                    Response.RedirectToRoute("OneBlogPage", null); //In med blog id
                    Context.ApplicationInstance.CompleteRequest();

                }
                catch (Exception)
                {
                    ModelState.AddModelError(String.Empty, "Ett fel inträffade då annonsen skulle tas bort.");
                }

            }
        }


        //UPDATERAR EN KOMMENTAR
        // The id parameter name should match the DataKeyNames value set on the control
        public void CommentFormView_UpdateItem(int id)
        {
            IDV430.Model.Comment item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            if (item == null)
            {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                // Save changes here, e.g. MyDataLayer.SaveChanges();

            }
        }

        

        protected void Label1_PreRender(object sender, EventArgs e)
        {
            
            Control ctrl = this.FindControlRecursive("Label1");
            ctrl.Visible = true;

        }




       




       //Control ctrl = this.FindControlRecursive("Label1");
       //     ctrl.Visible = true;
    }


    






    public static class ControlExtensions
{
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

