<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="insertquestion.aspx.cs" Inherits="insertquestion" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style8
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #009999;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
        <table width="800px"><tr><td class="style31"><h2>Insert Questions</h2></td><td></td></tr></table> 
    <table width="800px" class="style1">
            
            <tr>
               <td class="style8" style="text-align:left; ">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="425px" 
                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4">
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <Columns>
                        <asp:BoundField DataField="Exam_id" HeaderText="Exam ID" />
                        <asp:BoundField DataField="Exam_name" HeaderText="Exam Name" />
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" >
                            <ControlStyle CssClass="button" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="#CCCCFF" />
                </asp:GridView>
                </td>
                <td class="style8" style="text-align: center">
                    &nbsp;</td>
                <td class="style8" style="text-align: center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8" style="text-align: center">
                    &nbsp;</td>
                <td class="style8" style="text-align: center; ">
                    &nbsp;</td>
                <td class="style8" style="text-align: center">
                    &nbsp;</td>
                <td class="style8" style="text-align: center">
                    &nbsp;</td>
            </tr>
        </table>
   
</asp:Content>

