using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDV430.Model
{
    public class Blog
    {
        public int PostBlogID { get; set; }

        public string UserID { get; set; } //Name = string

        public string HeadLine { get; set; }

        public string Content { get; set; }

        public DateTime Date { get; set; }

    }
}