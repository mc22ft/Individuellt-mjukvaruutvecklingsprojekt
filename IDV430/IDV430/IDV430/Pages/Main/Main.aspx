<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Shared/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="IDV430.Pages.Main.Main" %>

<%@ Register Src="~/Pages/Shared/Menu.ascx" TagPrefix="uc1" TagName="Menu" %>


<%-- MENY --%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    <uc1:Menu runat="server" ID="Menu" />
   
</asp:Content>

<%-- HÄR KOMMER LOGIN ELLER REGISTRERINGEN --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

    

</asp:Content>


<%-- INFO DELAR --%>


<asp:Content ID="Content3" ContentPlaceHolderID="UnderMain1" runat="server">

    <!-- Om my room
    ================================================== -->
   <section id="OmyRoom" class="content text-center light">

      <div class="container">
        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-12 overlay-text">
            <h2>MyRoom är till för dig som vill skapa en privat sida.</h2>
          </div><!-- /.col-lg-12 -->
        </div><!-- /.row -->

        <div class="row">
          <div class="col-sm-4 text-center overlay-text icons">
            <div class="icon-wrapper">
              <i class="fa fa-cloud icon-large"></i>
            </div>
            <h3>Håll kontakten!</h3>            
            <p>Här håller du kontakten med familjen och nära med snabba meddelande.</p>
          </div>
          <div class="col-sm-4 text-center overlay-text icons">
            <div class="icon-wrapper">
              <i class="fa fa-picture icon-large"></i>
            </div>
            <h3>Dela foton!</h3>            
            <p>Du kan visa upp bilder och dela med dig av vad som händer i ditt liv.</p>
          </div>
          <div class="col-sm-4 text-center overlay-text icons">
            <div class="icon-wrapper">
              <i class="fa fa-lightbulb-o icon-large"></i>
            </div>
            <h3>Helt privat!</h3>            
            <p>Denna sida är helt private. Du bestämmer vilka som kan ha tillträde.</p>
          </div>
        </div><!-- /.row -->
      </div>

      <div class="overlay-bg light"></div>

    </section>
                              <!-- imellan bild
    ================================================== -->
            <div id="photoBetween">

            </div>

                   <!-- theblogg
    ================================================== -->
            <section id="theBlogg">
                <div class="container">
                    <h2>theBlogg</h2>
                </div>
            </section>

            <!-- thegallery
    ================================================== -->
            <section id="theGallery">
                <div class="container">
                    <h2>theGallery</h2>
                </div>
            </section>

</asp:Content>

<%-- FOOTER --%>

<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">

    <!-- Footer
    ================================================== -->
        <footer id="Kontakt" class="footer">

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-sm-3 col-md-3">
                            <div class="footer-logo">
                                <h2>Prestige</h2>
                                <p>
                                    1024 Main Street, Vancouver BC<br>
                                    +1 (123) 456-7890
                                </p>
                                <br>
                                <p class="muted">© 2013 Prestige Inc.</p>
                                <a href="#">Terms of Service</a>
                                <a href="#">Privacy</a>
                            </div>
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <h3>Product</h3>
                            <ul class="list-unstyled">
                                <li><a href="#">Product for iOS</a></li>
                                <li><a href="#">Product for Android</a></li>
                                <li><a href="#">Product for Windows</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <h3>Company</h3>
                            <ul class="list-unstyled">
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Our Team</a></li>
                                <li><a href="#">Jobs&emsp;<span class="label label-info">We're hiring!</span></a></li>
                            </ul>
                        </div>
                        <div class="col-sm-3 col-md-3">
                            <h3>Documentation</h3>
                            <ul class="list-unstyled">
                                <li><a href="#">Product Help</a></li>
                                <li><a href="#">Developer API</a></li>
                                <li><a href="#">Product Markdown</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <a class="icon" href="http://www.twitter.com" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a class="icon" href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a class="icon" href="http://www.dribbble.com" target="_blank"><i class="fa fa-dribbble"></i></a>
                        <a class="icon" href="http://www.workingnomads.co" target="_blank"><i class="fa fa-globe"></i></a>
                    </div>
                </div>
            </div>

        </footer>


</asp:Content>