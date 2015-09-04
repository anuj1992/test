<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="insertstuinfo.aspx.cs" Inherits="insertstuinfo" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        .style7
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            text-align: left;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            width: 122px;
        }
        .style8
        {
            width: 122px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table width="100%">
        <tr>
        <td>
            <h2>Insert Students Information</h2>
         </td>
         <td></td>
         </tr></table> 
        <table width="100%">
        
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                        style="font-size: medium"></asp:Label>
                </td>
            </tr>
            <tr>
                <td  colspan="3">
                    <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" 
                        onclick="LinkButton1_Click" style="font-size: small">Click here to 
                    insert Student Information ...</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" style="font-size: small" 
                        onclick="LinkButton3_Click">Click 
                    here to Browse Students lists</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    Select Branch Name</td>
                <td style="text-align:left">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        Width="200px" DataSourceID="SqlDataSource1" DataTextField="Branchname" 
                        DataValueField="Branchcode" >
                    </asp:DropDownList>
                </td>
                <td >
                    </td>
            </tr>
            <tr>
                <td class="style7" >
                    Select Year</td>
                <td style="text-align:left">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="200px">
                        <asp:ListItem>First Year</asp:ListItem>
                        <asp:ListItem>Second Year</asp:ListItem>
                        <asp:ListItem>Third Year</asp:ListItem>
                        <asp:ListItem>Fourth Year</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td >
                </td>
            </tr>
            <tr>
                <td  valign="top" colspan="2">
                    <asp:Panel ID="brw" runat="server">
                        <table >
                            <tr>
                                <td class="nav_text">
                                    Browse Student Lists</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" Height="22px" 
                                        style="margin-left:0px" />
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    &nbsp;</td>
                                <td>
                                     &nbsp;<asp:Button ID="Button1" runat="server" class="button" Height="27px" 
                                        onclick="Button1_Click" Text="Add Students" Width="88px" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td  valign="top" colspan="2">
                    <asp:Panel ID="manual" runat="server">
                        <table >
                            <tr>
                                <td class="nav_text" >
                                    Student Id No</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="nav_text">
                                    Student Roll No</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="nav_text">
                                    Name</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="nav_text">
                                    Student&#39;s Contact No</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="nav_text">
                                    Father&#39;s Name</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="nav_text">
                                    Father&#39;s Contact No</td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" CssClass="button" 
                                        onclick="Button2_Click" Text="Add Student" />
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td >
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top" class="style8">
                    &nbsp;</td>
                <td valign="baseline">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OnLineExaminationSystemConnectionString %>" 
                        SelectCommand="SELECT [Branchname], [Branchcode] FROM [Branch_Table]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
   
</asp:Content>

