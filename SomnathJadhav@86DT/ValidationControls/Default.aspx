<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" BorderStyle="None" Font-Bold="True" Text="Validation Controls"></asp:Label>
        <br />
    <div>
    
        <asp:Label ID="Label2" runat="server" Text="Enter You Name : "></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Your Name First**" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Enter Age : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Age must be over 18**" ForeColor="Red" MaximumValue="50" MinimumValue="18"></asp:RangeValidator>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Enter Password : "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<br />
        <asp:Label ID="Label5" runat="server" Text="Confirm Password : "></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ErrorMessage="Password Do Not Match**" ForeColor="Red"></asp:CompareValidator>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Enter E-Mail : "></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" Width="210px"></asp:TextBox>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5" ErrorMessage="Invalid mail**" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        <asp:Button ID="Button1" runat="server" Text="Submit" ViewStateMode="Enabled" OnClick="Button1_Click" />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
