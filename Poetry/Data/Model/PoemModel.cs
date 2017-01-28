using System;

namespace Poetry.Data.Model
{
    public class PoemModel
    {
        public int PoemId { get; set; }

        public string Author { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        public DateTime PublishDate { get; set; }
    }
}