<%@ Page Language="C#" MasterPageFile="~/userhome.master" AutoEventWireup="true" CodeFile="userhome.aspx.cs" Inherits="userhome" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
<h2 align="left">Student Profile </h2>
                             <p>
                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                     BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                     CellPadding="3" Height="74px" Width="800px">
                                     <RowStyle ForeColor="#000066" />
                                     <Columns>
                                         <asp:BoundField DataField="Idno" HeaderText="Id no">
                                             <ControlStyle Font-Bold="True" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Univrollno" HeaderText="Roll No">
                                             <ControlStyle Font-Bold="True" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Name" HeaderText="Name">
                                             <ControlStyle Font-Bold="True" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="DOB" HeaderText="Date of Birth">
                                             <ControlStyle Font-Bold="True" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Branchname" HeaderText="Branch">
                                             <ControlStyle Font-Bold="True" />
                                         </asp:BoundField>
                                         <asp:BoundField DataField="Year" HeaderText="Year">
                                             <ControlStyle Font-Bold="True" />
                                         </asp:BoundField>
                                     </Columns>
                                     <FooterStyle BackColor="White" ForeColor="#000066" />
                                     <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                     <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="White" />
                                 </asp:GridView>
    </p>

</asp:Content>


