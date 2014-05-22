using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDV430.Model
{
    //Tar hand om bilderna ii galleriet
    public class FileData
    {
        public string Name { get; set; }
        public string Css { get; set; }
        public string ThumbUrl { get; set; }
        public string ImgUrl { get; set; }

        public string Class { get; set; }
    }
}