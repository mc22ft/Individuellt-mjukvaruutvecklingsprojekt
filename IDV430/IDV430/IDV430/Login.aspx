<%@ Page Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IDV430.Login" %>

<%@ Register Src="~/Pages/Shared/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>
<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     

    <% if (HttpContext.Current.User.Identity.IsAuthenticated)
                                   {%>
                                        <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
                                <% }
                                   else
                                   { %>
                                        <uc1:Menu runat="server" ID="Menu" />
                                <% } %>

    
   
</asp:Content>

<asp:Content ID="LogInId" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <h3>Logga in här!!!</h3>

    <asp:PlaceHolder runat="server" ID="phLoginStatus" Visible="false">
        <h1>Nu är du inloggad!</h1>
        <p>
            <asp:Literal runat="server" ID="StatusText" />
        </p>
        <a href="pages/gallery/Gallery.aspx">Gallery.aspx</a>
        <a href="admin/admin.aspx">admin.aspx</a>
        <a href="pages/User/UserAdmin.aspx">UserAdmin.aspx</a>
        <a href="pages/User/UserMainPage.aspx">UserMainPage.aspx</a>

    </asp:PlaceHolder>



    <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
        <div id="formid" class="form-group">
            <div style="margin-bottom: 10px">
                <asp:Label runat="server" AssociatedControlID="UserName">Användarnamn</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="UserName" class="form-control" />
                </div>
            </div>
            <div style="margin-bottom: 10px">
                <asp:Label runat="server" AssociatedControlID="Password">Lösenord</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" class="form-control" />
                </div>
            </div>
            <div style="margin-bottom: 10px">
                <div>
                    <asp:Button runat="server" OnClick="SignIn" Text="Logga in" class="btn btn-default" />
                </div>
            </div>
        </div>
    </asp:PlaceHolder>



    <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
        <div>
            <div>
                <asp:Button runat="server" OnClick="SignOut" Text="Log out" />
            </div>
        </div>
    </asp:PlaceHolder>

    <script type="text/javascript">


        document.getElementById('formid').scrollIntoView(true);

        //window.scrollBy(0, 320);

    </script>

</asp:Content>
