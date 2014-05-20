<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="IDV430.Pages.User.Gallery" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <div style="margin:200px; text-align:center;">
    
        <h2>Gallery.aspx under konstruktion!</h2>
    </div>


</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
</asp:Content>
