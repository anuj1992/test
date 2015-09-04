<%@ Page Language="C#" MasterPageFile="~/userlogin.master" AutoEventWireup="true" CodeFile="userlogin.aspx.cs" Inherits="userlogin" Title="Untitled Page" %>

<%@ Register Assembly="SPCS.AspDotNet" Namespace="SPCS.AspDotNet" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--<meta http-equiv="refresh" content="5">-->

    <link href="css/keyboard.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
        .style1
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            text-align: left;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            width: 216px;
        }
        .style2
        {
            width: 82px;
        }
        .style3
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            text-align: left;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            width: 82px;
        }
        .style4
        {
            width: 82px;
            height: 27px;
        }
        .style5
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            text-align: left;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            height: 27px;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
    
<table width="100%" style="border:solid 1px #006666 ;padding-right:5px;" align="left" cellspacing="0px" >
        <tr>
            <td colspan="3" >
                <h2>User Login Here</h2>
	</td>
        </tr>
        <tr>
            <td colspan="3" valign="baseline" >
                <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Red" 
                    Font-Bold="True" Font-Size="Large" style="font-size: small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" >
                User Email
            </td>
            <td class="style1">
                <asp:TextBox ID="TextBox1" runat="server" Width="250px"   placeholder="Your Email"></asp:TextBox>
                <br />
            </td>
            <td class="style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" ErrorMessage="Enter Your Name"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3" >
               Password
            </td>
            <td class="style1" >
                <asp:TextBox ID="TextBox2" runat="server" Width="250px" TextMode="Password"  placeholder="Your Password"></asp:TextBox>
                <br />
            </td>
            <td class="style1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="None" ErrorMessage="Enter Your Password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2" >
                &nbsp;</td>
            <td>
                <asp:Button CssClass="button" ID="Button1" runat="server" Height="26px" Text="Login" 
                    Width="64px" onclick="Button1_Click" />
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" >
                </td>
            <td class="style5" colspan="2">
               
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/studentregister.aspx" >New Student Register Here.</asp:HyperLink>
           
            </td>
            </tr>
            <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2" class="nav_text"><asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/forgetpassword.aspx">Retrieve Your Password from Here</asp:HyperLink></td>
            </tr>
            <tr>
            <td colspan="3" class="style1">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" style="margin-bottom: 21px" />
                <cc1:VirtualKeyboard ID="VirtualKeyboard1" runat="server" 
                    ForControl="TextBox2" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
    </table>
    
    
    
    
    
    
</asp:Content>

