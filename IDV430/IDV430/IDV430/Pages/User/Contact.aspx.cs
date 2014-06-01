using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IDV430.Pages.User
{
    public partial class Contact : System.Web.UI.Page
    {
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
    }
}