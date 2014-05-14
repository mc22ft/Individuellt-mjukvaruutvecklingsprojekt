<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserMainPage.aspx.cs" Inherits="IDV430.Pages.UserMainPage.UserMainPage" %>



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
                  <li><a href="#theBlogg">Blogg</a></li>
                  <li><a href="#theGallery">Gallery</a></li>
                  <li><a href="#Kontakt">noKontakt</a></li>
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

     <%-- --%>
                <asp:LoginView ID="LoginView1" runat="server">

                    <%-- --%>
                    <AnonymousTemplate>INTE inloggad</AnonymousTemplate>

                    <%-- --%>
                    <LoggedInTemplate>

                        <asp:ListView ID="ListView1" runat="server"
                            ItemType="IDV430.Model.Blog"
                            SelectMethod="ListBlogPost_GetData"
                            DataKeyName="PostBlogID">

                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </LayoutTemplate>
                            

                            <ItemTemplate>
                                <div class="Frame add well well-lg">
                                    <%-- HeadLine --%>
                                    <div>                                    
                                        <h1><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# GetRouteUrl("OneBlogPage", new { id = Item.PostBlogID })%>' ><%#: Item.HeadLine %></asp:HyperLink></h1>
                                    </div>

                                    <%-- datum - UserNamn --%>
                                    <div>
                                        <p><%#: Item.Date.ToString("d") %> Skrivet av: <%#: Item.UserID %></p>                          
                                    </div>

                                    <%-- Content i blog --%>
                                    <div>
                                        <p><%#: Item.Content %></p>
                                    </div>

                                </div>
                               


                            </ItemTemplate>
                            


                            <EmptyDataTemplate>
                                <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                                      <h3>Det finns inga annonser.</h3> 
                            </EmptyDataTemplate>

                        </asp:ListView>
                        
                    </LoggedInTemplate>
                </asp:LoginView> 

</asp:Content>

