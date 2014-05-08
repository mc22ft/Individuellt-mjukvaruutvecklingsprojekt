<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserOneBlogPage.aspx.cs" Inherits="IDV430.Pages.User.UserOneBlogPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>





                                             <%-- Hämtar ett blog inlägg --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <asp:LoginView ID="LoginView1" runat="server">

        <%-- --%>
        <AnonymousTemplate>INTE inloggad</AnonymousTemplate>

        <%-- --%>
        <LoggedInTemplate>

            <asp:FormView ID="FormView1" runat="server"
                ItemType="IDV430.Model.Blog"
                SelectMethod="GetOneBlogPost_GetItem"
                >

                <ItemTemplate>

                    <%-- HeadLine --%>
                    <div>                                    
                      <h1><%#: Item.HeadLine %></h1>
                    </div>

                    <%-- datum - UserNamn --%>
                    <div>
                        <p><%#: Item.Date %> <%#: Item.UserID %></p>
                    </div>

                    <%-- Content i blog --%>
                    <div>
                        <p><%#: Item.Content %></p>
                    </div>
                    




                    <%-- Raderablog inlägg om du är ägaren! --%>

                    <div>



                    </div>

                    <div>
                <%-- Bottoms, "ta bort" ligger det javascript på 
                <asp:HyperLink runat="server" Text="Redigera" NavigateUrl='<%# GetRouteUrl("AnnonsEdit", new { id = Item.AnnonsID }) %>' class="btn btn-primary btn-xs" />
                                    --%>



                        <asp:LinkButton runat="server" ID="DeleteLinkButton" Text="Ta bort" class="btn btn-danger btn-xs"
                               CausesValidation="false" 
                               OnClientClick='<%# String.Format("return AlertDelete(\"{0}\");", Eval("HeadLine")) %>'
                               OnCommand="DeleteLinkButton_Command"          
                               CommandArgument='<%$ RouteValue:id %>' Visible="False" />
                <asp:HyperLink ID="BackHyperLink" runat="server" Text="Tillbaka"  NavigateUrl='<%# GetRouteUrl("BlogListPage", null) %>' class="btn btn-primary btn-xs" />
            </div>



                </ItemTemplate>


                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <h3>Det finns inga blog poster.</h3> 
               </EmptyDataTemplate>

            </asp:FormView>

        </LoggedInTemplate>

    </asp:LoginView>

    <%-- JavaScript (ska in i extern fil) --%>
    <script type="text/javascript">
        function AlertDelete(Rubrik) {
            if (confirm("Ta bort annonsen " + Rubrik + " permanent!") == true) {
                return true;
            }
            else {
                return false;
            }
        }
    </script> 

</asp:Content>



                                           <%-- Kommentarer till blog inlägg --%>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">

    <asp:LoginView ID="LoginView2" runat="server">
        <%-- --%>
        <AnonymousTemplate>INTE inloggad</AnonymousTemplate>
        <%-- --%>
        <LoggedInTemplate>
    <%-- In med kommentars funktion här!!!! 
                                
        <asp:Button ID="CommentButton" runat="server" Text="Kommentera inlägget" OnClick="CommentButton_Click" />--%>

            <asp:FormView ID="FormView2" runat="server"
                ItemType="IDV430.Model.Comment"
                InsertMethod="CreateComment_InsertItem"
                DefaultMode="Insert"
                RenderOuterTables="false">

                    <InsertItemTemplate>
                        <div>                            
                            <asp:TextBox ID="CommentName" runat="server" Text='<%#: BindItem.Name %>' />
                            <asp:TextBox ID="CommentEpost" runat="server" Text='<%#: BindItem.Epost %>' />
                            <asp:TextBox ID="CommentWebbPage" runat="server" Text='<%#: BindItem.Webbpage %>' />
                            <asp:TextBox ID="CommentCommentTxt" runat="server" TextMode="MultiLine" Text='<%#: BindItem.CommentTxt %>' />

                            <asp:LinkButton ID="CommentLinkButton1" runat="server" Visible="True" CommandName="Insert" Text="Posta" />
                            <asp:LinkButton ID="CommentLinkButton2" runat="server" Visible="True" CommandName="Cancel" Text="Rensa" />
                        </div>
                    </InsertItemTemplate>

            </asp:FormView>

            </LoggedInTemplate>
    </asp:LoginView>

</asp:Content>

                                         <%-- Hämtar kommentarer till ett bloginlägg --%>

<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">

    <asp:LoginView ID="LoginView3" runat="server">

        <%-- --%>
        <AnonymousTemplate>INTE inloggad</AnonymousTemplate>

        <%-- --%>
        <LoggedInTemplate>

            <asp:ListView ID="FormView1" runat="server"
                ItemType="IDV430.Model.Comment"
                SelectMethod="GetListComments_GetItem"
                >

                <ItemTemplate>

                    <%-- Name --%>
                    <div>                                    
                      <h1><%#: Item.Name %></h1>
                    </div>

                    <%-- datum --%>
                    <div>
                        <p><%#: Item.Date %> </p>
                    </div>

                    <%-- Epost --%>
                    <div>
                        <p><%#: Item.Epost %> </p>
                    </div>

                    <%-- Hemsida --%>
                    <div>
                        <p><%#: Item.Webbpage %> </p>
                    </div>

                    <%-- Kommentar i blog --%>
                    <div>
                        <p><%#: Item.CommentTxt %></p>
                    </div>
                    
                </ItemTemplate>


                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <h3>Det finns inga kommentarer.</h3> 
               </EmptyDataTemplate>

            </asp:ListView>

        </LoggedInTemplate>

    </asp:LoginView>

</asp:Content>
