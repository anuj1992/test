<%@ Page Language="C#" MasterPageFile="~/userhome.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            
            font-size: x-large;
            text-align: center;
            color: #9EBD4B;
        }
        .style9
        {
            width: 160px;
        }
        .style11
        {
            width: 158px;
        }
        .style12
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
            font-weight: bold;
            text-align: left;
            color: #006666;
        }
        .style13
        {
            width: 7px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <h2 align="left">Student Profile </h2>
    <table width="100%">
        <tr>
            <td class="style6" colspan="4">
                <asp:Label ID="Label1" runat="server" style="font-size: medium"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="nav_text">
                Old Password</td>
            <td class="style9">
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password" 
                    Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" 
                    ErrorMessage="Enter Your Old Password " ValidationGroup="v1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="nav_text">
                New Password</td>
            <td class="style9">
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" 
                    Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="None" 
                    ErrorMessage="Enter New Password" ValidationGroup="v1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="TextBox1" ControlToValidate="TextBox2" Display="None" 
                    ErrorMessage="New Password Should not Match with Old Password" 
                    Operator="NotEqual" ValidationGroup="v1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="nav_text">
                Confirm Password</td>
            <td class="style9">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" 
                    Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" Display="None" 
                    ErrorMessage="Confirm New Password" ValidationGroup="v1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="None" 
                    ErrorMessage="Both New Passwords don't match" ValidationGroup="v1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td class="style9">
                <br />
                <asp:Button class="button" ID="Button1" runat="server" Height="30px" Text="Update " 
                    Width="70px" onclick="Button1_Click" ValidationGroup="v1" />
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" ValidationGroup="v1" />
            </td>
        </tr>
    </table>
</asp:Content>


