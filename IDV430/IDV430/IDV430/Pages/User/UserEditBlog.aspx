<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="UserEditBlog.aspx.cs" Inherits="IDV430.Pages.User.UserEditBlog" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <asp:FormView ID="FormView1" runat="server"
        ItemType="IDV430.Model.Blog"
        DataKeyNames="PostBlogID"
        DefaultMode="Edit"
        SelectMethod="EditGetFormView_GetItem"
        UpDateMethod="EditFormView_UpdateItem">
        <EditItemTemplate>


            <asp:Label ID="Label1" runat="server" />
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# BindItem.HeadLine %>' />

            <asp:Label ID="Label2" runat="server" Text="Innehåll"/>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Text='<%# BindItem.Content %>' />

             <div class="link">
                <asp:LinkButton runat="server" Text="Spara" CommandName="Update" class="btn btn-success btn-xs" />
                <asp:HyperLink runat="server" Text="Avbryt" NavigateUrl='<%# GetRouteUrl("OneBlogPage", new { id = Item.PostBlogID }) %>' class="btn btn-primary btn-xs" />
            </div>

        </EditItemTemplate>
    </asp:FormView>
</asp:Content>







<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
</asp:Content>
