<%@ Page Language="C#" MasterPageFile="~/userlogin.master" AutoEventWireup="true" CodeFile="studentregister.aspx.cs" Inherits="studentregister" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: left;
            width: 155px;
        }
        .style3
        {
            text-align: left;
            font-size: xx-large;
            font-family: "Courier New", Courier, monospace;
            color: #80BB47;
                height: 13px;
        }
        .style4
        {
            width: 438px;
        }
        .style6
        {
            width: 14px;
        }
        .style7
        {
            text-align: center;
            font-size: large;
            font-weight: 700;
        }
        .style8
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            text-align: left;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" style="border:solid 1px #006666 ;padding-right:5px;" align="left" cellspacing="0px" >
        <tr>
            <td class="style3" colspan="3">
                                    <h2>New Student's Registration </h2>
	</td>
        </tr>
        <tr>
            <td class="style7" colspan="2">
                <asp:Label ID="Label2" runat="server" Font-Italic="True" ForeColor="Red" 
                    style="font-size: medium"></asp:Label>
                <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Red" 
                    style="font-size: medium"></asp:Label>
                </td>
            <td>
                <h5>
                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Size="Medium" 
                        NavigateUrl="~/userlogin.aspx">Goto Home Page</asp:HyperLink>
                </h5>
                                         </td>
        </tr>
        <tr>
            <td class="style8">
                College Id Number</td>
            <td >
                <asp:TextBox ID="TextBox1" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" ErrorMessage="Provide College Id"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                First Name</td>
            <td class="style4">
                <asp:TextBox ID="TextBox2" runat="server" Width="250px" 
                    style="margin-bottom: 0px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="None" 
                    ErrorMessage="First Name Can,t be Blank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Last Name</td>
            <td class="style4">
                <asp:TextBox ID="TextBox3" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" Display="None" 
                    ErrorMessage="Last Name Can,t be Blank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Date of Birth</td>
            <td class="style4">
                <b>Day:</b>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="50px">
                </asp:DropDownList>
                <b>Month:</b>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="50px">
                </asp:DropDownList>
                <b>Year:</b>&nbsp;
                <asp:DropDownList ID="DropDownList3" runat="server" Width="70px">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Branch Name</td>
            <td class="style4">
                &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="Branchname" 
                    DataValueField="Branchcode" Width="250px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:OnLineExaminationSystemConnectionString %>" 
                    SelectCommand="SELECT [Branchname], [Branchcode] FROM [Branch_Table]">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Select Year</td>
            <td class="style4">
                &nbsp;<asp:DropDownList ID="DropDownList5" runat="server" Width="250px">
                        <asp:ListItem>First Year</asp:ListItem>
                        <asp:ListItem>Second Year</asp:ListItem>
                        <asp:ListItem>Third Year</asp:ListItem>
                        <asp:ListItem>Fourth Year</asp:ListItem>
                    </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                Email Id</td>
            <td class="style4">
                <asp:TextBox ID="TextBox4" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox4" Display="None" 
                    ErrorMessage="Email Id Should Not be Blank"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox4" Display="None" 
                    ErrorMessage="Provide Correct Email id" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Password</td>
            <td class="style4">
                <asp:TextBox ID="TextBox5" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextBox5" Display="None" 
                    ErrorMessage="Password Should not be Blank"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Confirm Password</td>
            <td class="style4">
                <asp:TextBox ID="TextBox6" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextBox6" Display="None" 
                    ErrorMessage="Confirm Your Password"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox5" ControlToValidate="TextBox6" Display="None" 
                    ErrorMessage="Both Passwords are not Same"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" 
                    ConfirmText="Make Sure all Entries Are Filled by You and are Correct. 
                    You can use your registered  E-mail Incase You Forget Your Password" TargetControlID="Button1">
                </cc1:ConfirmButtonExtender>   &nbsp;</td>
            <td class="style4">
                <br />
                <asp:Button class="button" ID="Button1" runat="server" Text="Register" Width="70px" 
                    Height="30px" onclick="Button1_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" 
                     Font-Size="Large" NavigateUrl="~/userlogin.aspx">Click 
                Here to Login..</asp:HyperLink>
            </td>
            <td rowspan="2" valign="top">
                <asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

