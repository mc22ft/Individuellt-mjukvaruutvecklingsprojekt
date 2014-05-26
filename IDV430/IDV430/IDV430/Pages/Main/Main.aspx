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


     <!-- thegallery
    ================================================== -->
            <section id="theGallery">
                <div class="container">

                    <h2>theGallery</h2>


                    <%--  --%>
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="height:300px;">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                          <div class="item active">
                            <img class="image-inner" src="../../Pics/boat.JPG" alt="First slide" style="height:300px;" />                             
                             <div class="carousel-caption">
                                 <h1>This Caption 1</h1>
                                 <p>Här kommer text</p>
                             </div>
                          </div>
                          <div class="item">
                            <img class="image-inner" src="../../Pics/night.JPG" alt="Second slide" style="height:300px;"/>
                             <div class="carousel-caption">
                                 <h1>This Caption 2</h1>
                                 <p>Här kommer text</p>
                             </div>                             
                          </div>
                          <div class="item">
                            <img class="image-inner" src="../../Pics/test1.png" alt="Third slide" style="height:300px;"/>
                             <div class="carousel-caption">
                                 <h1>This Caption 3</h1>
                                 <p>Här kommer text</p>
                             </div>
                          </div>
                       </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <%--  --%>

                   
                </div>
            </section>


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
            <section id="theBlogg" style="background-image: url('../../Pics/article-writing-pencil-small-1.jpg'); background-size: cover ; height: 600px; height: 400px;">
                <div class="container">
                    <h2>theBlogg</h2>
                    <p>Dela dina händelser och upplevelser</p>
                    <p>Roligt - Tråkigt - Glad - Ledsen - Arg - Snäll - Trevligt - Tråkigt</p>
                    <p>Alla dina närmaste är intresserade om dig!</p>
                </div>
            </section>

    <script type="text/javascript">

        //$('.carousel').carousel()
        $('.carousel-example-generic').carousel({
            interval: 2000
        })

</script>
</asp:Content>

<%-- FOOTER --%>

<asp:Content ID="Content4" ContentPlaceHolderID="UnderMain2" runat="server">

   


</asp:Content>