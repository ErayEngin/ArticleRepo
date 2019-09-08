using ArticleWebApi.Core.Models;
using System.Collections.Generic;

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

        public void Update(PostModel request)
        {
            string sQuery = "UPDATE Posts SET UpdateTime = GETDATE(), Title = @Title, Text= @Text WHERE Id = @Id";
            sqlGateway.Execute(sQuery, request);
        }

        public void Delete(int id)
        {
            string sQuery = "UPDATE Posts SET IsDeleted = 1 WHERE Id = @Id";
            sqlGateway.Execute(sQuery, new { @Id = id });
        }

    }
}
