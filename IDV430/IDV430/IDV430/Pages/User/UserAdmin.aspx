<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserAdmin.aspx.cs" Inherits="IDV430.Pages.Blog.Blog" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>

    
                           <%-- Denna sida kan du skriva en blogpost. 
                            Dina bloggposter listas här--%>
                        

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--Meny inloggad--%>
    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

                <div class="ValidationSummary-div">
                                <%-- Presenterar meddelande --%>
                        <asp:ValidationSummary runat="server" class="alert alert-dismissable alert-info" /> 
                </div>

                            <%--Skapr en bloggpost--%>
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
                                <asp:TextBox ID="BlogName" class="BlogName" runat="server" Text='<%# BindItem.HeadLine %>' MaxLength="50" />
                                <asp:RequiredFieldValidator ID="RubrikRequiredFieldValidator" runat="server" 
                                    ControlToValidate="BlogName"
                                    Text="*"
                                    ErrorMessage="Du måste ange en rubrik." 
                                    ForeColor="#CC0000" 
                                    Display="None" 
                                    SetFocusOnError="True">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div>
                                <label>Skriv innehållet:</label>
                            </div>
                                <asp:TextBox ID="BlogContent" class="BlogContent" runat="server" Text='<%# BindItem.Content %>' TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RubrikRequiredFieldValidator1" runat="server" 
                                    ControlToValidate="BlogContent"
                                    Text="*"
                                    ErrorMessage="Du måste ange ett innehåll." 
                                    ForeColor="#CC0000" 
                                    Display="None" 
                                    SetFocusOnError="True">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="blog-send-buttom">
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Insert" Text="Posta" class="btn btn-default"/>
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Cancel" Text="Rensa" class="btn btn-default"/>
                            </div>
                        </div>
                        <div class="blog-form-under"></div>
                    </InsertItemTemplate>
                </asp:FormView>
                   
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">

                        <div class="new-blog-content">
                            <h2>Alla dina inlägg</h2>
                        </div>
                                <%--Listar alla dina egna inlägg--%>
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
                                      <h3 class="no-blogpost">Du har inga blogposter.</h3> 
                            </EmptyDataTemplate>
                        </asp:ListView> 
                        <div class="margin-bottom-blog"></div>                     
                   
</asp:Content>
