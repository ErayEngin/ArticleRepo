﻿using System;
using System.Collections.Generic;
using System.Linq;
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
        public ActionResult<IEnumerable<PostResponseModel>> Get()
        {
            var result = postRepository.GetAll();
            return result.ToList();
        }

        [HttpPost]
        public ActionResult Get(SavePostRequestModel requestModel)
        {
            try
            {
                postRepository.Save(requestModel);
                return Ok("Kaydedildi.");
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPut]
        public ActionResult<bool> Update(PostResponseModel requestModel)
        {
            try
            {
                postRepository.Update(requestModel);
                return Ok("Güncellendi.");
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpDelete]
        [Route("{id}")]
        public ActionResult<bool> Delete(int id)
        {
            try
            {
                postRepository.Delete(id);
                return Ok(id+ " Id'li veri silindi.");
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }
    }
}
