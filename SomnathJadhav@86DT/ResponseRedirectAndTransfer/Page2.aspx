<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page2.aspx.cs" Inherits="Page2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>You are on Page 2</h1>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Go Back To Page 1 - "></asp:Label>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Page 1" />
    
    </div>
    </form>
</body>
</html>
