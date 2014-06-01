using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace IDV430.Model.DAL
{

    //Hämtar connectionstring i webconfig
    public class DALBase
    {
        //fält
        private static string _connectionString;

        //Konstruktor statisk
        static DALBase()
        {
            _connectionString = WebConfigurationManager.ConnectionStrings["BlogAndCommentConnection"].ConnectionString;
        }

        //Metod, Protected statisk. Returnerar
        protected static SqlConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}