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
    public partial class LoginPage : System.Web.UI.Page
    {
        SqlCommand Billcmd;
        SqlConnection Billcon;
        SqlDataAdapter BillAdp;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ValidateUser(object sender, AuthenticateEventArgs e)
        {
            Billcmd = new SqlCommand();
            Billcon = new SqlConnection(ConfigurationManager.ConnectionStrings["BillingConnectionString2"].ToString());
            Billcmd.Connection = Billcon;
            Billcmd.CommandText = "select * from myusers where Name=@pName and Password=@pPassword";
            Billcmd.CommandType = CommandType.Text;
            Billcmd.Parameters.Add("@pName", SqlDbType.NVarChar).Value = Login1.UserName;
            Billcmd.Parameters.Add("@pPassword", SqlDbType.NVarChar).Value = Login1.Password;
            Billcon.Open();
            try
            {
                SqlDataReader reader = Billcmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["Name"] = reader["Name"].ToString();
                    Session["Role"] = reader["Role"].ToString();
                    String s=Session["Role"].ToString();

                   
                }
                Billcon.Close();
              
            }
            catch(Exception r){
                Response.Redirect("test.aspx");
            } Response.Redirect("Stock_Master.aspx");

   
        } } 
}