<%@ Page Language="C#" MasterPageFile="~/userhome.master" AutoEventWireup="true" CodeFile="onlineexam.aspx.cs" Inherits="onlineexam" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 246px;
        }
        .style7
        {
            font-size: xx-large;
            font-weight: bold;
            font-family: Arial, Helvetica, sans-serif;
            color: #6B943E;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <h2>Available Exams</h2>
    
 
    
    
    
    
    
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#999999" 
    BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" GridLines="Vertical" Height="16px" 
                        
    onselectedindexchanged="GridView1_SelectedIndexChanged" Width="800px">
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="Eid" HeaderText="Eid" />
                            <asp:BoundField DataField="ExamId" HeaderText="Exam Id" />
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
                            <asp:CommandField ButtonType="Button" SelectText="Start" 
                                ShowSelectButton="True" >
                                <ControlStyle Font-Bold="True" Font-Size="Medium" Height="30px" Width="100px" 
                                    CssClass="button" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                    
                    
                    <br />
    

                                
                                    
   

    
</asp:Content>


