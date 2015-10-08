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
    public partial class test : System.Web.UI.Page
    {
        SqlCommand Billcmd;
        SqlConnection Billcon;
        SqlDataAdapter BillAdp;
       static int count=0;
       bool f=false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Name"] == null)
                Response.Redirect("LoginPage.aspx");
            else if (Session["Role"].ToString().Equals("Admin"))
            {
                links.Visible = true;
            }
           
            if (!Page.IsPostBack)
            {
                TextBoxTotal.Text = null;

                SetInitialRow();
                if(count>0)
                {
                    count = 0;
                }
            }
   

        }

        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemCode", typeof(string)));
            dt.Columns.Add(new DataColumn("ItemName", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dt.Columns.Add(new DataColumn("Price", typeof(string)));
            dt.Columns.Add(new DataColumn("Total", typeof(string)));

            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dr["ItemCode"] = string.Empty;
            dr["ItemName"] = string.Empty;
            dr["Quantity"] = string.Empty;
            dr["Price"] = string.Empty;
            dr["Total"] = string.Empty;
            
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState
            ViewState["CurrentTable"] = dt;

            Gridview1.DataSource = dt;
            Gridview1.DataBind();
        }



        private void AddNewRowToGrid()
        {

            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the TextBox values
                        TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                        TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");
                        TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");
                        TextBox box4 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox4");
                        TextBox box5 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox5");

                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;
                        drCurrentRow["ItemCode"] = box1.Text;
                        drCurrentRow["ItemName"] = box2.Text;
                        drCurrentRow["Quantity"] = box3.Text;
                        drCurrentRow["Price"] = box4.Text;
                        drCurrentRow["Total"] = box5.Text;

                        rowIndex++;
                    }

                    //add new row to DataTable
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState
                    ViewState["CurrentTable"] = dtCurrentTable;

                    //Rebind the Grid with the current data
                    Gridview1.DataSource = dtCurrentTable;
                    Gridview1.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }

            //Set Previous Data on Postbacks
            SetPreviousData();
        }

        private void SetPreviousData()
        {
            try
            {
                int rowIndex = 0;
                if (ViewState["CurrentTable"] != null)
                {
                    DataTable dt = (DataTable)ViewState["CurrentTable"];
                    if (dt.Rows.Count > 0)
                    {
                        if (!f)
                        {
                            int i;
                            for (i = 1; i <= dt.Rows.Count; i++)
                            {
                                if (i < dt.Rows.Count)
                                {
                                    TextBox box1 = (TextBox)Gridview1.Rows[rowIndex].Cells[1].FindControl("TextBox1");
                                    TextBox box2 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("TextBox2");
                                    TextBox box3 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("TextBox3");
                                    TextBox box4 = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("TextBox4");
                                    TextBox box5 = (TextBox)Gridview1.Rows[rowIndex].Cells[5].FindControl("TextBox5");

                                    box1.Text = dt.Rows[i]["ItemCode"].ToString();
                                    box2.Text = dt.Rows[i]["ItemName"].ToString();
                                    box3.Text = dt.Rows[i]["Quantity"].ToString();
                                    box4.Text = dt.Rows[i]["Price"].ToString();
                                    box5.Text = dt.Rows[i]["Total"].ToString();
                                    rowIndex++;
                                }
                            }
                        }
                       
                        

                    }
                }
            }catch(Exception e)
            {

            }
        }
       

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
            TextBox box1 = (TextBox)Gridview1.Rows[count].Cells[1].FindControl("TextBox1");
            box1.Focus();
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Name"] = null;
            Session["Role"] = null;
            Response.Redirect("LoginPage.aspx");
        }

        protected void ButtonSubmit1_Click(object sender, EventArgs e)
        {
              int rowIndex = 0;
              if (ViewState["CurrentTable"] != null)
              {
                  DataTable dt = (DataTable)ViewState["CurrentTable"];
                  for (int i = 0; i < dt.Rows.Count-1; i++)
                  {
                      if (i < dt.Rows.Count)
                      {

                          TextBox box1 = (TextBox)Gridview1.Rows[i].Cells[1].FindControl("TextBox1");
                          TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox2");
                          TextBox box3 = (TextBox)Gridview1.Rows[i].Cells[3].FindControl("TextBox3");
                          TextBox box4 = (TextBox)Gridview1.Rows[i].Cells[4].FindControl("TextBox4");
                          TextBox box5 = (TextBox)Gridview1.Rows[i].Cells[5].FindControl("TextBox5");
                          Billcmd = new SqlCommand();
                          Billcon = new SqlConnection(ConfigurationManager.ConnectionStrings["BillingConnectionString2"].ToString());
                          Billcmd.Connection = Billcon;
                          Billcmd.CommandText = "insert into BillMaster (BillNumber,ItemCode,ItemName,Price,Quantity,Total,CustomerName)Values(1,@pItemCode,@pName,@pPrice,@pQuantity,@pTotal,@pcustomerName)";
                          Billcmd.CommandType = CommandType.Text;
                          Billcmd.Parameters.Add("@pItemCode", SqlDbType.BigInt).Value = Convert.ToInt32(box1.Text);
                          Billcmd.Parameters.Add("@pCustomerName",SqlDbType.NVarChar).Value = CutomerName.Text;
                          Billcmd.Parameters.Add("@pName", SqlDbType.NVarChar).Value = box2.Text.Trim().ToUpper();
                          Billcmd.Parameters.Add("@pQuantity", SqlDbType.BigInt).Value = Convert.ToInt32(box3.Text);
                          Billcmd.Parameters.Add("@pPrice", SqlDbType.Float).Value = Convert.ToDouble(box4.Text);
                          Billcmd.Parameters.Add("@pTotal", SqlDbType.Float).Value = Convert.ToDouble(box5.Text);
                          Billcon.Open();
                          Billcmd.ExecuteNonQuery();
                          Billcon.Close();
                          ScriptManager.RegisterStartupScript(this, this.GetType(), "js", "<script>alert('Item has Billed successfully');</script>", false);
          
                          Response.Redirect("test.aspx");
                      }
                  }
              }

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           
            TextBox box1 = (TextBox)Gridview1.Rows[count].Cells[1].FindControl("TextBox1");
            TextBox box2 = (TextBox)Gridview1.Rows[count].Cells[2].FindControl("TextBox2");
            TextBox box3 = (TextBox)Gridview1.Rows[count].Cells[4].FindControl("TextBox4");
            TextBox box4 = (TextBox)Gridview1.Rows[count].Cells[3].FindControl("TextBox3");
          
            Billcmd = new SqlCommand();
            Billcon = new SqlConnection(ConfigurationManager.ConnectionStrings["BillingConnectionString2"].ToString());
            Billcmd.Connection = Billcon;
            Billcmd.CommandText = "select * from Master where ItemCode=@pItemcode";
            Billcon.Open();
           Billcmd.Parameters.Add("@pItemCode", SqlDbType.BigInt).Value =box1.Text;
           SqlDataReader reader = Billcmd.ExecuteReader();
           if (reader.Read())
           {
               box2.Text = reader["Name"].ToString();
               box3.Text = reader["Price"].ToString();
           }
           Billcon.Close();
          
           box4.Focus();
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            double t;
            TextBox box1 = (TextBox)Gridview1.Rows[count].Cells[3].FindControl("TextBox3");
            TextBox box2 = (TextBox)Gridview1.Rows[count].Cells[4].FindControl("TextBox4");
            TextBox box3 = (TextBox)Gridview1.Rows[count].Cells[5].FindControl("TextBox5");
            double t1 = Convert.ToDouble(box1.Text);
            double t2 = Convert.ToDouble(box2.Text);
            double s = t1 * t2;
           
            count++;
            box3.Focus();
           
          
                if (TextBox6.Text.Equals("1"))
                {
                    double s1=s/10;
                    s -= s1;
                }
                if (TextBox6.Text.Equals("2"))
                {
                    double s1 = s / 20;
                    s -= s1;
                }
                if (TextBox6.Text.Equals("3"))
                {
                    double s1 = s / 30;
                    s -= s1;
                }
                if (TextBoxTotal.Text != "")
                {
                    t = Convert.ToDouble(TextBoxTotal.Text);
            }else{
              t = 0;
            }
            box3.Text = Convert.ToString(s);
            t += s;
            TextBoxTotal.Text = Convert.ToString(t);
            AddNewRowToGrid();
            TextBox box4 = (TextBox)Gridview1.Rows[count].Cells[5].FindControl("TextBox1");
            box4.Focus();
        }

        protected void CutomerName_TextChanged(object sender, EventArgs e)
        {
            Billcmd = new SqlCommand();
            Billcon = new SqlConnection(ConfigurationManager.ConnectionStrings["BillingConnectionString2"].ToString());
            Billcmd.Connection = Billcon;
            Billcmd.CommandText = "select * from myusers where Name=@pname";
            Billcon.Open();
            Billcmd.Parameters.Add("@pname", SqlDbType.NVarChar).Value = CutomerName.Text;
            SqlDataReader reader = Billcmd.ExecuteReader();
            try
            {
                if (reader.Read())
                {

                    TextBox6.Text = reader["Priority"].ToString();
                }
                Billcon.Close();
            }
            catch (Exception r)
            {
            }
           
        }

       

         

       

      

       
    }
}