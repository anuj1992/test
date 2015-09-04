<%@ Page Language="C#" MasterPageFile="~/userhome.master" AutoEventWireup="true" CodeFile="instructions.aspx.cs" Inherits="instructions" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Go For It" 
            onclick="Button1_Click" />
    </p>
    <ul>
        <li>Each exam contains 
            <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;question.</li>
        <li>Use Next and Previous buttons to navigate between questions</li>
        <li>Result is displayed after the last questions is answered</li>
        <li>CANCEL button can be used to cancel the exam</li>
        <li style="height: 17px; width: 524px">No time limitation. However the time taken is stored in database</li>
    </ul>
</asp:Content>

