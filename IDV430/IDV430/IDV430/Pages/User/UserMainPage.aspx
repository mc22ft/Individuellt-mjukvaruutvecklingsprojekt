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

