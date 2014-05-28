<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserEditBlog.aspx.cs" Inherits="IDV430.Pages.User.UserEditBlog" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />

</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server" >

                    <%-- Presenterar meddelande --%>
        <div class="ValidationSummary-div">                        
                <asp:ValidationSummary runat="server" class="alert alert-dismissable alert-info" /> 
        </div>


    <asp:FormView ID="FormView2" runat="server"
                ItemType="IDV430.Model.Blog"
                SelectMethod="GetOneBlogPostEdit_GetItem" class="readBlogPost"      
                >

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
                                          
                        <div>
                           
                            

                        <%-- Raderablog inlägg om du är ägaren! --%>

                        
                        <%-- Bottoms, "ta bort" ligger det javascript på --%>
                

                            <asp:LinkButton ID="Redigera" runat="server" Text="Redigera" class="btn btn-primary btn-xs" 
                                CausesValidation="false"
                                OnCommand="Redigera_Command"
                                />    

                            <asp:LinkButton runat="server" ID="DeleteLinkButton99" Text="Ta bort" class="btn btn-danger btn-xs"
                                    CausesValidation="false" 
                                    OnClientClick='<%# String.Format("return AlertDelete(\"{0}\");", Eval("HeadLine")) %>'
                                    OnCommand="DeleteLinkButton_Command"          
                                    CommandArgument='<%$ RouteValue:id %>' 
                                    />

                            <asp:HyperLink ID="BackHyperLink" runat="server" Text="Tillbaka"  NavigateUrl='<%# GetRouteUrl("UserAdmin", null) %>' class="btn btn-primary btn-xs" />
                      </div>
                    </div>


                </ItemTemplate>
                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <h3>Det finns inga bloggposter.</h3> 
               </EmptyDataTemplate>
            </asp:FormView>

            


    <asp:FormView ID="FormView1" runat="server" 
                ItemType="IDV430.Model.Blog"
                DataKeyNames="PostBlogID"
                DefaultMode="Edit"
                RenderOuterTable="false"
                SelectMethod="GetOneBlogPostEdit_GetItem"
                UpdateMethod="BlogEditFormView_UpdateItem" 
                >

                <EditItemTemplate>
                    <%-- HeadLine --%>
                    <div class="Frame add well well-lg edit-blog edit-blog1">
                        <div>
                            <h1>Redigera ditt innehåll här</h1>
                        </div>
                        <div class="editHeadLine"> 
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>               
                            <asp:TextBox ID="TestBox" runat="server" Text='<%# BindItem.HeadLine %>' Width="50%" MaxLength="50"></asp:TextBox>  
                            <asp:RequiredFieldValidator ID="RubrikRequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TestBox"
                                            Text="*"
                                            ErrorMessage="Du måste ange en rubrik." 
                                            ForeColor="#CC0000" 
                                            Display="None" 
                                            SetFocusOnError="True">
                            </asp:RequiredFieldValidator>
                        </div>

                        <%-- datum - UserNamn --%>
                        <div class="editHeadLine">
                            <p><%#: Item.Date.ToString("d") %> Skrivet av: <%#: Item.UserID %></p>   
                        </div>

                        <%-- Content i blog --%>
                        <div class="readEditContent">
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Text='<%# BindItem.Content %>' Width="60%" Height="200px" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TextBox1"
                                            Text="*"
                                            ErrorMessage="Du måste ange ett innehåll." 
                                            ForeColor="#CC0000" 
                                            Display="None" 
                                            SetFocusOnError="True">
                            </asp:RequiredFieldValidator>
                        </div>  
                                          
                        <div>
                            <asp:LinkButton runat="server" Text="Spara" CommandName="Update" class="btn btn-success btn-xs" />
                                                     
                            
                            <asp:HyperLink ID="BackHyperLink" runat="server" Text="Tillbaka"  NavigateUrl='<%# GetRouteUrl("UserEditBlog", new { id = Item.PostBlogID })%>' class="btn btn-primary btn-xs" />

                        <%-- Raderablog inlägg om du är ägaren! --%>

                        
                        <%-- Bottoms, "ta bort" ligger det javascript på --%>
                
                            



                                

                            

                            
                      </div>
                    </div>


                </EditItemTemplate>
                
            </asp:FormView>




     <%-- JavaScript (ska in i extern fil) --%>
    <script type="text/javascript">
        function AlertDelete(Rubrik) {
            if (confirm("Ta bort bloggposten " + Rubrik + " permanent!") == true) {
                return true;
            }
            else {
                return false;
            }
        }
    </script> 

</asp:Content>







<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">

     

            <asp:ListView ID="CommentEditFormView" runat="server"
                ItemType="IDV430.Model.Comment"
                SelectMethod="GetListComments_GetItem"                
                DataKeyNames="CommentID"
                >

                <ItemTemplate>
                    <div class="comment-Blog">
                        <%-- Name --%><%-- datum --%>
                        <div>
                                                                
                          <h4>Kommentarat av <%#: Item.Name %> <%#: Item.Date.ToString("d") %> </h4>
                        </div>                        

                        <%-- Hemsida --%>
                        <div>
                            
                        </div>

                        <%-- Kommentar i blog --%>
                        <div class="comment-Blog-content">
                            <p><%#: Item.CommentTxt  %></p>
                        </div>

                        <%-- Epost --%>
                        <div>                            
                            <%--<p>Kontakt: <%#: Item.Epost %> </p>--%>
                        </div>
                    
                        <%--  NavigateUrl='<%# GetRouteUrl("UserEditBlog", new { id = Item.PostBlogID  }) %>' --%>
                        <div class="comment-Blog-bottom">

                            <asp:LinkButton runat="server" ID="DeleteCommentLinkButton" Text="Ta bort" class="delite-button"
                                CausesValidation="false" 
                                OnClientClick='<%# String.Format("return AlertDelete(\"{0}\");", Eval("Name")) %>'
                                OnCommand="DeleteCommentLinkButton_Command"   
                                CommandArgument='<%# Item.CommentID %>'
                                />

                            <p><asp:HyperLink ID="HyperLink1" runat="server" Url="<%#: Item.Webbpage %>"><%#: Item.Webbpage %></asp:HyperLink></p>
                            
                            


                    <%-- 
                        CommandArgument='<%$ RouteValue:id %>'
                        
                         --%>

                           
                        </div>
                    </div>


                        <%-- JavaScript (ska in i extern fil) --%>
                <script type="text/javascript">
                    function AlertDelete(Name) {
                        if (confirm("Ta bort annonsen " + Name + " permanent!") == true) {
                            return true;
                        }
                        else {
                            return false;
                        }
                    }
                </script> 


                </ItemTemplate>


                <EmptyDataTemplate>
                        <%-- Detta visas då kunduppgifter saknas i databasen. --%>                               
                        <p class="emptyPost">Det finns inga kommentarer till denna blogpost</p> 
               </EmptyDataTemplate>

            </asp:ListView>

       

   
</asp:Content>





<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">



</asp:Content>
