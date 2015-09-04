<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="examresult.aspx.cs" Inherits="examresult" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 40px;
        }
        .style6
        {
            height: 23px;
        }
        .style8
        {
            height: 23px;
            width: 327px;
        }
        .style9
        {
            height: 12px;
            width: 327px;
        }
        .style10
        {
            height: 40px;
            width: 327px;
        }
        .style11
        {
            height: 12px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">       
    
        <table width="100%"><tr><td class="style31"><h2>Exam Result</h2></td></tr></table> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:OnLineExaminationSystemConnectionString %>" 
                SelectCommand="SELECT [Branchname], [Branchcode] FROM [Branch_Table]">
            </asp:SqlDataSource>
          <table border="0px" >
            <tr>
                <td>
                    Select branch</td>
                <td class="style8">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Branchname" 
                        DataValueField="Branchname" Width="250px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class= "nav_text">
                    Year</td>
                <td class="style8">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="250px">
                        <asp:ListItem>First Year</asp:ListItem>
                        <asp:ListItem>Second Year</asp:ListItem>
                        <asp:ListItem>Third Year</asp:ListItem>
                        <asp:ListItem>Fourth Year</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    </td>
                <td class="style8">
                    <asp:Button ID="Button1" runat="server" CssClass="button" 
                        onclick="Button1_Click" Text="Search" />
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <h2>
                        Student Details</h2>
                </td>
                <td class="style9">
                    <h2>
                        Exam Details
                    </h2>
                </td>
            </tr>
            <tr>
                <td class="style5" bgcolor="#FFFFCC" style="text-align:left">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Width="626px" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        style="margin-right: 0px">
                        <Columns>
                            <asp:BoundField DataField="Idno" HeaderText="Id No" />
                            <asp:BoundField DataField="Name" HeaderText=" Name" />
                            <asp:BoundField DataField="Univrollno" HeaderText="Roll No" />
                            <asp:BoundField DataField="Emailid" HeaderText="email-id" />
                            <asp:CommandField HeaderText="Get result" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="style10" valign="top" bgcolor="#FFFFCC">
                  <asp:GridView ID="GridView2" runat="server" 
                        AutoGenerateColumns="False" Width="350px" 
                        onselectedindexchanged="GridView2_SelectedIndexChanged1" 
                        style="margin-left: 0px">
                        <Columns>
                            <asp:BoundField DataField="Eid" HeaderText="Exam id" />
                            <asp:BoundField DataField="Ename" HeaderText="Exam " />
                            <asp:BoundField DataField="Startdate" HeaderText="Date" />
                            <asp:CommandField HeaderText="Get Result" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2" bgcolor="#FFFFCC">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        style="text-align: center">
                        <Columns>
                            <asp:BoundField DataField="Idno" HeaderText="Student Id No" />
                            <asp:BoundField DataField="mname" HeaderText="Student  Name" />
                            <asp:BoundField DataField="sid" HeaderText="Exam Id" />
                            <asp:BoundField DataField="sname" HeaderText="Exam Name" />
                            <asp:BoundField HeaderText="Total Marks" />
                            <asp:BoundField DataField="omarks" HeaderText="Obtained Marks" />
                            <asp:BoundField DataField="stdate" HeaderText="Date" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
        <br />
       
    
        <br />
        <br />
               
    
</asp:Content>

