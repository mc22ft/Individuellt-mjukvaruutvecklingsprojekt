using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace IDV430.Model.DAL
{
    public class CommentDAL : DALBase
    {
        public void SaveComment(Comment Comment)
        {

            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    //lagrade proceduren
                    SqlCommand cmd = new SqlCommand("dbo.usp_CreateComment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Lägger till den data som den lagrade proceduren kräver
                    cmd.Parameters.Add("@UserID", SqlDbType.VarChar, 50).Value = Comment.UserID;
                    cmd.Parameters.Add("@Name", SqlDbType.VarChar, 50).Value = Comment.Name;
                    cmd.Parameters.Add("@Epost", SqlDbType.VarChar, 50).Value = Comment.Epost;
                    cmd.Parameters.Add("@Webbpage", SqlDbType.VarChar, 50).Value = Comment.Webbpage;                    
                    cmd.Parameters.Add("@Comment", SqlDbType.VarChar, -1).Value = Comment.CommentTxt;
                    cmd.Parameters.Add("@PostBlogID", SqlDbType.Int, 4).Value = Comment.PostBlogID;

                    //output
                    cmd.Parameters.Add("@CommentID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

                    //Öppnar anslutningen till databasen
                    conn.Open();

                    //Kör den lagrade proceduren
                    cmd.ExecuteNonQuery();

                    //Hämtar primärnyckelns värde och tilldelar den nya costom objektet värdet
                    Comment.CommentID = (int)cmd.Parameters["@CommentID"].Value;

                }
                catch
                {
                    throw new ApplicationException("Fel när det skulle läggas till i databasen!");
                }
            }

        }




        public IEnumerable<Comment> GetComments(int BlogID)
        {
            //Skapar och initierar anslutningsobjektet
            using (var conn = CreateConnection())
            {
                try
                {
                    //var CommentObj = new Comment();
                    //CommentObj.PostBlogID = BlogID;


                    //Listobj plats för ?? objekt
                    var comment = new List<Comment>(200);
                    
                    //lagrade proceduren
                    var cmd = new SqlCommand("dbo.usp_Getlist_OrByID_Comment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;


                    //Lägger till den parameter som den lagrade proceduren kärver
                    cmd.Parameters.Add("@PostBlogID", SqlDbType.Int, 4).Value = BlogID;


                    //öppnar anslutningen
                    conn.Open();

                    //skapar ett SqlDataReader-objekt och returnerar en referens till objektet.
                    using (var reader = cmd.ExecuteReader())
                    {
                        //Tar reda på vilken index de olika kolumenrna har
                        
                        var UserIDIndex = reader.GetOrdinal("UserID");
                        var NameIndex = reader.GetOrdinal("Name");
                        var EpostIndex = reader.GetOrdinal("Epost");
                        var WebbPageIndex = reader.GetOrdinal("WebbPage");
                        var CommentIndex = reader.GetOrdinal("Comment");
                        var DateIndex = reader.GetOrdinal("Date");

                        //var PostBlogIDIndex = reader.GetOrdinal("PostBlogID");

                        //Så länge det finns poster kvar i listan. Annars false
                        while (reader.Read())
                        {
                            comment.Add(new Comment
                            {
                                //Hämtar ut kolumnerna med egenskaperna
                                
                                UserID = reader.GetString(UserIDIndex),
                                Name = reader.GetString(NameIndex),
                                Epost = reader.GetString(EpostIndex),
                                Webbpage = reader.GetString(WebbPageIndex),
                                CommentTxt = reader.GetString(CommentIndex),
                                Date = reader.GetDateTime(DateIndex)

                                //PostBlogID = reader.GetInt32(PostBlogIDIndex)
                            });

                        }
                    }

                    //Tar bort det mine som inte används
                    comment.TrimExcess();

                    return comment;
                }
                catch
                {
                    throw new ApplicationException("Det blev något fel när data skulle hämtas från databasen!");
                }
            }
        }



        public void DeleteComment(int id)
        {
            // Skapar och initierar ett anslutningsobjekt.
            using (SqlConnection conn = CreateConnection())
            {
                try
                {
                    // exekveras specifierad lagrad procedur.
                    SqlCommand cmd = new SqlCommand("dbo.usp_DelComment", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    //Lägger till den parameter som den lagrade proceduren kärver
                    cmd.Parameters.Add("@CommentID", SqlDbType.Int, 4).Value = id;

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