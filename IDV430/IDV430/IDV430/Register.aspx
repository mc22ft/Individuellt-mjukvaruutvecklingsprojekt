<%@ Page Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="IDV430.Register" %>

<%@ Register Src="~/Pages/Shared/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <uc1:Menu runat="server" ID="Menu" />

</asp:Content>



<asp:Content ID="Register" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">

        <div id="formid" class="form-group login-register">

            <h3>Registrera ny användare</h3>
            
            <p>
                <asp:Literal runat="server" ID="StatusMessage" />
            </p> 
                           
            <div style="margin-bottom:10px">
                <asp:Label runat="server" AssociatedControlID="UserName" >Användarnamn</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="UserName" class="form-control" />                
                </div>
            </div>
            <div style="margin-bottom:10px">
                <asp:Label runat="server" AssociatedControlID="Password">Lösenord</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" class="form-control" />                
                </div>
            </div>
            <div style="margin-bottom:10px">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Bekräfta lösenord</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" class="form-control" />                
                </div>
            </div>
            <div>
                <div>
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Registrera" class="btn btn-default"/>
                </div>
            </div>
        </div>


    </asp:PlaceHolder>

     <script type="text/javascript">


         document.getElementById('formid').scrollIntoView(true);

         //window.scrollBy(0, 320);

    </script>

</asp:Content>

