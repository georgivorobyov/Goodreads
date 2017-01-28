using Poetry.Data.Model;
using System;
using System.Collections.Generic;

namespace Poetry.Data.Command
{
    public class PoemHandler : ICommandHandler<PublishPoemModel>
    {
        public void Execute(PublishPoemModel model)
        {
            using (SqlConnector connector = new SqlConnector())
            {
                model.Id = connector.ExecuteCommand<int>("INSERT INTO [Poems] ([Title],[Body],[PartialBody],[UserId],[CreateDate]) OUTPUT INSERTED.Id VALUES (@title, @body, @partialBody, @userId, @createDate)", new Dictionary<string, object>() {
                    {"@title", model.Title},
                    {"@body", model.Content},
                    {"@partialBody", model.BriefContent},
                    {"@userId", model.UserId},
                    {"@CreateDate", DateTime.UtcNow}
                });
            }
        }
    }
}