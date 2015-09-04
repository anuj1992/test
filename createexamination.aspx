<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="createexamination.aspx.cs" Inherits="createexamination" Title="Untitled Page" %>

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
        width: 69px;
    }
    .style8
    {
        width: 69px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <table width="800px"><tr><td class="style31"><h2>Create Exam</h2></td></tr></table> 
    
    <table class="style4">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Exam id</td>
            <td>
                <asp:TextBox ID="txteid" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Exam Name</td>
            <td>
                <asp:TextBox ID="txtename" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="button" 
                    onclick="Button1_Click" Text="Create Exam" />
            </td>
        </tr>
    </table>

</asp:Content>

