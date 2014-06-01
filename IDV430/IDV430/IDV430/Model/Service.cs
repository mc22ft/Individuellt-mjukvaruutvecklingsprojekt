using IDV430.Model.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDV430.Model
{
    public class Service
    {
        //Privata fält för DAL klasserna
        private BlogDAL _blogDAL;
        private CommentDAL _commentDAL;

        //Properties
        private BlogDAL BlogDAL
        {
            //Om det inte finns ett BlogDAL obj så skapas ett
            get { return _blogDAL ?? (_blogDAL = new BlogDAL()); }
        }

        private CommentDAL CommentDAL
        {
            //Om det inte finns ett CommentDAL obj så skapas ett
            get { return _commentDAL ?? (_commentDAL = new CommentDAL()); }
        }
             
//---------------------------------------------------------------------------------------------------------
        //BLOG
        public void SaveBlog(Blog blog)
        {
            //Valedering
            //GetValidation

            //Lägg till eller updaterar
            if (blog.PostBlogID == 0)
            {
                BlogDAL.InsertBlog(blog);
            }
            else
            {
                BlogDAL.updateBlog(blog);
            }
        }

        //Hämtar alla blog inlägg
        public IEnumerable<Blog> GetBlogs()
        {
            return BlogDAL.GetBlogs();
        }

       //Hämtare en blog med id
        public Blog GetOneBlogById(int id)
        {
            return BlogDAL.GetOneBlogById(id);
        }


        //Raderar en Blog med id
        public void DeleteBlog(int id)
        {
            BlogDAL.DeleteBlog(id);
        }

        //Hämtar alla bloginlägg som till hör en anv
        public IEnumerable<Blog> GetAllBlogById(string id)
        {
            return BlogDAL.GetAllBlogById(id);
        }

//---------------------------------------------------------------------------------------------------------
        //kommentar

        //Hämtar alla Kommentarer med hjälp av blogID
        public IEnumerable<Comment> GetComments(int id)
        {
            return CommentDAL.GetComments(id);
        }

        //Sparar en kommentar
        public void SaveComment(Comment Comment)
        {
            CommentDAL.SaveComment(Comment);
        }

        //tar bort en kommentar
        public void DeleteComment(int id)
        {
            CommentDAL.DeleteComment(id);
        }
    }
}