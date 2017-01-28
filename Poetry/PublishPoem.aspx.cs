using Poetry.Data.Command;
using Poetry.Data.Model;
using Poetry.Helpers;
using System;

namespace Poetry
{
    public partial class PublishPoem : System.Web.UI.Page
    {
        private readonly ICommandHandler<PublishPoemModel> poemHandler;

        public PublishPoem()
        {
            poemHandler = new PoemHandler();
        }

        public PublishPoem(ICommandHandler<PublishPoemModel> poemHandler)
        {
            this.poemHandler = poemHandler;
        }

        protected void ButtonPublishClick(object sender, EventArgs e)
        {
            try
            {
                PublishPoemModel poem = new PublishPoemModel(this.GetCurrentUserId(), TextBoxTitle.Text, TextBoxContent.Text);
                poemHandler.Execute(poem);
                string url = string.Format("~/Poem.aspx?id={0}", poem.Id);
                Response.Redirect(url);
            }
            catch (Exception ex)
            {
                ValidationError.Text = ex.Message;
                ErrorContainer.Visible = true;
            }
        }
    }
}