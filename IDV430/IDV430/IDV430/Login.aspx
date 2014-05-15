<%@ Page Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IDV430.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <div class="opacity">        
     <header style="background-image: url('../../Pics/test1.png'); background-size: cover; padding-bottom: 60%; filter: brightness(0.2);" class="img-responsive">
         
            <%-- Boostrap meny! --%>

            <!-- Fixed navbar -->           


           <div class="navbar navbar-default topMeny fixedBlack" >                 
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">MyRoom</a>
              </div>

              <div class="navbar-collapse collapse navbar-responsive-collapse navbar-right">
                <ul class="nav navbar-nav">
                  <li><a id="myTest" href="#OmyRoom">Om myRoom</a></li>                  
                  <li><a href="#theBlogg">theBlogg</a></li>
                  <li><a href="#theGallery">theGallery</a></li>
                  <li><a href="#Kontakt">Kontakt</a></li>
                  <li><asp:HyperLink class="hidden-sm login" ID="HyperLink1" runat="server" Text="Login" NavigateUrl='<%$ RouteUrl:routename = Login %>' /></li>                  
                  <li><asp:HyperLink class="hidden-sm signup btn signupButton" ID="HyperLink2" runat="server" Text="Sign up" NavigateUrl='<%$ RouteUrl:routename = Register %>' /></li>
                </ul>               
              </div>
           </div>
            
        <div class="middle-text">       
                   
            <h1>MyRoom</h1>

            <h4>Håll kontakten med din familjen och nära vänner med hjälp av MyRoom. Här kan du dela med dig av ditt liv. Med ord och bilder.</h4> 
            
            <asp:HyperLink class="btn btn-primary" ID="Register" runat="server" Text="Starta här!" NavigateUrl='<%$ RouteUrl:routename = Register %>' />
            
        </div> 
    </header>
</div>


    
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

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
                   <div class="blackText">
                      <asp:TextBox runat="server" ID="UserName" class="form-control" />
                   </div>
                </div>
                <div style="margin-bottom: 10px">
                   <asp:Label runat="server" AssociatedControlID="Password">Lösenord</asp:Label>
                   <div class="blackText">
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

        window.scrollBy(0, 320);

    </script>
  
    </asp:Content>