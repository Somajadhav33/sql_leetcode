<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RetriveData.aspx.cs" Inherits="StudentForm_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 93%;
        }
        .auto-style3 {
            border-width: 1px;
            padding: 1px 4px;
width: 207px;
        }
        .auto-style4 {
            border-width: 1px;
            padding: 1px 4px;
width: 83px;
        }
        .auto-style8 {
            width: 207px;
            height: 26px;
            text-align: center;
        }
        .auto-style9 {
            width: 83px;
            height: 26px;
            text-align: center;
        }
        .auto-style15 {
            width: 51px;
            height: 26px;
            text-align: center;
        }
        .auto-style16 {
            border-width: 1px;
            padding: 1px 4px;
width: 51px;
        }
        .auto-style17 {
            width: 89px;
            height: 26px;
            text-align: center;
        }
        .auto-style18 {
            border-width: 1px;
            padding: 1px 4px;
width: 89px;
        }
        .auto-style22 {
            width: 145px;
            height: 26px;
            text-align: center;
        }
        .auto-style23 {
            border-width: 1px;
            padding: 1px 4px;
width: 145px;
        }
        .auto-style24 {
            width: 127px;
            height: 26px;
            text-align: center;
        }
        .auto-style25 {
            border-width: 1px;
            padding: 1px 4px;
width: 127px;
        }
        #form1 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
        }
        .auto-style26 {
            width: 85px;
            height: 26px;
            text-align: center;
        }
        .auto-style27 {
            border-width: 1px;
            padding: 1px 4px;
            width: 85px;
        }
    </style>
</head>
<body>
    <center>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Search For Student Record" Font-Bold="False" Font-Size="Larger" Font-Underline="True"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Text="Enter Student Name  -"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Height="26px" Width="313px"></asp:TextBox>
&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Retrive Data" Height="34px" OnClick="Button1_Click" Width="110px" />
        <br />
        <br />
        <table class="auto-style1" border="1">
            <tr>
                <td class="auto-style15">
                    <asp:Label ID="Label2" runat="server" Text="Id"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label4" runat="server" Text="Class"></asp:Label>
                </td>
                <td class="auto-style26">
                    <asp:Label ID="Label5" runat="server" Text="Roll No"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label6" runat="server" Text="DOB"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:Label ID="Label7" runat="server" Text="Mobile No"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:Label ID="Label8" runat="server" Text="Email-Id"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:Label ID="Label10" runat="server" Text="NULL"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label11" runat="server" Text="NULL"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label12" runat="server" Text="NULL"></asp:Label>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="Label13" runat="server" Text="NULL"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label14" runat="server" Text="NULL"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:Label ID="Label15" runat="server" Text="NULL"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:Label ID="Label16" runat="server" Text="NULL"></asp:Label>
                </td>
            </tr>
        </table>
    <div>
    
        <asp:Label ID="Label17" runat="server" Text="-"></asp:Label>
    
    </div>
    </form>
        </center>
</body>
</html>
