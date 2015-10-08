<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListBills.aspx.cs" Inherits="Billing1.ListBills" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="Styles/bootstrap.css" rel="stylesheet" />
    <style>
        .header {
             background-color:#009688;
             margin:0;
             padding:10px;
             width:100%;
        }
           a
{
            font-family:Nexa Light;
	text-decoration:none;
	color:white;
    cursor:pointer;
      padding:20px;
	
}
            a:hover {
               
                color:black;
            }
        .drop {

            padding:50px;
            color:white;
            background-color:#404040;
            margin:0;
            width:100%;
            font-family:Nexa Light;
        }
         td{
            font-family:Nexa Light;
            color:black;
            padding:10px;
            
            

        }
         th {
         padding: 20px;
         font-family:Nexa Light;
 
 
  text-align:center;
  color: white;
        }
        
        .field {
            padding:10px;
             font-family:Nexa Light;
        }
        .grid {
        padding:50px;
        }
        input[type="submit"]
{
	padding: 5px 20px 5px 20px;
	border-color:#d1cec0;
    font-family:Nexa Light;
        background-color:#009688;
        color:#662d91;
        border-radius:10px;


}
        .dop {
        color:black;
        }


input[type="submit"]:hover
{
	color:black;
	
}
    </style>
</head>
<body>
    <form id="form1" runat="server" align="middle">
        <div class="container header">
            <div class="row">
                <div class="col-lg-4 ">
                    <img src="images/logo.png" />
                </div>
                <div class="col-lg-2" runat="server"  visible="false"  id="links">
                     <a href="Loginpage.aspx" id="page">Login Page</a>
                </div>
                <div class="col-lg-2">
                     <a href="test.aspx" id="A1">Billing</a>
                </div>
                <div class="col-lg-2">
                     <a href="CreateUser.aspx" id="A3">Create User</a>
                </div>
                
                <div class="col-lg-2">
                     <a href="Stock_Master.aspx" id="A2">Add item</a>
                </div>
            </div>
            
        </div>
        <div class="container drop">
        <div class="row">
                <div class="col-lg-10">
                     <asp:Label ID="Label2" runat="server" Text="Choose the Customer Name to know the billing details"></asp:Label>
                     <asp:DropDownList ID="DropDownList1" CssClass="dop" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CustomerName" DataValueField="CustomerName">
        </asp:DropDownList>
                     
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BillingConnectionString2 %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [BillMaster]"></asp:SqlDataSource>
                </div>
                <div class="col-lg-2">
                      <asp:Button ID="Button2" runat="server" Text="Logout" OnClick="Button2_Click"   />
                </div>
            </div>
        
    
    </div>
    <div>
    
   
       
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BillingConnectionString2 %>" SelectCommand="SELECT DISTINCT [CustomerName] FROM [BillMaster]"></asp:SqlDataSource>
    
       <div class="container grid">
           <div class="row">
               <div class="col-lg-2">

               </div>
               <div class="col-lg-10">
        <asp:GridView ID="GridView1" runat="server" HeaderStyle-BackColor="#009688" HeaderStyle-ForeColor="White"
    RowStyle-BackColor="#3ce1d2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="CustomerName" ControlStyle-CssClass="field" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="ItemCode" ControlStyle-CssClass="field" HeaderText="ItemCode" SortExpression="ItemCode" />
                <asp:BoundField DataField="ItemName" ControlStyle-CssClass="field" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Quantity" ControlStyle-CssClass="field" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Price"  ControlStyle-CssClass="field" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Total" ControlStyle-CssClass="field" HeaderText="Total" SortExpression="Total" />
            </Columns>
        </asp:GridView>
                   </div>
               </div>
           </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BillingConnectionString2 %>" SelectCommand="SELECT [CustomerName], [ItemCode], [ItemName], [Quantity], [Price], [Total] FROM [BillMaster] WHERE ([CustomerName] = @CustomerName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CustomerName" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
