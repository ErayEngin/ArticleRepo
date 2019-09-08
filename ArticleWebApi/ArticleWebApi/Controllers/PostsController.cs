using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ArticleWebApi.Core.Models;
using ArticleWebApi.DataAccess;
using Microsoft.AspNetCore.Mvc;

namespace ArticleWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostsController : ControllerBase
    {
        private readonly IPostRepository postRepository;

        public PostsController(IPostRepository postRepository)
        {
            this.postRepository = postRepository;
        }

        // GET api/posts
        [HttpGet]
        public ActionResult<IEnumerable<PostModel>> Get()
        {
            var result = postRepository.GetAll();
            return result.ToList();
        }
    }
}
