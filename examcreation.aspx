<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="examcreation.aspx.cs" Inherits="examcreation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 206px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Create Exam</h2>
    <div style=" border:solid 1px #006666">
    <div style="float:left ;">
          <table>
    
    <tr>
        <td colspan="2">
            <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            Exam Id</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="250px" ReadOnly="True"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" Display="None" 
                ErrorMessage="Exam Id should not be Blank"></asp:RequiredFieldValidator>
        </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style1">
            Exam Name</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" Display="None" 
                ErrorMessage="Exam Name is Required"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td valign="middle" class="style1">
            Start Date</td>
        <td valign="middle">
            
            <asp:TextBox ID="TextBox3" runat="server" Width="232" class="datetimepicker"></asp:TextBox>
                    
            
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" Display="None" 
                ErrorMessage="Start Date is Required"></asp:RequiredFieldValidator>
        </td>
        <td>
                                                </td>
    </tr>
    <tr>
        <td valign="middle" class="style1">
            End Date</td>
        <td valign="middle">
           
            <asp:TextBox ID="TextBox4" runat="server" Width="232px" class="datetimepicker"></asp:TextBox>
           </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" Display="None" 
                ErrorMessage="Exam Ending Date is Required"></asp:RequiredFieldValidator>
        </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style1">
            Duration</td>
        <td>
            <asp:DropDownList ID="DropDownList5" runat="server" Width="250px">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>40</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>60</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox5" Display="None" 
                ErrorMessage="No. of Questions to be Displayed is Required"></asp:RequiredFieldValidator>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            Negative Mark         
        </td>
        <td>
            <asp:DropDownList ID="DropDownList3" runat="server" Width="250px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>0.25</asp:ListItem>
                <asp:ListItem>0.50</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox3" ControlToValidate="TextBox4" Display="None" 
                ErrorMessage="End Date Should be greater than Start Date" 
                Operator="GreaterThan"></asp:CompareValidator>&nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            Correct Mark</td>
        <td>
            <asp:DropDownList ID="DropDownList4" runat="server" Width="250px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox5" Display="None" 
                ErrorMessage="No. of Questions Should be in integer only" 
                ValidationExpression="^(([1-9]*)|(([1-9]*).([0-9]*)))$"></asp:RegularExpressionValidator>
 &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style1">
            No. of Questions to be Displayed</td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" Width="250px"></asp:TextBox>
        </td>
        <td>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:OnLineExaminationSystemConnectionString %>" 
                SelectCommand="SELECT [Branchname], [Branchcode] FROM [Branch_Table]">
            </asp:SqlDataSource>
                                                </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td valign="top" class="style1">
            Exam For</td>
        <td valign="top">
            <asp:DropDownList ID="DropDownList2" runat="server" Width="250px" 
                Font-Bold="True">
                <asp:ListItem>First Year</asp:ListItem>
                <asp:ListItem>Second Year</asp:ListItem>
                <asp:ListItem>Third Year</asp:ListItem>
                <asp:ListItem>Fourth Year</asp:ListItem>
                <asp:ListItem>All Year</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
        <td>
            </td>
    </tr>
    <tr>
        <td valign="top" class="style1">
            Select Branch</td>
        <td valign="top">
            <asp:Button ID="Button2" runat="server" Text="Create Exam" onclick="Button2_Click" CssClass="button" />&nbsp;&nbsp;
            &nbsp;</td>
        <td>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style1">
            &nbsp;</td>
        <td>
           
   
     
            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                Font-Italic="True" Height="16px" NavigateUrl="~/insertquestion.aspx" 
                Width="220px">Click Here To Insert Questions..</asp:HyperLink>
        </td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ShowMessageBox="True" ShowSummary="False" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
    </div>
    <div style="float:right;margin-top:20px;margin-right:200px;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                Width="230px">
                <Columns>
                    <asp:BoundField DataField="Branchname" HeaderText="Branch" />
                     <asp:TemplateField HeaderText="Select">
                            <HeaderTemplate>
                        <asp:CheckBox ID="chkSelectAll" runat="server"
                                      AutoPostBack="true"
                                      OnCheckedChanged="chkSelectAll_CheckedChanged"/>Select All
                    </HeaderTemplate>
                        <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" runat="server"/>
                        </ItemTemplate>
                        </asp:TemplateField>
                </Columns>
            </asp:GridView>
       </div>
       </div>
            </asp:Content>

