using Poetry.Data.Model;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Poetry.Data.Query
{
    public class PoemQueryHandler : IQueryHandler<PoemQueryModel, PoemModel>
    {
        public PoemModel Execute(PoemQueryModel query)
        {
            using (SqlConnector connector = new SqlConnector())
            {
                SqlDataReader reader = connector.Read("SELECT TOP 1 u.UserName, p.Title, p.Body, p.CreateDate, p.Id FROM Poems as p INNER JOIN aspnet_Users as u ON u.UserId=p.UserId WHERE p.Id = @poemId", new Dictionary<string, object> {
                    {"@poemId", query.PoemId},
                });
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        return new PoemModel
                        {
                            Author = reader.GetString(0),
                            Title = reader.GetString(1),
                            Content = reader.GetString(2),
                            PublishDate = reader.GetDateTime(3),
                            PoemId = reader.GetInt32(4)
                        };
                    }
                }
            }

            return null;
        }
    }
}