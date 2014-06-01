<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="IDV430.Pages.Shared.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">


    <%--Enkel fel sida om något går fel!--%>

    <div class="alert alert-dismissable alert-warning">
        <h1>Felmeddelande</h1>
        <p>Det uppstog något oväntat!</p>
    </div>
    <button type="button"><a href="~/Pages/Main/Main.aspx">Tillbaka</a></button>
    


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
</asp:Content>
