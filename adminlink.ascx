<%@ Control Language="C#" AutoEventWireup="true" CodeFile="adminlink.ascx.cs" Inherits="adminlink" %>
<link href="but.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .style1
    {
        width: 100%;
        height: 33px;
    }
    .style2
    {
        width: 571px;
    }
</style>
<table class="style1">
    <tr>
     <td class="style2">
            <asp:HyperLink ID="HyperLink1" runat="server" 
                NavigateUrl="~/insertstuinfo.aspx">Insert Students Information</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/viewstuinfo.aspx">View 
            Students Information</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/createexam.aspx">Create 
            Exam</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/updateexam.aspx">Update 
            an Existing Exam</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/insertquestion.aspx">Insert Questions</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/examdetails.aspx">Exam 
            Details</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/examresult.aspx">Exam 
            Results</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/insertnewbranch.aspx">Insert New Branch</asp:HyperLink>
        </td>
         </tr>
    </table>
