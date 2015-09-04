<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="viewstuinfo.aspx.cs" Inherits="viewstuinfo" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
        }
        .style8
        {
            width: 198px;
        }
        .style9
        {
            width: 118px;
        }
        .style10
        {
            width: 337px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <br><h2>
            Student's Information</h2>
<br /> 
        <table class="style4">
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="nav_text" colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                        ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="nav_text">
                    SearchBy Id No&nbsp;&nbsp;
                </td>
                <td class="style10">
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
&nbsp;
                    <asp:Button class="button" ID="searchid" runat="server" Text="Search" 
                        onclick="searchid_Click" Height="25px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="nav_text">
                    Search By Branch</td>
                <td class="style10">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Branchname" 
                        DataValueField="Branchname" Width="250px">
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
                    </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:OnLineExaminationSystemConnectionString %>" 
                        SelectCommand="SELECT [Branchname], [Branchcode] FROM [Branch_Table]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    Select year</td>
                <td class="nav_text">
                     <asp:DropDownList ID="DropDownList5" runat="server" Width="250px">
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
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td>
   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" Height="16px" Width="516px">
                        <RowStyle ForeColor="#000066" />
                        <Columns>
                            <asp:BoundField DataField="Idno" HeaderText="Id No." />
                            <asp:BoundField DataField="Univrollno" HeaderText="Roll No" />
                            <asp:TemplateField HeaderText="Information">
                             <ItemTemplate>

               <b>Name:</b><%#Eval("Name")%><br></br>Date of birth:<b>(<%#Eval("DOB")%>)</b>
               </ItemTemplate> 
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch">
                             <ItemTemplate>
                                <b>Branch:</b><%#Eval("Branchname")%><br />Year: <b>(<%#Eval("Year")%>)</b>
                             </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Emailid" HeaderText="Emailid" />
                            <asp:BoundField DataField="Password" HeaderText="Password" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
    
    
   
                    <asp:Button class="button" ID="searchbr" runat="server" Text="search" 
                        onclick="searchbr_Click" Height="25px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style7" colspan="2">
                    <br />
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
                <td class="style10">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
    </table>
    
   <br />
       
    
   
</asp:Content>

