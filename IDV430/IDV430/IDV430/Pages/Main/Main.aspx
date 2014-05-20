<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="IDV430.Pages.Main.Main" %>

<%@ Register Src="~/Pages/Shared/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <uc1:Menu runat="server" ID="Menu" />
   
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    
    

</asp:Content>
