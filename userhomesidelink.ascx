<%@ Control Language="C#" AutoEventWireup="true" CodeFile="userhomesidelink.ascx.cs" Inherits="userhomesidelink" %>
<style type="text/css">
    .style1
    {
        width: 53%;
        height: 307px;
    }
</style>
<table class="style1">
    <tr>
        <td style="text-align: center">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/onlineexam.aspx">Online 
            Exams</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:HyperLink ID="HyperLink2" runat="server" 
                NavigateUrl="~/previousexams.aspx" style="text-align: center">Previous Exams</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/result.aspx">Result</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/myprofile.aspx">My 
            Profile</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:HyperLink ID="HyperLink5" runat="server" 
                NavigateUrl="~/changepassword.aspx">Change Password</asp:HyperLink>
        </td>
    </tr>
</table>
