<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="adminmenu.aspx.cs" Inherits="adminmenu" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
        	height:25px;
            color: #FFFFFF;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table style="width: 100%"; height="200px";>
        <tr>
        <th style="background-color:#006666;" class="style7">Entry</th> <th style="background-color:#006666"; class="style7">Eamination</th><th  class="style7" style="background-color:#006666;">Report</th>
        </tr>
        
            <tr>
            <td>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="insertnewbranch.aspx">Branch Entry</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/createexamination.aspx" >Create Exam</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/examresult.aspx">Branchwise Report</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/insertstuinfo.aspx" >Student Entry</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/showexam.aspx">Schedule Exam</asp:HyperLink>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink8" runat="server">Examwise Report</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/insertquestion.aspx">Question Entry</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table><br /><br /><br /><br /><br /><br /><br />

</asp:Content>

