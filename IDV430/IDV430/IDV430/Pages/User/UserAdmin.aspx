<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="IDV430.Pages.Blog.Blog" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    



</asp:Content>





<%-- --%>
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

                                <div>
                                    <label>Namnet på blog inlägget:</label>
                                </div>
                        
                                <div>
                                    <asp:TextBox ID="BlogName" runat="server" Text='<%# BindItem.HeadLine %>' />
                                </div>

                                <div>
                                    <label>Skriv innehållet:</label>
                                </div>

                                <div>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.Content %>' TextMode="MultiLine" />
                                </div>

                                <div>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Insert" Text="Posta" />
                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" Text="Rensa" />
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

                        <asp:ListView ID="ListView1" runat="server"
                            ItemType="IDV430.Model.Blog"
                            SelectMethod="GetmyListView_GetData"
                            >

                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </LayoutTemplate>                            

                            <ItemTemplate>
                                <div class="Frame add well well-lg">
                                    <%-- HeadLine --%>
                                    <div>                                    
                                        <h1><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# GetRouteUrl("UserEditBlog", new { id = Item.PostBlogID })%>' ><%#: Item.HeadLine %></asp:HyperLink></h1>
                                    </div>
                                    <%-- datum - UserNamn --%>
                                    <div>
                                        <p>Datum <%#: Item.Date.ToString("d") %> </p>                          
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
