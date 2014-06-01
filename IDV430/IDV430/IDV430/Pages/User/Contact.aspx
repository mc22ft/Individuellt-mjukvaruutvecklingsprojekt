<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="IDV430.Pages.User.Contact" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>

                <%--KONTAKT SIDA!--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div style="margin:200px; text-align:center; margin-bottom:450px;">
    
        <h2>Contact.aspx under konstruktion!</h2>
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
</asp:Content>
