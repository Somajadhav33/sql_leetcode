<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="StudentForm_DeleteRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            padding: 1px 10px;
            width: 85%;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            height: 246px;
            margin-right: 255px;
        }
        .auto-style2 {
            width: 254px;
        }
        .auto-style6 {
            width: 404px;
        }
        .auto-style3 {
            width: 254px;
            height: 29px;
        }
        .auto-style7 {
            height: 29px;
            width: 404px;
        }
        .auto-style4 {
            height: 29px;
        }
        .auto-style8 {
            width: 254px;
            height: 50px;
        }
        .auto-style9 {
            width: 404px;
            height: 50px;
        }
        .auto-style10 {
            height: 50px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" Font-Underline="True" Text="Update Data"></asp:Label>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label8" runat="server" Text="Student Name : "></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox12" runat="server" Width="398px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox12" ErrorMessage="Enter Name First**" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label9" runat="server" Text="Student Class  : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox7" runat="server" Width="398px" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Student Roll No : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox8" runat="server" Width="398px" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="DOB : "></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox9" runat="server" Width="399px" ToolTip="dd/mm/yyyy" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Mobile No : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox10" runat="server" Width="398px" Enabled="False"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label7" runat="server" Text="Email-Id : "></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox11" runat="server" Width="398px" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                </td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <br />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Search" Width="92px" />
                    <br />
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update" Width="92px" />
                &nbsp;
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label11" runat="server" Text="-"></asp:Label>
                </td>
                <td class="auto-style10">
                    </td>
            </tr>
        </table>
        <br />
    
    </div>
    </form>
</body>
</html>
