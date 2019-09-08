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

        public IEnumerable<PostResponseModel> GetAll()
        {
            string sQuery = "SELECT * FROM Posts WHERE IsDeleted = 0";
            var list = this.sqlGateway.Fetch<PostResponseModel>(sQuery);

            foreach (var item in list)
            {
                string sQuery2 = "SELECT C.Id, C.Name FROM CategoriesPosts CP INNER JOIN Categories C ON CP.CategoryId = C.Id WHERE PostId = " + item.Id;
                var categories = this.sqlGateway.Fetch<CategoryModel>(sQuery2);
                item.Categories = (List<CategoryModel>)categories;
            }
            return list;
        }

        public void Save(SavePostRequestModel request)
        {
            string sQuery = "INSERT INTO Posts VALUES(GETDATE(),GETDATE(),0, @Title, @text, @UserId); SELECT CAST(SCOPE_IDENTITY() as int)";
            var id = sqlGateway.QueryFirst<int>(sQuery, request);

            foreach (var item in request.CategorieIds)
            {
                string queryForCategories = "INSERT INTO CategoriesPosts(CategoryId,PostId) VALUES(@categoryId, @postId)";
                sqlGateway.Execute(queryForCategories, new { @categoryId = item, @postId = id });
            }
        }

        public void Update(PostResponseModel request)
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
