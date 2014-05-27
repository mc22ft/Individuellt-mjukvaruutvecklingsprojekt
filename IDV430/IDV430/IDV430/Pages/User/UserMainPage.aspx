<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserMainPage.aspx.cs" Inherits="IDV430.Pages.UserMainPage.UserMainPage" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    

    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

     <%-- --%>
                <asp:LoginView ID="LoginView1" runat="server">

                    <%-- --%>
                    <AnonymousTemplate>INTE inloggad</AnonymousTemplate>

                    <%-- --%>
                    <LoggedInTemplate>

                        <div class="list-blog-content">
                            <h1>Alla senaste inläggen</h1>
                        </div>

                        <asp:ListView ID="ListView1" runat="server"
                            ItemType="IDV430.Model.Blog"
                            SelectMethod="ListBlogPost_GetData"
                            DataKeyName="PostBlogID">

                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </LayoutTemplate>
                            

                            <ItemTemplate>
                                <div class="my-blog-list">
                                    <%-- HeadLine --%>
                                    <div>                                    
                                        <h1><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# GetRouteUrl("OneBlogPage", new { id = Item.PostBlogID })%>' ><%#: Item.HeadLine %></asp:HyperLink></h1>
                                    

                                    <%-- datum - UserNamn --%>
                                    
                                        <p><%#: Item.Date.ToString("d") %> Skrivet av: <%#: Item.UserID %></p>                          
                                    </div>

                                    <%-- Content i blog --%>
                                    <div>
                                        <p><%#: Item.Content %></p>
                                    </div>
                                    <div>
                                        <asp:HyperLink ID="HyperLink2" runat="server" Text="Kommentera" NavigateUrl='<%# GetRouteUrl("OneBlogPage", new { id = Item.PostBlogID })%>' class="btn btn-primary btn-xs comment-button" />
                                        
                                    </div>
                                </div>
                               


                            </ItemTemplate>
                            


                            <EmptyDataTemplate>
                                <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                                      <h3>Det finns inga annonser.</h3> 
                            </EmptyDataTemplate>

                        </asp:ListView>
                        <div class="margin-bottom-blog"></div>
                    </LoggedInTemplate>
                </asp:LoginView> 

</asp:Content>

