using IDV430.Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace IDV430
{
    public class Gallery
    {
        //Fields
        private static readonly Regex ApprovedExenstions; //Regex Fältet initieras i den statiska konstruktorn
        private static string PhsicalUploadImagePath; //fysiska sökvägen - katalogen där uppladdade filer sparas - katalogen där uppladdade filer sparas
        private static readonly Regex SantizePath;  //Regex - Readonly - Kontrollera godkända tecken        

        //Konstruktor
        static Gallery() //Initiera de statiska readonly fälten
        {
            ApprovedExenstions = new Regex(@"^.*\.(gif|jpg|png)$", RegexOptions.IgnoreCase); // kanske lägga till \

            PhsicalUploadImagePath = HttpContext.Current.Server.MapPath("Content");
                //AppDomain.CurrentDomain.GetData("APPBASE").ToString(),
                //@"Content\" //Files
                //);

            var invalidChars = new string(Path.GetInvalidFileNameChars());
            SantizePath = new Regex(string.Format("[{0}]", Regex.Escape(invalidChars)));

        }

        //Metoder In med FileData isället för string, Server mot path.combine
        public static IEnumerable<FileData> GetImagesNames() //Returnerar en ref: bildernas filnamn i bokstavsordning - Anv klass, DirectoyInfo med metoden GetFiles. Se till att filerna är i rätt format
        {

            //public static IEnumerable<string> GetImagesNames() //Returnerar en ref: bildernas filnamn i bokstavsordning - Anv klass, DirectoyInfo med metoden GetFiles. Se till att filerna är i rätt format
            //{

            //Hämtar tumnagel bilderna från MIN katalog
            var getFileFromLabery = new DirectoryInfo(Path.Combine(PhsicalUploadImagePath, "ThumImage"));  //Här ska hämtas ur tumnagelbilderna 
            return (from fi in getFileFromLabery.GetFiles()
                    select new FileData
                    {

                        Name = fi.Name,
                        Css = "FocusImg"

                    }).OrderBy(fi => fi.Name).ToList();           
        }

        public static bool ImageExist(string name) //return tru om ett lika namn finns i katalogen för uppkadddade bilder. annars false
        {
            if (File.Exists(name))
            {
                return true;
            }
            else
            {
                return false;
            }
                    }

        private static bool IsValidImage(Image image) //returnaerar tru- verkligrn är av typen gif jpeg png. Läs mer... (MIME-typ)
        {
            if (image.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Gif.Guid)
            {
                return true;
            }
            else if (image.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Jpeg.Guid)
            {
                return true;
            }
            else if (image.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Png.Guid)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public static string SaveImage(Stream FileCont, string fileName) //verify - rätt MIME-typ(kasta undantag). säkerställer filmnamn är unik. sparar bild - skapar, och sparar tumnagelbild. filnamn bilden sparas under retuneras.      
        {
            string formatFileName;
            //string updateFilename;

            formatFileName = SantizePath.Replace(fileName, ""); //Tar bort otillåtna tecken
            var image = System.Drawing.Image.FromStream(FileCont);  //Bilden blir en bild

            if (ApprovedExenstions.IsMatch(formatFileName)) //Kollar om det finns några otillåtna filländelser
            {
                string path = Path.Combine(PhsicalUploadImagePath, "Files", formatFileName);
                int count = 1;
                //string newImage2 = "";
                bool truORfalse;
                //string newPath;

                if (ImageExist(path))
                {
                    do  //kontrollerar om bilden finns i map
                    {
                        var extension = Path.GetExtension(formatFileName);
                        formatFileName = String.Format("{0}({1})", Path.GetFileNameWithoutExtension(formatFileName), count++);
                        //Rediger path gör om till ett (1) i filändelsen                   
                        var newImage = Path.Combine(formatFileName, extension);
                        formatFileName = SantizePath.Replace(newImage, "");
                        path = Path.Combine(PhsicalUploadImagePath, "Files", formatFileName);

                        truORfalse = ImageExist(path);
                    } while (truORfalse);
                }

                //Binder map plats och filnamn   
                if (!IsValidImage(image)) //Test om image är av rätt image typ
                {
                    //Kasta undantag
                    throw new ArgumentException("Bilden har fel typ");
                }
                image.Save(path);
            }
            else
            {
                //Felmeddelande fel filändelse
                throw new ArgumentException("Bilden har fel typ");
            }

            //tumnagelbild
            //var image = System.Drawing.Image.FromStream(path); // stream -> ström med bild
            var thumbnail = image.GetThumbnailImage(60, 45, null, System.IntPtr.Zero);

            var PhsicalUploadThumbnailPath = Path.Combine(
                AppDomain.CurrentDomain.GetData("APPBASE").ToString(),
                @"Content\ThumImage"
                );

            var thumbnailPath = Path.Combine(PhsicalUploadThumbnailPath, formatFileName);
            thumbnail.Save(thumbnailPath); // path -> fullständig fysisk filnamn inklusive sökväg

            //1. Testa mime typ är rätt annars kasta undantag
            //2. Testa så fil namn är unikt om inte lägg på (1)... osv
            //3. Spara bilden under Files 
            //FileCont. CopyTo(savePath);

            //4. Skapa och spara tumnagelbild i TumImage
            //5. Returnera ?? filnamn bilden sparas under retuneras ??

            return formatFileName; //Felmeddelande???
        }
    }
}
