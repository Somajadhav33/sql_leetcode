<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteRecord.aspx.cs" Inherits="StudentForm_DeleteRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="Delete Record" Font-Bold="True" Font-Size="Large" Font-Underline="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Enter Name to Delete - "></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="242px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete Record" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="-"></asp:Label>
    
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
