using Poetry.Data.Command;
using Poetry.Data.Model;
using Poetry.Data.Query;
using Poetry.Helpers;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Poetry
{
    public partial class Poem : Page
    {
        private readonly IQueryHandler<PoemQueryModel, PoemModel> poemQueryHandler;
        private readonly ICommandHandler<AddCommentModel> addCommentHandler;
        private readonly IQueryHandler<CommentQueryModel, IEnumerable<CommentModel>> commentsQueryHandler;
        private int poemId;

        public Poem()
        {
            poemQueryHandler = new PoemQueryHandler();
            addCommentHandler = new AddCommandHandler();
            commentsQueryHandler = new CommentsQueryHandler();
        }

        public Poem(IQueryHandler<PoemQueryModel, PoemModel> poemQueryHandler,
            ICommandHandler<AddCommentModel> addCommentHandler,
            IQueryHandler<CommentQueryModel, IEnumerable<CommentModel>> commentsQueryHandler)
        {
            this.poemQueryHandler = poemQueryHandler;
            this.addCommentHandler = addCommentHandler;
            this.commentsQueryHandler = commentsQueryHandler;
        }

        public PoemModel PoemModel { get; set; }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["id"], out poemId))
                Server.Transfer("~/404.aspx");
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            PoemModel = poemQueryHandler.Execute(new PoemQueryModel { PoemId = poemId });
            RepeaterComments.DataSource = commentsQueryHandler.Execute(new CommentQueryModel { PoemId = poemId });
            RepeaterComments.DataBind();
        }

        protected void ButtonCommentClick(object sender, EventArgs e)
        {
            Label validationLabel = LoginView.FindControl("ValidationError") as Label;
            HtmlGenericControl errorContainer = LoginView.FindControl("ErrorContainer") as HtmlGenericControl;
            TextBox textBox = LoginView.FindControl("TextBoxContent") as TextBox;
            if (textBox == null || validationLabel == null || errorContainer == null)
                Server.Transfer("~/Oops.aspx");

            try
            {
                addCommentHandler.Execute(new AddCommentModel(this.GetCurrentUserId(), poemId, textBox.Text));
            }
            catch (Exception ex)
            {
                validationLabel.Text = ex.Message;
                errorContainer.Visible = true;
            }
            textBox.Text = String.Empty;
        }
    }
}