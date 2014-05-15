<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="IDV430.Pages.Main.Main" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <div class="opacity">        
     <header style="background-image: url('../../Pics/test1.png'); background-size: cover; padding-bottom: 60%; filter: brightness(0.2);" class="img-responsive">
         
            <%-- Boostrap meny! --%>

            <!-- Fixed navbar -->           


           <div class="navbar navbar-default topMeny" >                 
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

    
    

</asp:Content>
