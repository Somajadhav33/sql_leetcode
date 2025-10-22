<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Page1.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
       <h2>Server.Transfer And Response.Redirect</h2>    
        <br />
    
    </div>
        <asp:Label ID="Label2" runat="server" Text="Go to Page 2(Response.Redirect) - "></asp:Label>
        &nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Page 2" Width="98px" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Go to Page 3(Server.Transfer) - "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Page 3" Width="98px" />
    </form>
</body>
</html>
