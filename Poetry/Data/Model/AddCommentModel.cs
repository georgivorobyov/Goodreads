using System;

namespace Poetry.Data.Model
{
    public class AddCommentModel
    {
        private string content;

        public AddCommentModel(Guid userId, int poemId, string content)
        {
            UserId = userId;
            Content = content;
            PoemId = poemId;
        }

        public int Id { get; set; }

        public Guid UserId { get; private set; }

        public int PoemId { get; private set; }

        public string Content
        {
            get { return content; }
            set
            {
                if (string.IsNullOrEmpty(value))
                    throw new ArgumentException("The body of the comment cannot be empty.");
                content = value;
            }
        }
    }
}
