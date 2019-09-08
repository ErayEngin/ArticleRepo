using System;
using System.Collections.Generic;
using System.Text;

namespace ArticleWebApi.Core.Models
{
    public class SavePostRequestModel
    {
        public string Title { get; set; }
        public string Text { get; set; }
        public int UserId { get; set; }
        public List<int> CategorieIds { get; set; }
    }
}
