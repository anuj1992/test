<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exampage.aspx.cs" Inherits="exampage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
     <script language="javascript" type="text/javascript">
    var hour=0;  //specify hours for counter
var min= '<%=Session["duration"].ToString() %>';       // specify minutes 
var second=1;    // specify the seconds
var lab = 'Label1';  // id of the entry on the page where the counter is to be inserted
function start() 
{
	displayCountdown(setCountdown(hour,min,second),lab);
}
loaded(lab,start);
var pageLoaded = 0; 
window.onload = function() {pageLoaded = 1;}
function loaded(i,f) 
{
	if (document.getElementById && document.getElementById(i) != null) 
		f(); 
	else if (!pageLoaded) 
		setTimeout('loaded(\''+i+'\','+f+')',100);
}
function setCountdown(hour,min,second) 
{
	if(hour>0)
	min=min*hour*60;
	c = setC(min,second); 
return c;
} 
function setC(min,second) 
{
if(min>0)
second=min*60*second;
return Math.floor(second);
}
function displayCountdown(countdn,cd) 
{
	if(countdn<=60)
	{
	    if((countdn % 2) == 0)
		       {
		            document.getElementById(cd).innerHTML = "Your are running short of time, "+countdn+" sec";
		       }
		       else
		       {
		            document.getElementById(cd).innerHTML = "<b>Your are running short of time, "+countdn+" sec</b>";
		       }
	}
	if (countdn < 0)
	{
		document.getElementById(cd).innerHTML = "Sorry, you are too late."; 
		//__doPostBack('__Page', 'time');
		                alert('Time Up Thankyou for Giving Exam...!!!!');

		document.getElementById("btnInvisible").click();
    }
	else 
	{
		var secs = countdn % 60; 
		if (secs < 10) 
			secs = '0'+secs;
		var countdn1 = (countdn - secs) / 60;
		var mins = countdn1 % 60; 
		if (mins < 10) 
			mins = '0'+mins;
		countdn1 = (countdn1 - mins) / 60;
		var hours = countdn1 % 24;
		document.getElementById(cd).innerHTML = hours+' : '+mins+' : '+secs;
		setTimeout('displayCountdown('+(countdn-1)+',\''+cd+'\');',999);
	}
}
</script>
<script type="text/javascript">
function checkShortcut()
{
 function disableback()
	{   
	    if(event.keyCode==8 ||event.keyCode==37 || event.keyCode==116 ) // 8 -> BackSpace ; 37 -> Left Arrow
		{
			return false;
		}
		else
		{
			return true;
		}
	}
} 
</script>
 

    <style type="text/css">
        .style1
        {
            color: #FF0000;
        }
        .style2
        {
            font-size: medium;
        }
        .style5
        {
            font-size: small;
        }
        .style7
        {
            font-weight: bold;
        }
        .style8
        {
            width: 860px;
        }
        .style9
        {
            width: 10px;
        }
        .style10
        {
            font-family: "Times New Roman", Times, serif;
        }
        .style11
        {
            font-size: medium;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style12
        {
            width: 100%;
        }
        .style13
        {
            width: 147px;
        }
        .style14
        {
            color: #FFFFFF;
        
        }
        
        .heddr
        {
        	
        	background: #006666; color: #FFFFFF; 
        	 font-weight:100;
        	 font-size: xx-large;
        	 letter-spacing:2px;
        	 height:50px;
	font-family: Trebuchet MS;
	font-weight:bold;
	width:1260;
	text-align: left;
        }
        .hedder_pad
        {
        	margin-left:5px;
        	padding-top:5px;
        	
        	}
        	
        
   </style>
     <link href="but.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<body onload="RunTimer();" onkeydown="return disableback();">
    <form id="form1" runat="server">
         <div class="heddr"><div class=" hedder_pad">Online Examination-United College Of Engineering & Management</div></div>

    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
      <table style="width: 100%; height: 513px;">
      <tr>
      <td class="style8">
     <span class="style5">&nbsp;Name :
         <asp:Label ID="lblName" runat="server"></asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;Branch:
         <asp:Label ID="lblBranch" runat="server"></asp:Label>
         &nbsp;(
         <asp:Label ID="lblyr" runat="server"></asp:Label>
          )&nbsp;&nbsp;&nbsp;</span></td><td class="style9"></td><td class="style7"><span class="style2"></span><span class="style1"><span class="style5">Time Remaining:&nbsp;
         <asp:Label ID="Label1" runat="server"></asp:Label></span>
        </span></td>
         
 </tr>
   
    <tr>
    <td class="style8" valign="top">
    <table width="100%" bgcolor="#006666">
    
    <tr>
     <td>
         <span class="style14">Subject : </span>
        <asp:Label ID="lblSubject" runat="server" Width="154px" Font-Bold="True" 
             Font-Names="Verdana" ForeColor="Red" style="color: #FFFFCC"></asp:Label></td>
    <td>
        <span class="style14">Question :</span>
        <asp:Label ID="lblQno" runat="server" Font-Bold="True" Font-Names="Verdana" 
            ForeColor="Red" style="color: #FFFFCC"></asp:Label></td>
    </tr>
    <tr>
    <td>
        <span class="style14">Started At :</span>
        <asp:Label ID="lblStime" runat="server" Font-Bold="True" Font-Names="Verdana" 
            ForeColor="Red" style="color: #FFFFCC"></asp:Label></td>
    <td style="height: 22px">
        <span class="style14">Current Time :</span><asp:Label ID="lblCtime" 
            runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red" 
            style="color: #FFFFCC"></asp:Label></td>
    </tr>
    </table>
    <hr />
    
    <p />
        <span class="style10"><big><b>Question:</b></big></span>
    
    <br />
    <br />
    <b><asp:Label ID="question" runat="server" Text="Label" ></asp:Label> </b>
    <p></p>
    <table>
    <tr>
    <td>
    <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">    <pre runat="server" id="ans1"></pre>

    </td>
    </tr>
    
    <tr>
    <td>
    <asp:RadioButton ID="rbAns2" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
            <pre runat="server" id="ans2"></pre>

    </td>
    </tr>
    
    <tr>
    <td>
    <asp:RadioButton ID="rbAns3" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
            <pre runat="server" id="ans3"></pre>

    </td>
    </tr>
    
    <tr>
    <td>
    <asp:RadioButton ID="rbAns4" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
            <pre runat="server" id="ans4"></pre>

    </td>
    </tr>
    
    </table>
        <br />
        
        <table class="style12">
            <tr>
                <td class="style13">
                    <asp:Button ID="Button5" runat="server" CssClass="button" 
                        onclick="Button5_Click" Text="Mark for Review &amp; Next" Width="146px" />
                </td>
                <td>
                    <asp:Button ID="clrResponse" runat="server" CssClass="button" 
                        onclick="clrResponse_Click" Text="Clear Response" Width="120px" />
                </td>
                <td>
                    <asp:Button ID="btnNext" runat="server" CssClass="button" 
                        OnClick="btnNext_Click" Text="Save &amp; Next" Width="150px" />
                </td>
            </tr>
        </table>
        
        &nbsp;<br />
        <asp:Button ID="btnInvisible" runat="server" onclick="btnInvisible_Click" 
      style="DISPLAY: none"   />
        <br />
        <hr />
        <b><span class="style2"><span 
            class="style1"><br />
        <br />
        
        <asp:Button ID="btnPrev" runat="server" OnClick="btnPrev_Click" Text="Previous" 
            Visible="False" />
        </span></span></b>

    </td><td valign="top" class="style9"></td>
    <td valign="top">
    
        <asp:Panel ID="pnlButtons" runat="server" Height="347px" 
            style="margin-left: 0px" Width="300px" ScrollBars="Vertical">
        </asp:Panel>
        <b><span class="style11">Legend:</span></b><br />
        <asp:Button ID="Button2" runat="server" BackColor="#33CCFF" 
            UseSubmitBehavior="False" Width="30px" />
    
        &nbsp;(NOT VISITED)&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" BackColor="Red" Width="30px" />
        &nbsp;(NOT ANSWERED)
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" BackColor="#006600" Width="30px" />
        (ANSWERED)&nbsp;&nbsp;&nbsp; <asp:Button ID="Button7" runat="server" BackColor="#6600FF" Width="30px" />
        (MARKED &amp; ANSWERED)<br />
        <br />
        <asp:Button ID="Button6" runat="server" BackColor="#CC6600" Width="30px" />
        (MARKED &amp; NOT ANSWERED)<br />
        <br />
        <br /><br /><asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</td>
    </tr>
    </table>
        </ContentTemplate>
        </asp:UpdatePanel>
            <br />
            
    </div>
    </form>
</body>
</html>
