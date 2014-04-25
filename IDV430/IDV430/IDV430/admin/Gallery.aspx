<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="IDV430.Pages.Gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Min galleria
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:loginview runat="server">
        <AnonymousTemplate>INTE inloggad</AnonymousTemplate>
        <LoggedInTemplate>Jag är inloggads</LoggedInTemplate>
    </asp:loginview>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
