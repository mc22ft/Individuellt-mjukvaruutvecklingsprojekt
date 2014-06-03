<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="IDV430.Pages.Shared.Menu" %>


                <%--Navigations bar - Meny för när man INTE är inloggad--%>

<div class="opacity">        
     <header style="background-image: url('../../Pics/background_fix1.png'); background-size: cover; padding-bottom: 20%; filter: brightness(0.2);" class="img-responsive">
         
            <%-- Boostrap meny! --%>

            <!-- Fixed navbar -->           


           <div class="navbar navbar-default topMeny" >                 
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                
                  <asp:HyperLink ID="HyperLink3" runat="server" class="navbar-brand" Text="MyRoom" NavigateUrl='<%$ RouteUrl:routename = Default %>' />
              </div>

              <div class="navbar-collapse collapse navbar-responsive-collapse navbar-right">
                <ul class="nav navbar-nav">
                  <li><a id="myTest" href="#OmyRoom">Om myRoom</a></li>                  
                  <li><a href="#theBlogg">theBlogg</a></li>
                  <li><a href="#theGallery">theGallery</a></li>
                  <li><a href="#Kontakt">Kontakt</a></li>

                    <%--Ändrar l'nkarna om man är inloggad så kan man logga ut på main sidan--%>

                    <% if (!HttpContext.Current.User.Identity.IsAuthenticated)
                                   {%>
                                        <li><asp:HyperLink class="hidden-sm login" ID="LoginButton" runat="server" Text="Login" NavigateUrl='<%$ RouteUrl:routename = Login %>' /></li>                  
                                        <li><asp:HyperLink class="hidden-sm signup btn signupButton" ID="HyperLink4" runat="server" Text="Sign up" NavigateUrl='<%$ RouteUrl:routename = Register %>' /></li>
                                <% }
                                   else
                                   { %>
                                        <li><asp:HyperLink class="hidden-sm login" ID="myPage" runat="server" Text="MinSida" NavigateUrl='<%$ RouteUrl:routename = UserAdmin %>' /></li> 
                                        <li><asp:Button ID="LogOut" runat="server" OnClick="SignOut" Text="Logga ut" class="hidden-sm signout btn signupOutButton" /></li>
                                <% } %>     
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