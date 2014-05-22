using IDV430;
using IDV430.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

namespace IDV430.Pages.User
{
    public partial class GalleryPage : System.Web.UI.Page
    {
        private Gallery _gallery;

        private Gallery myGallery
        {
            get { return _gallery as Gallery; }
            set { _gallery = value; }
        }

        //Laddas när sidan laddas!
        protected void Page_Load(object sender, EventArgs e)
        {
            var QName = Request.QueryString["image"];


            // Visar bild i större format 
            if (QName != null)
            {
                ImageBig.ImageUrl = "~/Content/Files/" + QName;


            }

            if (!IsPostBack)
            {
                Gallery myGalleryObjekt = new Gallery();

            }
        }



        //Här kommer filen in...
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {                
                var nameOfUploadFile = "";
                if (FileUpload.HasFile)
                {
                    var FileCont = FileUpload.FileContent; //Filens innehåll
                    var fileName = FileUpload.FileName;    //Filens namn             

                    var regex = new Regex("(gif|jpg|png)", RegexOptions.IgnoreCase);

                    if (regex.IsMatch(fileName))
                    {
                        nameOfUploadFile = Gallery.SaveImage(FileCont, fileName);

                        FileUploadText.Text = string.Format("Bilen har '{0}' sparats.", nameOfUploadFile);
                    }
                    else
                    {
                        
                        FileUploadText.Text = string.Format("Något gick fel med filen '{0}'.! Försök igen...", nameOfUploadFile);
                    }
                }
                else
                {
                    FileUploadText.Text = string.Format("Något gick fel med filen '{0}'.! Försök igen...", nameOfUploadFile);
                }
            }
        }

        public IEnumerable<FileData> Repeater_GetData()
        {


            return Gallery.GetImagesNames();




            ////Hämtar tumnagel bilderna från MIN katalog
            //var getFileFromLabery = new DirectoryInfo(Server.MapPath(@"~/Content/ThumImage"));  //Här ska hämtas ur tumnagelbilderna 
            //return (from fi in getFileFromLabery.GetFiles()
            //       select new FileData
            //       {
            //           Name = fi.Name

            //       }).AsEnumerable();
        }


        //protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    //if.... mer...
        //    var fileinfo = (FileInfo).e.item.DataItem;
        //    var hyperlink = (HyperLink)e.Item.FindControl("myHyperLink");
        //    hyperlink.N
        //}

        protected void Repeater_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {

            var QName = Request.QueryString["image"] ?? string.Empty;
            var fileinfo = (FileData)e.Item.DataItem;
            if (fileinfo != null && QName == fileinfo.Name)
            {
                var hyperlink = (HyperLink)e.Item.FindControl("myHyperLink");
                hyperlink.CssClass = "svedoll";
            }
        }
    }
}