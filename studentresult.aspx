<%@ Page Language="C#" AutoEventWireup="true" CodeFile="studentresult.aspx.cs" Inherits="studentresult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <style type="text/css">
        .style5
        {
            height: 14px;
        }
        .style6
        {
            height: 7px;
        }
        .style8
        {
            height: 11px;
        }
        .style9
        {
            height: 13px;
        }
        .style10
        {
            height: 22px;
        }
        .style11
        {
            height: 11px;
            width: 154px;
        }
        .style12
        {
            height: 7px;
            width: 154px;
        }
        .style13
        {
            height: 13px;
            width: 154px;
        }
        .style14
        {
            height: 22px;
            width: 154px;
        }
        .style15
        {
            height: 14px;
            width: 154px;
        }
    </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table bgcolor="#eeeeee" style="height: 202px; width: 335px">
        <tr bgcolor="#FFCCCC">
            <td style="font-size: medium" class="style8">
                Subject:
            </td>
            <td class="style11" style="font-size: medium">
                <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="style6" style="font-size: medium">
                Starting Time :
            </td>
            <td class="style12" style="font-size: medium">
                <asp:Label ID="lblStime" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
        <tr>
            <td class="style9" style="font-size: medium">
                Time Taken In Minutes : 
            </td>
            <td class="style13" style="font-size: medium">
                <asp:Label ID="lblMin" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
                <tr>
            <td class="style10" style="font-size: medium">
               No. of Questions :
            </td>
            <td class="style14" style="font-size: medium">
                <asp:Label ID="lblNquestions" runat="server"></asp:Label></td>
        </tr>
        
                <tr>
            <td class="style6" style="font-size: medium">
                No. of correct answers :
            </td>
            <td class="style12" style="font-size: medium">
                <asp:Label ID="lblNcans" runat="server" Text="Label"></asp:Label></td>
        </tr>

        <tr>
            <td class="style5" style="font-size: medium">
                Grade : 
            </td>
            <td class="style15" style="font-size: medium">
                <asp:Label ID="lblGrade" runat="server" Text="Label"></asp:Label></td>
        </tr>


    </table>
    <br />
    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/reviewquestions.aspx" Visible="false" runat="server">HyperLink</asp:HyperLink>
    <asp:LinkButton ID="lbRank" runat="server" OnClick="lbRank_Click" Visible="false"> Click here to Close this Window</asp:LinkButton>
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Click Here to Logout"  CssClass= "button"  />
            <br />
    <br />
    <asp:Label ID="lblRank" runat="server"></asp:Label><br />
    </div>
    </form>
</body>
</html>
