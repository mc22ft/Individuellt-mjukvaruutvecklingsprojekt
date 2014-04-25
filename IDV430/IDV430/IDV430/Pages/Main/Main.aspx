<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="IDV430.Pages.Main.Main" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <div class="middle-text">       
                   
        <h1>MyRoom</h1>

        <h4>Håll kontakten med din familjen och nära vänner med hjälp av MyRoom. Här kan du dela med dig av ditt liv. Med ord och bilder.</h4> 
            
        <asp:HyperLink class="btn btn-primary" ID="Register" runat="server" Text="Starta här!" NavigateUrl='<%$ RouteUrl:routename = Register %>' />
            
     </div>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <h3>Här kommer innehållet på "framsidan"!!!!</h3>

</asp:Content>
