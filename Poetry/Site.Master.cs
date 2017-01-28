using System;
using System.Collections.Generic;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Poetry
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool au = this.Page.User.Identity.IsAuthenticated;
        }
    }
}