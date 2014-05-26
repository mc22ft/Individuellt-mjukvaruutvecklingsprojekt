<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="IDV430.Pages.Blog.Blog" %>

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

                        <asp:FormView ID="FormView1" runat="server"
                            ItemType="IDV430.Model.Blog"
                            InsertMethod="CreateBlog_InsertItem"
                            DefaultMode="Insert"
                            RenderOuterTables="false">
                            <%-- --%>
                            <InsertItemTemplate>
                                
                                <div class="new-blog-headline">
                                    <h2>Skapa nytt inlägg</h2>
                                </div>

                                <div class="form-group blog-form">
                                    <div>
                                        <label>Namnet på blog inlägget:</label>
                                    </div>
                        
                                    <div>
                                        <asp:TextBox ID="BlogName" class="BlogName" runat="server" Text='<%# BindItem.HeadLine %>' />
                                    </div>

                                    <div>
                                        <label>Skriv innehållet:</label>
                                    </div>

                                    <div>
                                        <asp:TextBox ID="BlogContent" class="BlogContent" runat="server" Text='<%# BindItem.Content %>' TextMode="MultiLine" />
                                    </div>

                                    <div>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Insert" Text="Posta" class="btn btn-default"/>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" Text="Rensa" class="btn btn-default"/>
                                    </div>
                                </div>
                            </InsertItemTemplate>
                        </asp:FormView>
                    </LoggedInTemplate>
                </asp:LoginView> 

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">

     <%-- --%>
                <asp:LoginView ID="LoginView2" runat="server">

                    <%-- --%>
                    <AnonymousTemplate>INTE inloggad</AnonymousTemplate>

                    <%-- --%>
                    <LoggedInTemplate>

                        <div class="new-blog-content">
                            <h2>Alla dina inlägg</h2>
                        </div>

                        <asp:ListView ID="ListView1" runat="server"
                            ItemType="IDV430.Model.Blog"
                            SelectMethod="GetmyListView_GetData">

                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                
                            </LayoutTemplate>                            

                            <ItemTemplate>
                                <div class="my-blog-list">
                                    <%-- HeadLine --%>
                                    <div>                                    
                                        <h1><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# GetRouteUrl("UserEditBlog", new { id = Item.PostBlogID })%>' ><%#: Item.HeadLine %></asp:HyperLink></h1>
                                    
                                    <%-- datum - UserNamn --%>
                                   
                                        <p>Datum <%#: Item.Date.ToString("d") %> </p>                          
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
