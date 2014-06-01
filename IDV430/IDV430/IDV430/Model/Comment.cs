using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDV430.Model
{
    public class Comment
    {

        public int CommentID { get; set; }

        public string UserID { get; set; }

        public string Name { get; set; }

        public string Epost { get; set; }

        public string Webbpage { get; set; }

        public string CommentTxt { get; set; }

        public DateTime Date { get; set; }

        public int PostBlogID { get; set; }
    }
}