<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="examreport.aspx.cs" Inherits="examreport" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 268px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style4">
        <tr>
            <td valign="top">
                Start Date&nbsp;</td>
            <td valign="top">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<cc1:CalendarExtender
                    ID="CalendarExtender2" runat="server" TargetControlID="TextBox2">
                </cc1:CalendarExtender>
            </td>
            <td valign="top">
                End Date&nbsp;</td>
            <td class="style5" valign="top">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>&nbsp;<cc1:CalendarExtender
                    ID="CalendarExtender1" runat="server" TargetControlID="TextBox1">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" CssClass="button" Text="View" 
                    Width="57px" onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td class="style5">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                    AutoDataBind="true" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
            <td class="style5">
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                <Report FileName="graph.rpt"></Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
    </table>
</asp:Content>

