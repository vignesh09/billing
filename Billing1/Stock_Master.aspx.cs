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
    public partial class Stock_Master : System.Web.UI.Page
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
                Response.Redirect("test.aspx");
            }
           
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Name"] = null;
            Session["Role"] = null;
            Response.Redirect("LoginPage.aspx");
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            Billcmd = new SqlCommand();
            Billcmd.Connection = Billcon;
            Billcmd.CommandText = "insert into Master (ItemCode,Name,Price,CompanyName,CompanyCode,Discount,VAT,MRP,CostPrice)Values(@pItemCode,@pName,@pPrice,@pCompanyName,@pCompanyCode,@pDiscout,@pVAT,@pMRP,@pCostPrice)";
            Billcmd.CommandType = CommandType.Text;
            Billcmd.Parameters.Add("@pName", SqlDbType.NVarChar).Value = TextBoxName.Text.Trim().ToUpper();
            Billcmd.Parameters.Add("@pItemCode", SqlDbType.BigInt).Value = TextBoxCode.Text.Trim();
            Billcmd.Parameters.Add("@pPrice", SqlDbType.Float).Value = TextBoxPrice.Text.Trim();
            Billcmd.Parameters.Add("@pCompanyName", SqlDbType.NVarChar).Value = TextBoxCompanyName.Text.Trim().ToUpper().ToString();
            Billcmd.Parameters.Add("@pCompanyCode", SqlDbType.BigInt).Value = TextBoxCompanycode.Text.Trim();
            Billcmd.Parameters.Add("@pDiscout", SqlDbType.Float).Value = TextBoxDiscount.Text.Trim();
            Billcmd.Parameters.Add("@pVAT", SqlDbType.Float).Value = TextBoxVAT.Text.Trim();
            Billcmd.Parameters.Add("@pMRP", SqlDbType.Float).Value = TextBoxMRP.Text.Trim();
            Billcmd.Parameters.Add("@pCostPrice", SqlDbType.Float).Value = TextBoxCostPrice.Text.Trim();
            Billcon.Open();
            Billcmd.ExecuteNonQuery();
            Billcon.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "js", "<script>alert('stock added successfully');</script>", false);
            Response.Redirect("test.aspx");
        }
    }
}