<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserOneBlogPage.aspx.cs" Inherits="IDV430.Pages.User.UserOneBlogPage" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
</asp:Content>

                                             <%-- Hämtar ETT blog inlägg --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
            
    <div class="ValidationSummary-div">
                    <%-- Presenterar meddelande --%>
            <asp:ValidationSummary runat="server" class="alert alert-dismissable alert-info" /> 
    </div>
       
                    <%--Hämtar en bloggpost--%>
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



                                          <%-- Skriver en kommentarer till ett blogginlägg --%>            
                                          <%--Med Valederingskontroller på varje textbox--%>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">

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
                                    <div>                   <%--Namn--%>
                                        <asp:Label ID="Label2" runat="server" Text="Namn:"></asp:Label>
                                        <asp:TextBox ID="CommentName" runat="server" Text='<%#: BindItem.Name %>' MaxLength="30" />
                                        <asp:RequiredFieldValidator ID="RubrikRequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="CommentName"
                                                        Text="*"
                                                        ErrorMessage="Du måste ange ett namn." 
                                                        ForeColor="#CC0000" 
                                                        Display="None" 
                                                        SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div>               <%--Epost--%>
                                        <asp:Label ID="Label3" runat="server" Text="Epost:"></asp:Label>
                                        <asp:TextBox ID="CommentEpost" runat="server" Text='<%#: BindItem.Epost %>' MaxLength="50" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="CommentEpost"
                                                        Text="*"
                                                        ErrorMessage="Du måste ange en Epost." 
                                                        ForeColor="#CC0000" 
                                                        Display="None" 
                                                        SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="CommentEpost" 
                                            Text="*"
                                            ErrorMessage="Fel format på din Epost." 
                                            ForeColor="#CC0000" 
                                            Display="None" 
                                            SetFocusOnError="True" 
                                            ValidationExpression="^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div>               <%--www--%>
                                        <asp:Label ID="Label4" runat="server" Text="www:"  class="comment-Blog-content-div1-3"></asp:Label>
                                        <asp:TextBox ID="CommentWebbPage" runat="server" Text='<%#: BindItem.Webbpage %>' MaxLength="50" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="CommentWebbPage"
                                                        Text="*"
                                                        ErrorMessage="Du måste ange en hemsida." 
                                                        ForeColor="#CC0000" 
                                                        Display="None" 
                                                        SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="comment-Blog-content-div2">
                                    <div>               <%--Kommentar--%>
                                        <asp:Label ID="Label5" runat="server" Text="Kommentar:"></asp:Label>
                                        <asp:TextBox ID="CommentCommentTxt" runat="server" TextMode="MultiLine" Text='<%#: BindItem.CommentTxt %>' class="comment-Blog-content-div2-txtbox" MaxLength="300" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                        ControlToValidate="CommentCommentTxt"
                                                        Text="*"
                                                        ErrorMessage="Du måste ange en kommentar." 
                                                        ForeColor="#CC0000" 
                                                        Display="None" 
                                                        SetFocusOnError="True">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                                <div class="make-comment-Blog-bottom">
                                    <asp:LinkButton ID="CommentLinkButton1" runat="server" Visible="True" CommandName="Insert" Text="Posta" />                                   
                                </div>
                        </div>
                    </InsertItemTemplate>
            </asp:FormView>
</asp:Content>

                                         <%-- Hämtar ALLA kommentarer till ett bloginlägg --%>

<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
     
            <asp:ListView ID="FormView11" runat="server"
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
                                    <%--Länkar till kommentatorns webbpage och kontakt uppifter--%>
                        <div class="comment-Blog-bottom">                           
                            <p><asp:HyperLink ID="HyperLink1" runat="server" Url="<%#: Item.Webbpage %>">Hemsida:  <%#: Item.Webbpage %></asp:HyperLink></p>
                            <p><asp:HyperLink ID="HyperLink2" runat="server" Url="<%#: Item.Epost %>">Kontakt:  <%#: Item.Epost %></asp:HyperLink></p>                               
                        </div>                       
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <h3 class="no-blogpost">Det finns inga kommentarer till denna blogpost</h3> 
               </EmptyDataTemplate>
            </asp:ListView>
</asp:Content>