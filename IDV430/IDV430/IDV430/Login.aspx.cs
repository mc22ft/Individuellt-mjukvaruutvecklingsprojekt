using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI.WebControls;


namespace IDV430
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    ////Skickas till annonsen som har lagts in med hjälp av id
                    Response.RedirectToRoute("BlogListPage", null); //In med blog id
                    Context.ApplicationInstance.CompleteRequest();
                   
                    //StatusText.Text = string.Format("Hej {0}!", User.Identity.GetUserName());
                    //phLoginStatus.Visible = true;
                    //LogoutButton.Visible = true;
                    //LoginForm.Visible = false;


                    
                }
                else
                {
                    phLoginStatus.Visible = false;
                    LoginForm.Visible = true;
                }
            }
        }

        protected void SignIn(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(UserName.Text, Password.Text);

            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                string returnUrl = Request.QueryString["ReturnUrl"];
                if (string.IsNullOrEmpty(returnUrl))
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
               { 
                    Response.Redirect(returnUrl);
                }
            }
            else
            {
                StatusText.Text = "Invalid username or password.";
                LoginForm.Visible = true;
            }
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}