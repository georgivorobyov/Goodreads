using Poetry.Data.Model;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Poetry.Data.Query
{
    public class CommentsQueryHandler : IQueryHandler<CommentQueryModel, IEnumerable<CommentModel>>
    {
        public IEnumerable<CommentModel> Execute(CommentQueryModel query)
        {
            using (SqlConnector connector = new SqlConnector())
            {
                SqlDataReader reader = connector.Read("SELECT u.UserName, c.Comment, c.CreateDate, c.Id FROM Comments as c INNER JOIN aspnet_Users as u ON u.UserId=c.UserId WHERE c.PoemId = @poemId ORDER BY c.CreateDate", new Dictionary<string, object> {
                    {"@poemId", query.PoemId},
                });
                List<CommentModel> comments = new List<CommentModel>();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        CommentModel poem = new CommentModel
                        {
                            Author = reader.GetString(0),
                            Content = reader.GetString(1),
                            Date = reader.GetDateTime(2),
                        };
                        comments.Add(poem);
                    }
                }
                return comments;
            }
        }
    }
}