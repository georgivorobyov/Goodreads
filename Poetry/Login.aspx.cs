using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Poetry
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Login_Click(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(TextBoxUsername.Text, TextBoxPassword.Text))
            {
                FormsAuthentication.SetAuthCookie(TextBoxUsername.Text, true);
                Response.Redirect("Home.aspx", false);
            }
            else
            {
                ErrorContainer.Visible = true;
                ValidationError.Text = "Invalid username and/or password.";
            }
        }
    }
}