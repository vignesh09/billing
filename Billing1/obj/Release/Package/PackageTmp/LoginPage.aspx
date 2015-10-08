<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Billing1.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <style>
        .login
{
	  margin-left: 31%;
  margin-top: 8%;
  width: 30%;
	padding:25px;
	border: 3px outset #828180;
   background-color: rgba(0, 2, 161, 0);
    border-radius: 9px;
    border-width: 2px;
    box-shadow: 0 0 5px #978c7d,inset 0 0 18px #b8afa3;
}
.login:hover
{
	background-color: rgba(0, 2, 161, 0.1);
}
body {
     font-family:Rockwell;
    font-size:14px;
}

.logoheader {
    background-color:#009688;
}
td {
    width: 350px;
}
.llabel
{
	font-family:Nexa Light;
}
.logs {
    background-color:#009688;
    color:#662d91;
    font-family:Nexa Light;
    font-size:14px;
}
.field
{
	border-radius:5px;
	font-family:Nexa Light;
	padding-left:7px;

}


input[type="submit"]
{
	padding-left: 20px;
	padding-right: 20px;
	border-color:#d1cec0;
    font-family:Nexa Light;
        background-color:#009688;
        color:#662d91;


}

input[type="submit"]:hover
{
	color:black;
	
}

td
{
	padding:10px;
}

    </style>
   
</head> 
<body >
    <div class="logoheader">
        <img src="images/logo.png" />
    </div>
    <div class="login">
    <form id="form1" runat="server" >
<asp:Login ID = "Login1"  runat = "server" OnAuthenticate= "ValidateUser" Height="151px" Width="343px">
    <LayoutTemplate>
        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
            <tr>
                <td>
                    <table cellpadding="0">
                        <tr>
                            <td align="center" colspan="2" class="auto-style1 logs">Log In</td>
                        </tr>
                        <tr>
                            <td align="left" class="llabel" >
                                User Name:</td>
                            <td>
                                <asp:TextBox CssClass="field" ID="UserName" runat="server"  placeholder="Enter UserName"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="PasswordLabel" CssClass="llabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox  class="field" ID="Password" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="RememberMe" runat="server" CssClass="llabel" Text="Remember me next time." />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </div>
    </LayoutTemplate>
        </asp:Login>
</form>
</body>
</html>
