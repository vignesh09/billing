using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace Billing1
{
    public partial class CreateUser : System.Web.UI.Page
    {
        SqlCommand Billcmd;
        SqlConnection Billcon;
        SqlDataAdapter BillAdp;

        protected void Page_Load(object sender, EventArgs e)
        {
            Billcon = new SqlConnection(ConfigurationManager.ConnectionStrings["BillingConnectionString2"].ToString());

            if (Session["Name"] == null)
                Response.Redirect("LoginPage.aspx");
            else if (!Session["Role"].ToString().Equals("Admin"))
            {
                Response.Redirect("LoginPage.aspx");
            }
            
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            Billcmd = new SqlCommand();
            Billcmd.Connection = Billcon;
            Billcmd.CommandText = "insert into myusers (Name,Password,Role,Priority)Values(@pName,@pPassword,@pRole,@pPriority)";
            Billcmd.CommandType = CommandType.Text;
            Billcmd.Parameters.Add("@pName", SqlDbType.NVarChar).Value = TextBoxName.Text;
            Billcmd.Parameters.Add("@pPassword", SqlDbType.NVarChar).Value = TextBoxPassword.Text;
            Billcmd.Parameters.Add("@pRole", SqlDbType.NVarChar).Value = TextBoxRole.Text;
            Billcmd.Parameters.Add("@pPriority", SqlDbType.NVarChar).Value = TextBoxpri.Text;
            Billcon.Open();
            Billcmd.ExecuteNonQuery();
            Billcon.Close();
            Response.Redirect("CreateUser.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Name"] = null;
            Session["Role"] = null;
        }
    }
}