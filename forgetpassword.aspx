<%@ Page Language="C#" MasterPageFile="~/userlogin.master" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forgetpassword" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style7
        {
            font-family: "Arial";
            font-size: xx-large;
            font-weight: bold;
            text-align: center;
            color: #006666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style7" colspan="3">
                Retrieve Password</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="#3399FF"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td  class="nav_text">
                Email Id</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"  Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" ErrorMessage="Enter Your Email Id"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" 
                    ErrorMessage="Email Id is Not in Correct Format" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style3">
                <br />
                <asp:Button ID="Button1" runat="server" Height="30px" Text="Get Password" 
                    Width="100px" onclick="Button1_Click"  CssClass ="button"/>
            </td>
            <td rowspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

