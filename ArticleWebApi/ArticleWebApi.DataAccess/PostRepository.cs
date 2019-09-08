using ArticleWebApi.Core.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ArticleWebApi.DataAccess
{
    public class PostRepository : IPostRepository
    {
        private readonly SqlGateway sqlGateway;

        public PostRepository(SqlGateway sqlGateway)
        {
            this.sqlGateway = sqlGateway;
        }

        public IEnumerable<PostModel> GetAll()
        {
            string sQuery = "SELECT * FROM Posts WHERE IsDeleted = 0";
            return this.sqlGateway.Fetch<PostModel>(sQuery);
        }

        public void Save(SavePostRequestModel request)
        {
            string sQuery = "INSERT INTO Posts VALUES(GETDATE(),GETDATE(),0, @Title, @text, @UserId)";
            sqlGateway.Execute(sQuery, request);
        }
    }
}
