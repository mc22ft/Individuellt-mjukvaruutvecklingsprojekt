using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IDV430.Model.DAL
{
    public class BlogDAL : DALBase
    {

        //Lägger till en blog
        public void InsertBlog(Blog blog)
        {
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    //lagrade proceduren
                    SqlCommand cmd = new SqlCommand("dbo.usp_CreateBlog", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Lägger till den data som den lagrade proceduren kräver
                    cmd.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = blog.UserID;
                    cmd.Parameters.Add("@HeadLineBlog", SqlDbType.VarChar, 50).Value = blog.HeadLine;
                    cmd.Parameters.Add("@ContentBlog", SqlDbType.VarChar, -1).Value = blog.Content;
                    //output
                    cmd.Parameters.Add("@PostBlogID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

                    //Öppnar anslutningen till databasen
                    conn.Open();

                    //Kör den lagrade proceduren
                    cmd.ExecuteNonQuery();

                    //Hämtar primärnyckelns värde och tilldelar den nya costom objektet värdet
                    blog.PostBlogID = (int)cmd.Parameters["@PostBlogID"].Value;

                }
                catch
                {
                    throw new ApplicationException("Fel när det skulle läggas till i databasen!");
                }
            }
        }


        //updaterar en blog
        public void updateBlog(Blog blog)
        {
            // Skapar och initierar ett anslutningsobjekt.
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    // exekveras specifierad lagrad procedur.
                    SqlCommand cmd = new SqlCommand("dbo.usp_updateBlog", conn); //Skapa nu update Procedure
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Lägger till de paramterar den lagrade proceduren kräver
                    cmd.Parameters.Add("@HeadLineBlog", SqlDbType.VarChar, 50).Value = blog.HeadLine;
                    cmd.Parameters["@HeadLineBlog"].Value = blog.HeadLine;

                    cmd.Parameters.Add("@ContentBlog", SqlDbType.VarChar, -1).Value = blog.Content;
                    cmd.Parameters["@ContentBlog"].Value = blog.Content;

                    //Id
                    cmd.Parameters.Add("@PostBlogID", SqlDbType.Int, 4).Value = blog.PostBlogID;
                    cmd.Parameters["@PostBlogID"].Value = blog.PostBlogID;
                   

                    //Öppnar anslutningen, databasen
                    conn.Open();

                    //Exekvera den lagrade proceduren.
                    cmd.ExecuteNonQuery();

                    // Hämtar primärnyckelns värde för den nya posten och tilldelar kategori-objektet värdet.
                    blog.PostBlogID = (int)cmd.Parameters["@PostBlogID"].Value;
                }
                catch
                {
                    // Kastar ett eget undantag om ett undantag kastas.
                    throw new ApplicationException("Det blev något fel i hämtningen från databasen!");
                }
            }

        }


        public IEnumerable<Blog> GetBlogs()
        {
            //Skapar och initierar anslutningsobjektet
            using (var conn = CreateConnection())
            {
                try
                {
                    //Listobj plats för ?? objekt
                    var blog = new List<Blog>(200);

                    //lagrade proceduren
                    var cmd = new SqlCommand("dbo.usp_Getlist_OrByID_Blog", conn);
                    cmd.CommandType = CommandType.StoredProcedure;                    

                    //öppnar anslutningen
                    conn.Open();

                    //skapar ett SqlDataReader-objekt och returnerar en referens till objektet.
                    using (var reader = cmd.ExecuteReader())
                    {
                        //Tar reda på vilken index de olika kolumenrna har
                        var PostBlogIDIndex = reader.GetOrdinal("PostBlogID");
                        var UserIDIndex = reader.GetOrdinal("UserID");
                        var HeadLineBlogIndex = reader.GetOrdinal("HeadLineBlog");
                        var ContentBlogIndex = reader.GetOrdinal("ContentBlog");
                        var DateIndex = reader.GetOrdinal("Date");

                        //Så länge det finns poster kvar i listan. Annars false
                        while (reader.Read())
                        {
                            blog.Add(new Blog 
                            {
                                //Hämtar ut kolumnerna med egenskaperna
                                PostBlogID = reader.GetInt32(PostBlogIDIndex),
                                UserID = reader.GetString(UserIDIndex),
                                HeadLine = reader.GetString(HeadLineBlogIndex),
                                Content = reader.GetString(ContentBlogIndex),
                                Date = reader.GetDateTime(DateIndex)                           
                            });
                           
                        }
                    }

                    //Tar bort det mine som inte används
                    blog.TrimExcess();

                    return blog;
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel när data skulle hämtas från databasen!");
                }
            }
        }

        public Blog GetOneBlogById(int PostBlogID)
        {
            //Skapar och initierar anslutningsobjektet
            using (var conn = CreateConnection())
            {
                try
                {
                    
                    //lagrade proceduren
                    var cmd = new SqlCommand("dbo.usp_Getlist_OrByID_Blog", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Lägger till den parameter som den lagrade proceduren kärver
                    cmd.Parameters.Add("@PostBlogID", SqlDbType.Int, 4).Value = PostBlogID;

                    //öppnar anslutningen
                    conn.Open();

                    //skapar ett SqlDataReader-objekt och returnerar en referens till objektet.
                    using (var reader = cmd.ExecuteReader())
                    {
                        //Tar reda på vilken index de olika kolumenrna har
                        var PostBlogIDIndex = reader.GetOrdinal("PostBlogID");
                        var UserIDIndex = reader.GetOrdinal("UserID");
                        var HeadLineBlogIndex = reader.GetOrdinal("HeadLineBlog");
                        var ContentBlogIndex = reader.GetOrdinal("ContentBlog");
                        var DateIndex = reader.GetOrdinal("Date");

                        //Så länge det finns poster kvar i listan. Annars false
                        while (reader.Read())
                        {
                            return new Blog
                            {
                                //Hämtar ut kolumnerna med egenskaperna
                                PostBlogID = reader.GetInt32(PostBlogIDIndex),
                                UserID = reader.GetString(UserIDIndex),
                                HeadLine = reader.GetString(HeadLineBlogIndex),
                                Content = reader.GetString(ContentBlogIndex),
                                Date = reader.GetDateTime(DateIndex)
                            };

                        }
                    }

                    return null;
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel när data skulle hämtas från databasen!");
                }
            }
        }

        public void DeleteBlog(int id)
        {
            // Skapar och initierar ett anslutningsobjekt.
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    // exekveras specifierad lagrad procedur.
                    SqlCommand cmd = new SqlCommand("dbo.usp_DelBlog", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Lägger till den parameter som den lagrade proceduren kärver
                    cmd.Parameters.Add("@BlogPostID", SqlDbType.Int, 4).Value = id;

                    //Öppnar anslutningen, databasen
                    conn.Open();


                    //Exekvera den lagrade proceduren.
                    cmd.ExecuteNonQuery();
                }
                catch
                {
                    // Kastar ett eget undantag om ett undantag kastas.
                    throw new ApplicationException("Det blev något fel i hämtningen från databasen!");
                }
            }
        }
    }
}