<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="IDV430.admin.admin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <p>ADMIN!</p>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
    <div>
        <asp:TextBox ID="blogTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>   
    </div>
    <div>
        <asp:Button ID="blogButton" runat="server" Text="Button" />
    </div>


</asp:Content>




<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>



