using ArticleWebApi.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ArticleWebApi.DataAccess
{
    public interface IPostRepository
    {
        IEnumerable<PostResponseModel> GetAll();
        void Save(SavePostRequestModel request);
        void Update(PostResponseModel request);
        void Delete(int id);
    }
}