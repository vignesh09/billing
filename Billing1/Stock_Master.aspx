<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock_Master.aspx.cs" Inherits="Billing1.Stock_Master" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
        td {
            padding: 10px 40px 10px 40px;

        }
        .llabel {
            font-family:Nexa Light;
            color:#662d91;
            font-weight:bold;
        }
        .field {

            border-radius:4px;
            box-shadow: -2px 4px 15px -1px rgba(0,0,0,0.75);
        }
        a
{
            font-family:Nexa Light;
	text-decoration:none;
	color:white;
    cursor:pointer;
    
    padding:20px;
	
}
        .header a {
            margin-top:10px;
        }
            a:hover {
               
                color:black;
            }
        .heading h1 {
             font-family:Nexa Light;
            color:#662d91;
        }
        .out {
            margin-top:30px;
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


input[type="submit"]:hover
{
	color:black;
	
}
        .pic {
            background-image: url('images/E-Commerce-.jpg');
            background-size: contain;
  background-repeat: no-repeat;
  height: 384px;
            
        }
      

    </style>
</head>
<body>
    <form runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
        <div class ="container header">
            <div class="row">
                <div class="col-lg-4">
                     <img src="images/logo.png" />
                </div>
                <div class="col-lg-2">
                      <a href="Loginpage.aspx" class="Login" id="page">Login Page</a>
                </div>
                <div class="col-lg-2">
                    <a href="test.aspx" id="A1">Billing</a>
                </div>
                <div class="col-lg-2">
                     <a href="CreateUser.aspx" id="A2">Create User</a>
                </div>
                
                <div class="col-lg-2">
                     <a href="ListBills.aspx" id="A3">List Bills</a>
                </div>
            
            
            </div>
        </div>
       <div class="container">
           <div class="row heading">
               <div class="col-lg-10">
                   <h1>Product Information</h1>
                   </div>
               <div class="col-lg-2 out">
                   
      <asp:Button ID="Button2" runat="server" Text="Logout" OnClick="Button2_Click"            />
  
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BillingConnectionString2 %>" SelectCommand="SELECT * FROM [Master]"></asp:SqlDataSource>
               </div>
           </div>
           </div>
     
 
    <div class="container">
        <div class="row">  
            <div class="col-lg-4 pic">
                </div>
            <div class="col-lg-8">    
                <table>
                    <tr>
                        <td>
                             <asp:Label ID="Label1" CssClass="llabel" runat="server" Text="ItemName"></asp:Label>
                        </td>
                        <td>
                             <asp:TextBox ID="TextBoxName" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="LabelCode" CssClass="llabel" runat="server"  Text="ItemCode"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCode" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="LabelPrice" CssClass="llabel" runat="server" Text="Price"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxPrice" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="LabelCompanyName" CssClass="llabel"  runat="server" Text="CompanyName"></asp:Label>
                        </td>
                        <td>
                             <asp:TextBox ID="TextBoxCompanyName" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                               <asp:Label ID="LabelCompanycode" CssClass="llabel" runat="server" Text="Companycode"></asp:Label>
                        </td>
                        <td>
                             <asp:TextBox ID="TextBoxCompanycode" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelDiscount" CssClass="llabel" runat="server" Text="Discount"></asp:Label>
                        </td>
                        <td>
                             <asp:TextBox ID="TextBoxDiscount" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Label ID="LabelVAT" CssClass="llabel" runat="server" Text="VAT"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxVAT" CssClass="field"  runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelMRP" CssClass="llabel" runat="server" Text="MRP"></asp:Label>
                        </td>
                        <td>
                             <asp:TextBox ID="TextBoxMRP" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LabelCostPrice" CssClass="llabel" runat="server" Text="CostPrice"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxCostPrice" CssClass="field" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" 
            onclick="ButtonSubmit_Click" />
                        </td>
                        <td>
                             <asp:Button ID="ButtonReset" runat="server" Text="Reset" />
                        </td>
                    </tr>
                </table>
              
                       
            </div>
          
              
    <br />
    
    
    <br />
             
   
    <br />
   
            </div>
            </div>
  
  
  
    </div>
    </form>
</body>
</html>
