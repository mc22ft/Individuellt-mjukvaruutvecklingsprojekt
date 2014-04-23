using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace IDV430
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            //Inlänkade css, min egen css och boostrap
            bundles.Add(new StyleBundle("~/Content/bootstrap").Include(
                "~/Content/bootstrap.css",
                "~/Content/style.css"
                
            ));

            //Inlänkade javascript
            bundles.Add(new ScriptBundle("~/Scripts/bootstrap").Include(
                "~/Scripts/bootstrap.js",
                "~/Scripts/jquery-2.1.0.js"
            ));


        }
    }
}