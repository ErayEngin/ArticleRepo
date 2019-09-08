using ArticleWebApi.Core.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ArticleWebApi.DataAccess
{
    public interface IPostRepository
    {
        IEnumerable<PostModel> GetAll();
        void Save(SavePostRequestModel request);
    }
}