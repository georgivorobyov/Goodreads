using Poetry.Data.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;

namespace Poetry.Data.Query
{
    public class PoemsQueryHandler : IQueryHandler<PoemsQueryModel, IEnumerable<PoemModel>>
    {
        public IEnumerable<PoemModel> Execute(PoemsQueryModel query)
        {
            using (SqlConnector connector = new SqlConnector())
            {
                int pageNumber = query.PageNumber - 1;
                if (pageNumber < 0) pageNumber = 0;
                SqlDataReader reader = connector.Read("SELECT u.UserName, p.Title, p.PartialBody, p.CreateDate, p.Id FROM Poems as p INNER JOIN aspnet_Users as u ON u.UserId=p.UserId ORDER BY p.CreateDate DESC OFFSET @PageSize * @PageNumber ROWS FETCH NEXT @PageSize ROWS ONLY", new Dictionary<string, object> {
                    {"@PageSize", query.PageSize},
                    {"@PageNumber", pageNumber}
                });
                List<PoemModel> poems = new List<PoemModel>();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        PoemModel poem = new PoemModel
                        {
                            Author = reader.GetString(0),
                            Title = reader.GetString(1),
                            Content = reader.GetString(2),
                            PublishDate = reader.GetDateTime(3),
                            PoemId = reader.GetInt32(4)
                        };
                        poems.Add(poem);
                    }
                }
                return poems;
            }
        }
    }
}