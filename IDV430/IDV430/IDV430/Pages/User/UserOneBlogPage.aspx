<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserOneBlogPage.aspx.cs" Inherits="IDV430.Pages.User.UserOneBlogPage" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
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
                SelectMethod="GetOneBlogPost_GetItem" class="readBlogPost">

                <ItemTemplate>
                    <%-- HeadLine --%>
                    <div class="Frame add well well-lg edit-blog">
                        <div>                                    
                          <h1><%#: Item.HeadLine %></h1>
                        </div>

                        <%-- datum - UserNamn --%>
                        <div>
                            <p><%#: Item.Date.ToString("d") %> Skrivet av: <%#: Item.UserID %></p>   
                        </div>

                        <%-- Content i blog --%>
                        <div class="readContent">
                            <p><%#: Item.Content %></p>
                          <%--  <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Item.Content %>' Visible="false"></asp:TextBox>--%>
                        </div>
                    </div>

                </ItemTemplate>
                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <h3>Det finns inga blog poster.</h3> 
               </EmptyDataTemplate>
            </asp:FormView>
        </LoggedInTemplate>
    </asp:LoginView>
<%--
    <div>
                 Bottoms, "ta bort" ligger det javascript på 
                
                <asp:LinkButton ID="Redigera" runat="server" Text="Redigera" class="btn btn-primary btn-xs" Visible="False" />   

                <asp:LinkButton runat="server" ID="DeleteLinkButton99" Text="Ta bort" class="btn btn-danger btn-xs"
                        CausesValidation="false" 
                        OnClientClick='<%# String.Format("return AlertDelete(\"{0}\");", Eval("HeadLine")) %>'
                        OnCommand="DeleteLinkButton_Command"          
                        CommandArgument='<%$ RouteValue:id %>' 
                        Visible="False" />

                <asp:HyperLink ID="BackHyperLink" runat="server" Text="Tillbaka"  NavigateUrl='<%# GetRouteUrl("BlogListPage", null) %>' class="btn btn-primary btn-xs" Visible="False" />
    </div>
 --%>


           

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
                        <div class="make-comment-Blog">
                            <div>
                                <h3>Kommentera detta inlägg!</h3>
                            </div>
                            <div class="comment-Blog-content">     
                                <div class="comment-Blog-content-div1">     
                                    <div>
                                        <asp:Label ID="Label2" runat="server" Text="Namn:"></asp:Label>
                                        <asp:TextBox ID="CommentName" runat="server" Text='<%#: BindItem.Name %>' />
                                    </div>
                                    <div>
                                        <asp:Label ID="Label3" runat="server" Text="Epost:"></asp:Label>
                                        <asp:TextBox ID="CommentEpost" runat="server" Text='<%#: BindItem.Epost %>' />
                                    </div>
                                    <div>
                                        <asp:Label ID="Label4" runat="server" Text="www:"  class="comment-Blog-content-div1-3"></asp:Label>
                                        <asp:TextBox ID="CommentWebbPage" runat="server" Text='<%#: BindItem.Webbpage %>' />
                                    </div>
                                </div>
                                <div class="comment-Blog-content-div2">
                                    <div>
                                        <asp:Label ID="Label5" runat="server" Text="Kommentar:"></asp:Label>
                                        <asp:TextBox ID="CommentCommentTxt" runat="server" TextMode="MultiLine" Text='<%#: BindItem.CommentTxt %>' class="comment-Blog-content-div2-txtbox"/>
                                    </div>
                                </div>
                            </div>
                                <div class="make-comment-Blog-bottom">
                                    <asp:LinkButton ID="CommentLinkButton1" runat="server" Visible="True" CommandName="Insert" Text="Posta" />
                                    <asp:LinkButton ID="CommentLinkButton2" runat="server" Visible="True" CommandName="Cancel" Text="Rensa" />
                                </div>
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
                    <div class="comment-Blog">
                        <%-- Name --%><%-- datum --%>
                        <div>
                                                                
                          <h4>Kommentarat av <%#: Item.Name %> <%#: Item.Date.ToString("d") %> </h4>
                        </div>


                        <%-- Epost --%>
                        <div>                            
                            <%--<p>Kontakt: <%#: Item.Epost %> </p>--%>
                        </div>

                        <%-- Hemsida --%>
                        <div>
                            <%--<p>Hemsida: <%#: Item.Webbpage %> </p>--%>
                        </div>

                        <%-- Kommentar i blog --%>
                        <div class="comment-Blog-content">
                            <p><%#: Item.CommentTxt %></p>
                        </div>
                        
                        <div class="comment-Blog-bottom">                           
                            <p><asp:HyperLink ID="HyperLink1" runat="server" Url="<%#: Item.Webbpage %>">Hemsida:  <%#: Item.Webbpage %></asp:HyperLink></p>
                            <p><asp:HyperLink ID="HyperLink2" runat="server" Url="<%#: Item.Epost %>">Kontakt:  <%#: Item.Epost %></asp:HyperLink></p>                               
                        </div>
                       
                    </div>


                </ItemTemplate>


                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <p class="emptyPost">Det finns inga kommentarer till denna blogpost</p> 
               </EmptyDataTemplate>

            </asp:ListView>

        </LoggedInTemplate>

    </asp:LoginView>

</asp:Content>
