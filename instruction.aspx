<%@ Page Language="C#" AutoEventWireup="true" CodeFile="instruction.aspx.cs" Inherits="instruction" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style1">Please read the following instructions very carefully:
        </span>
        <br class="style1" />
        <span class="style1">1. Read carefully the instructions before starting the 
        test.you can read the instructions in between the exam after clicking the 
        &quot;INSTRUCTION BUTTON&quot;. </span>
        <br class="style1" />
        <span class="style1">2. You have
        <asp:Label ID="lblMinute" runat="server"></asp:Label>
&nbsp;minutes to complete the test.</span><br class="style1" />
        <span class="style1">3. The test contains a total of         <asp:Label ID="lblTotal" runat="server"></asp:Label>
&nbsp;questions. </span>
        <br class="style1" />
        <span class="style1">4. There is only one correct answer to each question. Click 
        on the most appropriate option to mark it as your answer. </span>
        <br class="style1" />
        <span class="style1">5. You will be awarded
        <asp:Label ID="lblCorrect" runat="server"></asp:Label>
&nbsp;marks for each correct answer. </span>
        <br class="style1" />
        <span class="style1">6. There is         <asp:Label ID="lblNegative" runat="server"></asp:Label>
&nbsp;negative marks for each wrong answer. </span>
        <br class="style1" />
        <span class="style1">7. According to your selection of questions it will change 
        the colour in the boxes at the right side window, these colours will help you to 
        identify the required group of questions. /span>
        <br class="style1" />
        8. You can unmark your answer by clicking on the &quot;CLEAR 
        RESPONSE&quot; Option. 
        <br class="style1" />
        9. You can mark a question for reviewing it later by 
        clicking on the “marked &amp; review” button. 
        <br class="style1" />
        10. You can use the &quot;FILTER BUTTON&quot; to select your choices 
        individually according to your given answers. 
        <br class="style1" />
                11. A Number list of all questions appears at the right 
        hand side of the window. You can access the questions in any order within a 
        section or across sections by clicking on the question number given on the 
        number list. 
        <br class="style1" />
                12. You can use rough sheets while taking the test. Do not 
        use calculators, log tables, dictionaries, or any other printed/online reference 
        material during the test. 
        <br />
                13. Do not click the button “SUBMIT TEST” before 
        completing the test. A test once submitted cannot be resumed.<br />
        <br />
        <asp:CheckBox ID="chkStart" runat="server" ForeColor="Red" 
            Text="I Have Read the Instructions Carefully. Now I am Ready To Start My Exam" />
    
        <b>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnStartExam" runat="server" Text="I am Ready To Begin" 
            CssClass="button" onclick="btnStartExam_Click" />
        </b>
    
    </div>
    </form>
</body>
</html>
