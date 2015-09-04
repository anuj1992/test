<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="insertnewbranch.aspx.cs" Inherits="insertnewbranch" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    
    <h2>Insert New Branch</h2>
    
    <div style="float:left">
    <table>
        <tr>
            <td colspan="2" style="text-align: left">
                <asp:Label ID="Label1" runat="server" ForeColor="#6600FF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="nav_text">
                Branch Name</td>
            <td >
                <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" Display="None" 
                    ErrorMessage="Branch Name is Not Provided">*</asp:RequiredFieldValidator></td>
            
        </tr>
        <tr>
            <td class="nav_text">
                Branch Code</td>
            <td >
                <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" Display="None" 
                    ErrorMessage="Branch Code must be There">*</asp:RequiredFieldValidator></td>
            
        </tr>
        <tr>
            <td >
                &nbsp;</td>
            <td  align="left">
                <asp:Button class="button" ID="Button1" runat="server" Height="30px" onclick="Button1_Click" 
                    Text="Add Branch" />
            </td>
        </tr>
        <tr><td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
    </div>
    <div class="sub"> <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" Width="340px">
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:BoundField DataField="Branchcode" HeaderText="Branch Code" />
                        <asp:BoundField DataField="Branchname" HeaderText="Branch Name" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                <br /><br /><br /><br /><br />
                </div>
     
</asp:Content>

