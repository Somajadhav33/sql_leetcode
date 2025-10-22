<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ImageUpload_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .upload {
            padding:8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;
        <asp:FileUpload ID="FileUpload" runat="server" Height="21px" Width="270px" BorderColor="#999999" BorderStyle="Solid" Padding="10px" CssClass="upload"/>
&nbsp;
        <asp:Button ID="Button2" runat="server" Height="41px" OnClick="Button2_Click" Text="Upload" Width="109px" BorderColor="#999999" BorderStyle="Solid" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" Height="466px" Width="335px" BorderColor="Black" />
    
    </div>
    </form>
</body>
</html>
