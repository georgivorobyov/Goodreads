using Poetry.Data.Model;
using System;
using System.Collections.Generic;

namespace Poetry.Data.Command
{
    public class AddCommandHandler : ICommandHandler<AddCommentModel>
    {
        public void Execute(AddCommentModel model)
        {
            using (SqlConnector connector = new SqlConnector())
            {
                model.Id = connector.ExecuteCommand<int>("INSERT INTO [Comments] ([Comment],[PoemId],[UserId],[CreateDate]) OUTPUT INSERTED.Id VALUES (@comment, @poemId, @userId, @createDate)", new Dictionary<string, object>() {
                    {"@comment", model.Content},
                    {"@poemId", model.PoemId},
                    {"@userId", model.UserId},
                    {"@CreateDate", DateTime.UtcNow}
                });
            }
        }
    }
}