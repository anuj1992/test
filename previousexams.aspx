<%@ Page Language="C#" MasterPageFile="~/userhome.master" AutoEventWireup="true" CodeFile="previousexams.aspx.cs" Inherits="previousexams" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
function PrintGridData() 
{
var prtGrid = document.getElementById('<%=GridView1.ClientID%>');
prtGrid.border = 0;
var prtwin = window.open('', 'PrintGridViewData', 'left=100,top=100,width=1000,height=1000,tollbar=0,scrollbars=1,status=0,resizable=1');
prtwin.document.write(prtGrid.outerHTML);
prtwin.document.close();
prtwin.focus();
prtwin.print();
prtwin.close();
}
</script>
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <h2>Previous Exams</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" PageSize="5" Width="800px" Height="80px">
            <RowStyle ForeColor="#000066" />
            <Columns>
                <asp:BoundField DataField="sid" HeaderText="Exam Id" />
                <asp:BoundField DataField="noq" HeaderText="Total Questions" />
                <asp:BoundField DataField="nocans" HeaderText="Correct Ans" />
                <asp:BoundField DataField="omarks" HeaderText="Obtained Marks" />
                <asp:BoundField DataField="stdate" HeaderText="Exam Date" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <br />
        <input type="button" id="btnPrint" value="Print" onclick="PrintGridData()" class="button"/>
    
    

</asp:Content>


