<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Billing1.test" %>

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
        .content {
            padding: 30px;
           
        }
        .content td {
            padding:20px;
        }
        .field
{
	border-radius:5px;
	font-family:Nexa Light;
	padding-left:7px;

}
        .llabel {
            font-family:Nexa Light;
        }
      
        .grid table {
            border-color:white;
            border-width:0px;
           
        }
        .grid td{
            font-family:Nexa Light;
            color:black;
            padding:10px;
            border-right:none;

        }
        .grid th {
         padding: 10px;
  background-color: #009688;
  border-radius: 9px;
  text-align:center;
  color: white;
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

    </style>
</head>
<body>
    <form id="form1" runat="server" align="middle">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
         <div class ="container header">
            <div class="row">
                <div class="col-lg-4">
                     <img src="images/logo.png" />
                </div>
                <div class="col-lg-2"  runat="server"  id="links">
                      <a href="Loginpage.aspx" id="page">Login Page</a>
                </div>
                <div class="col-lg-2">
                     <a href="CreateUser.aspx" id="A1">Create User</a>
                </div>
                
                <div class="col-lg-2">
                   <a href="ListBills.aspx" id="A3">List Bills</a>
                </div>
                <div class="col-lg-2">
                   <a href="Stock_Master.aspx" id="A2">Add item</a>
                </div>
            
            
            </div>
        </div>
        <div>  
            <div class="container">
                <div class="row content">
                    <div class="col-lg-6">
                        <table>
                            <tr>
                                <td>
                                     <asp:Label ID="Label2"  CssClass="llabel" runat="server" >Customer Name</asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                     <asp:TextBox ID="CutomerName"  CssClass="field" runat="server"  AutoPostBack="true" OnTextChanged="CutomerName_TextChanged"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                      <asp:Label ID="Label1"  CssClass="llabel" runat="server" Text="Priority"></asp:Label>
                                </td>
                                <td>:</td>
                                <td>
                                     <asp:TextBox ID="TextBox6"  CssClass="field" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-lg-4">
                        <img src="images/eCommerce-2.jpg" width="300px" height="200px"/>
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="Button2" runat="server" Text="Logout" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
            
    
  <div class="container">
   <div class="row">
       <div class="grid col-lg-12">
   <asp:gridview ID="Gridview1" runat="server" ShowFooter="true" DefaultButton="ButtonAdd" 
       AutoGenerateColumns="false" align="center" >
       
        <Columns>
        <asp:BoundField DataField="RowNumber" HeaderText="Sl.No" />
        <asp:TemplateField HeaderText="Item Code">
            <ItemTemplate>
                <asp:TextBox ID="TextBox1" CssClass="field" runat="server" AutoPostBack="true" OnTextChanged="TextBox1_TextChanged" ></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Item Name">
            <ItemTemplate>
                <asp:TextBox ID="TextBox2" CssClass="field" runat="server"></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:TextBox ID="TextBox3" CssClass="field" runat="server" AutoPostBack="true" OnTextChanged="TextBox3_TextChanged" ></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
       
            <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:TextBox ID="TextBox4" CssClass="field" runat="server"  ></asp:TextBox>
            </ItemTemplate>
        </asp:TemplateField>
       
             <asp:TemplateField HeaderText="Total">
            <ItemTemplate>
                 <asp:TextBox ID="TextBox5" CssClass="field" runat="server"></asp:TextBox>
            </ItemTemplate>
            <FooterStyle HorizontalAlign="Right" />
            <FooterTemplate>
                      
                 <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" visible="false" OnClick="ButtonAdd_Click" />
            <asp:Button ID="Submit1" runat="server" Text="Submit" OnClick="ButtonSubmit1_Click" />
                            </FooterTemplate>
        </asp:TemplateField>
        </Columns>
</asp:gridview>
    </div>
       </div>

      
  </div> 
       <div class="container">
           <div class="row">
               <div class="col-lg-12">
    <asp:TextBox ID="TextBoxTotal" CssClass="field" runat="server" ></asp:TextBox>
       </div>
               </div>
           </div>
        
    </form>
   
</body>
</html>
