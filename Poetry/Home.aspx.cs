using Poetry.Data.Model;
using Poetry.Data.Query;
using System;
using System.Collections.Generic;

namespace Poetry
{
    public partial class Home : System.Web.UI.Page
    {
        const int PageSize = 10;

        private readonly IQueryHandler<PoemsQueryModel, IEnumerable<PoemModel>> queryHandler;

        public Home()
        {
            queryHandler = new PoemsQueryHandler();
        }

        public Home(IQueryHandler<PoemsQueryModel, IEnumerable<PoemModel>> queryHandler)
        {
            this.queryHandler = queryHandler;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int pageNumber = 0;
            int.TryParse(Request.QueryString["page"], out pageNumber);
            PoemsQueryModel query = new PoemsQueryModel(PageSize, pageNumber);
            RepeaterPoems.DataSource = queryHandler.Execute(query);
            RepeaterPoems.DataBind();
        }
    }
}