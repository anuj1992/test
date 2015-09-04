<%@ Page Language="C#" MasterPageFile="~/adminhome.master" AutoEventWireup="true" CodeFile="fetchquestion.aspx.cs" Inherits="fetchquestion" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
        }
        .style13
        {
            text-align: center;
            width: 146px;
        }
        .style14
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            height: 23px;
            text-align: left;
            width: 780px;
        }
        .style15
        {
            width: 150px;
        }
        .style23
        {
            font-size: 13px;
            color: black;
            padding-right: 25px;
            text-decoration: none;
            padding-left: 4px;
            padding-top: 4px;
            padding-bottom: 4px;
            height: 26px;
        }
        .style30
        {
            width: 107px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <table>
            <tr>
                <td class="style9" align="left">
                    <asp:LinkButton ID="LinkButton3" runat="server" 
                        style="font-weight: 700; font-size: medium" onclick="LinkButton3_Click">Click Here to Browse the 
                    Questions</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                        Font-Bold="True" Font-Size="Medium">Click here to Insert Questions 
                    Manually..</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style14">
                    Exam Id&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                        Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style23">
                    <asp:Panel ID="brw" runat="server" Height="36px" style="text-align: left" 
                        Width="287px">
                        <table class="style4">
                            <tr>
                                <td class="style30">
                                    Browse Questions</td>
                                <td>
                                    <asp:FileUpload ID="FileUpload1" runat="server" ForeColor="Black" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style30">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" class="button" Font-Bold="True" 
                                        Height="30px" onclick="Button1_Click" Text="Insert Questions" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="manual" runat="server" style="text-align: left" Height="269px" 
                        Width="562px">
                        <table>
                            <tr>
                                <td class="style15">
                                    Question</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="500px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    Option 1</td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    Option 2</td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    Option 3</td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    Option 4</td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Width="400px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    Correct option</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" Width="100px">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button class="button" ID="Button2" runat="server" Text="Insert Question" 
                                        onclick="Button2_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    &nbsp;</td>
            </tr>
            <tr>
            
                <td colspan="3" style="text-align:left"><br />
                    
                    
                    
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" width="980px">
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <RowStyle ForeColor="#000066" />
                        <Columns>
<asp:BoundField DataField="Eid" HeaderText="Exam ID"></asp:BoundField>
                            <asp:BoundField DataField="Quesno" HeaderText="Question No." />
                            <asp:BoundField DataField="Quesname" HeaderText="Question_Name" />
                            <asp:BoundField DataField="Optionone" HeaderText="Option_One" />
                            <asp:BoundField DataField="Optiontwo" HeaderText="Option_Two" />
                            <asp:BoundField DataField="Optionthree" HeaderText="Option_Three" />
                            <asp:BoundField DataField="Optionfour" HeaderText="Option_Four" />
                            <asp:BoundField DataField="Answer" HeaderText="Answer" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#006666" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    
                </td>
            </tr>
        </table><br /><br /><br /><br /><br />
   
</asp:Content>

