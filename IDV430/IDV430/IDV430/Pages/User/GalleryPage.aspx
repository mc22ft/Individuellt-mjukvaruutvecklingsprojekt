<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="GalleryPage.aspx.cs" Inherits="IDV430.Pages.User.GalleryPage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    
            <div>
                <h1>Galleriet</h1>
            </div>
            <div>
                <p>Här presenteras ett meddelande om att bilden har sparats i katalogen!</p>
                <asp:Label ID="FileUploadText" runat="server" Text=""></asp:Label>
            </div>
            <div id="ImagePlaceHolder">
                <asp:Image ID="ImageBig" runat="server" />

                <p>Här ska den stora bilden komma upp!</p>
            </div>
            <div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Fel inträffade. Korrigera felet och försök igen." 
                    ForeColor="#CC0000" />
            </div>
            <div>

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
                        <%--       <a class="fancybox" rel="group" href="big_image_2.jpg"><img src="small_image_2.jpg" alt="" /></a>
                            <asp:HyperLink  ID="myHyperLink" runat="server"
                                NavigateUrl='<%# "Default.aspx?image=" + Item.Name %>'
                                >
                                
                                <asp:Image class="fancybox" ID="Image1" runat="server" 
                                    ImageUrl='<%# "~/Content/ThumImage/" + Item.Name %>' 
                                    
                                    />

                            </asp:HyperLink>



                              

                         
                                
                                 <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl='<%# Eval("Name", "~/Content/files/{0}") %>' 
                                ImageUrl= '<%# Eval("Name", "~/Content/files/{0}") %>' > 
                           ImageUrl= '<%# "~/Content/files/{0}" + Item %>' 
                                <%# Eval("Name") %>/>

                            </asp:HyperLink> --%>
                                
                      

                    </ItemTemplate>
                    <FooterTemplate>
                       
                    </FooterTemplate>

                </asp:Repeater>
            </div>
            <div>
                <%--  Knappar ska in här!  --%>

                <asp:FileUpload ID="FileUpload" runat="server" />

                <asp:Button ID="LoadButton" runat="server" Text="Button" OnClick="Button1_Click" />
            </div>

            <%--  Valedering  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="FileUpLoad"
                Text="*"
                ErrorMessage="En fil måste väljas."
                SetFocusOnError="True" 
                Display="Dynamic" 
                ForeColor="#CC0000">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                ControlToValidate="FileUpLoad"
                Text="*" 
                ErrorMessage="Endast bilder av typen gif, jpeg, jpg och png är tillåtna." 
                ValidationExpression='"^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.png|.PNG)$"' 
                Display="Dynamic" 
                ForeColor="Red">                
            </asp:RegularExpressionValidator>
--%>
       
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">
</asp:Content>
