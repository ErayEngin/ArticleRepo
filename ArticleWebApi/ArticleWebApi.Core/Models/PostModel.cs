using System;
using System.Collections.Generic;
using System.Text;

namespace ArticleWebApi.Core.Models
{
    public class PostModel
    {
        public int Id { get; set; }
        public DateTime CreateTime { get; set; }
        public DateTime UpdateTime { get; set; }
        public bool IsDeleted { get; set; }
        public string Title { get; set; }
        public string Text { get; set; }
        public int UserId { get; set; }
    }
}
