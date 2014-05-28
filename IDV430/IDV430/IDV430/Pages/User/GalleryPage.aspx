<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="GalleryPage.aspx.cs" Inherits="IDV430.Pages.User.GalleryPage" %>

<%@ Register Src="~/Pages/Shared/MenuLoggedIn.ascx" TagPrefix="uc1" TagName="MenuLoggedIn" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <uc1:MenuLoggedIn runat="server" ID="MenuLoggedIn" />
    
</asp:Content>


                    
                                <%--GALLERIET!!!--%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
            <div class="GalleryH2">
                <h1>Galleriet</h1>
            </div>

           
            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Fel inträffade. Korrigera felet och försök igen." 
                    ForeColor="#CC0000" />
            </div>

            <div class="Gallery-button">
                        <%--  Knappar ska in här!  --%>
                <asp:FileUpload ID="FileUpload" runat="server" class="gallery-fileupload-button"/>
                <asp:Button ID="LoadButton" runat="server" Text="Ladda upp" OnClick="Button1_Click" />
            </div>

            <div class="gallery-ok-message">                
                <asp:Label ID="FileUploadText" runat="server" Text="" ></asp:Label>
            </div>

            <div class="mainGalleryWindow">

                <%--  Här kommer tumnagelbilderna presneteras! Repeater  --%>

                <asp:Repeater ID="Repeater" runat="server" 
                    ItemType="IDV430.Model.FileData" 
                    SelectMethod="Repeater_GetData" OnItemDataBound="Repeater_ItemDataBound1">
                    <HeaderTemplate>
                       
                    </HeaderTemplate>
                    <ItemTemplate>                       
                          
                            <div class="imgContent" style="display:Block;">
                                    <asp:HyperLink class="fancybox-thumb" rel="fancybox-thumb" ID="myHyperLink" runat="server" 
                                        ImageUrl='<%# "~/Content/Files/" + Item.Name %>' >                               
                                
                                        <asp:Image  ID="Image1" runat="server" ImageUrl='<%# "~/Content/ThumImage/" + Item.Name %>' alt="" 
                                            onClientClick="return false;"/> 

                                    </asp:HyperLink>
                            </div>
                       
                    </ItemTemplate>
                    <FooterTemplate>
                       
                    </FooterTemplate>

                </asp:Repeater>
            </div>
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
</asp:Content>
