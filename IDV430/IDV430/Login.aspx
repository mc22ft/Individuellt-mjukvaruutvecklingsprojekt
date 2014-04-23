<%@ Page Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IDV430.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <h3>Logga in här!!!</h3>      

         <asp:PlaceHolder runat="server" ID="phLoginStatus" Visible="false">
             <h1>Nu är du inloggad!</h1>
            <p>
               <asp:Literal runat="server" ID="StatusText" />
            </p>
             <a href="/galleria.aspx">Min galleria</a>
         </asp:PlaceHolder>



         <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="UserName" />
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="Password" TextMode="Password" />
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <div>
                  <asp:Button runat="server" OnClick="SignIn" Text="Log in" />
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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

   
  
    </asp:Content>