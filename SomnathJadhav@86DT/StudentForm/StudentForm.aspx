<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentForm.aspx.cs" Inherits="StudentForm_StudentForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            padding: 1px 10px;
            width: 85%;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            height: 248px;
            margin-right: 255px;
        }
        .auto-style2 {
            width: 254px;
        }
        #form1 {
            height: 323px;
        }
        .auto-style3 {
            width: 254px;
            height: 29px;
        }
        .auto-style4 {
            height: 29px;
        }
        .auto-style5 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style6 {
            width: 404px;
        }
        .auto-style7 {
            height: 29px;
            width: 404px;
        }
    </style>
</head>
<body style="height: 311px">
   <center> <form id="form1" runat="server">
    <div style="height: 321px; width: 1095px">
    
        <asp:Label ID="Label1" runat="server" Text="Student Information Form" Font-Size="Large" Font-Underline="True"></asp:Label>
        <br />
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Student Name : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox1" runat="server" Width="398px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Name First**" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Student Class  : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox7" runat="server" Width="398px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="Class is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="Student Roll No : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox8" runat="server" Width="398px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox8" ErrorMessage="Roll no is must" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="DOB : "></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox9" runat="server" Width="399px" ToolTip="dd/mm/yyyy"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox9" ErrorMessage="Enter Dob" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="Mobile No : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox10" runat="server" Width="398px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label7" runat="server" Text="Email-Id : "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox11" runat="server" Width="398px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox11" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <br />
        <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" />
                &nbsp;&nbsp;
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br class="auto-style5" />
        <br />
        <asp:Label ID="Label8" runat="server" Text="_"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
       </center>
</body>
</html>
