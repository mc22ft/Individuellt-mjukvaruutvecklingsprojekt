<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuLoggedIn.ascx.cs" Inherits="IDV430.Pages.Shared.MenuLoggedIn" %>


 <div class="opacity">
                <header>

                     <%--style="background-image: url('../../Pics/boat.JPG'); background-size: cover; padding-bottom: 60%; filter: brightness(0.2);" class="img-responsive" --%>

                    <%-- Boostrap meny! --%>

                    <!-- Fixed navbar -->


                    <div class="navbar navbar-default topMeny fixedBlack">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <asp:HyperLink class="navbar-brand" ID="HyperLink3" runat="server" NavigateUrl='<%$ RouteUrl:routename = Default %>' Text="MyRoom" />
                        </div>

                        <div class="navbar-collapse collapse navbar-responsive-collapse navbar-right">
                            <ul class="nav navbar-nav loginNav">   
                                                   
                                <li><asp:HyperLink ID="AllBlogg" runat="server" Text="Bloggar" NavigateUrl='<%$ RouteUrl:routename = BlogListPage %>' /></li>          
                                
                                <li><asp:HyperLink ID="myBlogg" runat="server" Text="minBlogg" NavigateUrl='<%$ RouteUrl:routename = UserAdmin %>' /></li>

                                <li><asp:HyperLink ID="myGallery" runat="server" Text="Galleriet" NavigateUrl='<%$ RouteUrl:routename = GalleryPage %>' /></li>                                

                                <li><asp:HyperLink ID="ContactUs" runat="server" Text="Kontakta oss" NavigateUrl='<%$ RouteUrl:routename = Contact %>' /></li>

                                <li><asp:HyperLink class="hidden-sm signup btn signupOutButton" ID="HyperLink2" runat="server" OnClick="SignOut" Text="LoggaUt" NavigateUrl='<%$ RouteUrl:routename = Default %>' /></li>

                               <%-- Boostrap meny!  <li><asp:Button ID="LogOut" runat="server" OnClick="SignOut" Text="Logga ut" class="hidden-sm signout btn signupOutButton" /></li>--%>
                                
                            </ul>       
                        </div>
                    </div>
                    
                </header>
            </div>


