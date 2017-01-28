using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Poetry
{
    public partial class Register : System.Web.UI.Page
    {
        protected void ButtonRegisterClick(object sender, EventArgs e)
        {
            if (IsValid)
            {
                MembershipUser user = Membership.CreateUser(TextBoxUsername.Text, TextBoxPassword.Text, TextBoxEmail.Text);
                FormsAuthentication.SetAuthCookie(TextBoxUsername.Text, true);
                Response.Redirect("Home.aspx", false);
            }
        }
    }
}