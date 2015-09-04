<%@ Page Language="C#" MasterPageFile="~/adminlogin.master" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<%@ Register Assembly="SPCS.AspDotNet" Namespace="SPCS.AspDotNet" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>adminlogin</title>
    <style type="text/css">
        .style2
        {
            width: 114px;
        }
        .style4
        {
            width: 166px;
        }
        .style7
        {
            width: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Admin Login </h2>
    <table>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="nav_text">
                Admin Name</td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server"  Width="200px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" ErrorMessage="Ente Admin Name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="nav_text">
                Password</td>
            <td class="style4">
                <asp:TextBox ID="TextBox2" runat="server"  TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="None" ErrorMessage="Enter Admin Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <br />
                <asp:Button ID="Button1" runat="server" Height="30px" Text="Login" 
                    Width="70px" onclick="Button1_Click" class="button" />
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
    <cc1:VirtualKeyboard ID="VirtualKeyboard1" runat="server" TargetControlID="TextBox2" />
    
    </cc2:CalendarExtender>
    
</asp:Content>

