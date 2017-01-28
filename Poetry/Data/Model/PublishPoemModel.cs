using System;

namespace Poetry.Data.Model
{
    public class PublishPoemModel
    {
        private const int MaxBriefContentLength = 500;
        private const int MaxTitleLength = 255;

        private string title;
        private string content;
        private string briefContent;

        public PublishPoemModel(Guid userId, string title, string content)
        {
            UserId = userId;
            Title = title;
            Content = content;
            BriefContent = content.Substring(0, Math.Min(content.Length, MaxBriefContentLength));
        }

        public int Id { get; set; }

        public Guid UserId { get; private set; }

        public string Title
        {
            get { return title; }
            private set
            {
                if (value == null || value.Length > MaxTitleLength)
                    throw new ArgumentException("The title cannot be empty or more than 255 characters.");
                title = value;
            }
        }

        public string BriefContent
        {
            get { return briefContent; }
            set
            {
                if (string.IsNullOrEmpty(value) || value.Length > MaxBriefContentLength)
                    throw new ArgumentException("The brief content cannot be empty or longer than 500 chars.");
                briefContent = value;
            }
        }

        public string Content
        {
            get { return content; }
            private set
            {
                if (string.IsNullOrEmpty(value))
                    throw new ArgumentException("The content cannot be empty.");
                content = value;
            }
        }
    }
}