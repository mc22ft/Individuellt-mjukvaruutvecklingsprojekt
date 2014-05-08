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
