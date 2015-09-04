<%@ Page Language="C#" MasterPageFile="~/examination.master" AutoEventWireup="true" CodeFile="examinstructions.aspx.cs" Inherits="examinstructions" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: medium;
        }
        .style2
        {
            font-size: medium;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    <div>
        <span class="style1"><b>Please read the following instructions very carefully:
        </b>
        <br />
        <br class="style1" />
                1. Read carefully the instructions before starting the test.<br class="style1" />
        2. You have
        <asp:Label ID="lblMinute" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;minutes to complete the test.<br class="style1" />
        3. The test contains a total of         <asp:Label ID="lblTotal" runat="server" 
            style="font-weight: 700"></asp:Label>
&nbsp;questions. 
        <br class="style1" />
        4. There is only one correct answer to each question. Click 
        on the most appropriate option to mark it as your answer. 
        <br class="style1" />
        5. You will be awarded
        <asp:Label ID="lblCorrect" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;marks for each correct answer. 
        <br class="style1" />
        6. There is         <asp:Label ID="lblNegative" runat="server" 
            style="font-weight: 700"></asp:Label>
&nbsp;negative marks for each wrong answer. 
        <br class="style1" />
        7. According to your selection of questions it will change the colour in the 
        boxes at the right side window, these colours will help you to identify the 
        required group of questions. 
        <br class="style1" />
                8. A Number list of all questions appears at the right 
        hand side of the window. You can access the questions in any order within a 
        section or across sections by clicking on the question number given on the 
        number list. 
        <br />
        9. You can unmark your answer by clicking on the <b>“CLEAR RESPONSE”</b> Option.<br />
        10. You can mark a question for reviewing it later by clicking on the <b>“Marked 
        &amp; Review” </b>button.<br class="style1" />
                11. You can use rough sheets while taking the test. Do not 
        use calculators, log tables, dictionaries, or any other printed/online reference 
        material during the test. 
        <br />
                12. Do not click the button <b>“SUBMIT TEST”</b> before 
        completing the test. A test once submitted cannot be resumed.<br />
        13. <span class="style2" __designer:mapid="3e">
        <span 
            class="style1" __designer:mapid="40">Donot press <b>F5 </b>or <b>Backspace</b>
        <b>Button</b> while giving the exam</span></span><br />
        <br />
        <asp:CheckBox ID="chkStart" runat="server" ForeColor="Red" 
            Text="I Have Read the Instructions Carefully. Now I am Ready To Start My Exam" />
    
        <b>
        <br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Button ID="btnStartExam" runat="server" Text="I am Ready To Begin" 
            CssClass="button" onclick="btnStartExam_Click" />
        </b>
    
    </div>
    
       
        </asp:Content>

