using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Billing1
{
    public partial class ListBills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Name"] == null)
                Response.Redirect("LoginPage.aspx");
            else if (Session["Role"].ToString().Equals("Admin"))
            {
                links.Visible = true;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Name"] = null;
            Session["Role"] = null;
            Response.Redirect("LoginPage.aspx");
        }
    }
}