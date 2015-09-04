<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userhomelink.ascx.cs" Inherits="userhomelink" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        height: 23px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style2">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/userhome.aspx" 
                style="text-align: center">Home</asp:HyperLink>
        </td>
        <td class="style2">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/onlineexam.aspx">Online 
            Exams</asp:HyperLink>
        </td>
        <td class="style2">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/result.aspx">Result</asp:HyperLink>
        </td>
        <td class="style2">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/logout.aspx">Logout</asp:HyperLink>
        </td>
    </tr>
</table>
