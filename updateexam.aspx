<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="updateexam.aspx.cs" Inherits="updateexam" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br /><table class="style4">
       <h2>Update</h2></table><table>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <RowStyle ForeColor="#000066" />
                        <Columns>
                            <asp:BoundField DataField="Eid" HeaderText="Exam Id" />
                            <asp:TemplateField HeaderText="Exam Description">
                                <ItemTemplate><b>Exam Name:</b><%#Eval("Ename")%><br/>
               <b>Timing:</b><%#Eval("Startdate")%><br/> 
               <b>TO</b>&nbsp;<%#Eval("Enddate")%><br />
               <b>Exam Duration:</b><%#Eval("Duration")%> min

            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="This Exam Is For">
                             <ItemTemplate>

               <b>For:</b><%#Eval("Examfor")%>&nbsp;<b>(<%#Eval("Year")%>)</b>
               </ItemTemplate> 
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="Update Exam" 
                                ShowSelectButton="True" >
                                <ControlStyle Font-Bold="True" Font-Size="Small" Height="30px" Width="150px" 
                                    CssClass="button" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                </p>
</asp:Content>

