<%@ Page Language="C#" AutoEventWireup="true" CodeFile="oeexamination.aspx.cs" Inherits="oeexamination" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <script src="count.js" type="text/javascript"></script>
 <script language="javascript" type="text/javascript">
 function RunTimer()		
    {			 
		window.setTimeout("RunTimer()",1000);
		
		if(document.getElementById("lblActual").innerText != "")
		{   
		    document.getElementById("lblUser").innerText = parseInt(document.getElementById("lblUser").innerText,10) + 1;
		    document.getElementById("txtHUserSec").value = document.getElementById("lblUser").innerText;
    		if((document.getElementById("lblUser").innerText) == (document.getElementById("lblActual").innerText)) //"60")
		    {
		        document.getElementById("btnInvisible").click();								      
		    }
		    var vDiffSec = parseInt(document.getElementById("lblActual").innerText, 10) - parseInt(document.getElementById("lblUser").innerText, 10);
		    if(parseInt(vDiffSec, 10) <= 60)
		    {
		       if((parseInt(vDiffSec, 10) % 2) == 0)
		       {
		            document.getElementById("lblAlert").innerText = "Your are running short of time, "+vDiffSec+" sec";
		       }
		       else
		       {
		            document.getElementById("lblAlert").innerHTML = "<b>Your are running short of time, "+vDiffSec+" sec</b>";
		       }
		    }
		    else
		    {
		        document.getElementById("lblAlert").innerText = "";
		    }
        }        
	}		
 </script>
 
    <title>Untitled Page</title>
</head>
<body onload="RunTimer();setClipBoardData();">
    <form id="form1" runat="server">
  <table><tr><td style="width: 70%" id="r" valign="top"><asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
     <asp:HiddenField ID="dur" runat="server" />
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
     <ContentTemplate>
     
     <%--<h2>Examination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server">l3</asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<span class="style1">Time Remaining:&nbsp;
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </span>
    </h2>--%>
     <asp:Label ID="lblDurHead" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblActual" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblSec1" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblTRHead" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblUser" runat="server" Font-Bold="true" ForeColor="Red" 
        Text="0"></asp:Label>
    <asp:Label ID="lblSec2" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="lblAlert" runat="server" CssClass="Label" ForeColor="Red"></asp:Label>
    
    
    
    
    <table bgcolor="#dddddd" style="width: 100%">
    <tr>
    <td>
        Subject :
        <asp:Label ID="lblSubject" runat="server" Width="154px" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    <td>
        Question :
        <asp:Label ID="lblQno" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    </tr>
    <tr>
    <td>
        Started At :
        <asp:Label ID="lblStime" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    <td style="height: 22px">
        Current Time :<asp:Label ID="lblCtime" runat="server" Font-Bold="True" Font-Names="Verdana" ForeColor="Red"></asp:Label></td>
    </tr>
    </table>
    
    <p />
    <b>Question</b>
    <br />
    <b><pre runat="server" id="question" style="background-color:#eeeeee">question</pre> </b>
    <p></p>
    <table>
    <tr>
    <td>
    <asp:RadioButton ID="rbAns1" runat="server" GroupName="answer" />
    </td>
    <td style="width: 3px">
    <pre runat="server" id="ans1"></pre>
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
        <asp:Button ID="btnPrev" runat="server" Text="Previous" OnClick="btnPrev_Click" />&nbsp;<asp:Button ID="btnNext"
            runat="server" Text="Next" Width="75px" OnClick="btnNext_Click" />
        
    
        &nbsp;
        <asp:Button ID="btnInvisible" runat="server" onclick="btnInvisible_Click" 
      style="DISPLAY: none"   />
        
       <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
          Text="Submit Test" />
        
       <asp:Panel ID="pnlButtons" runat="server" Height="414px">
          </asp:Panel>
        
    
   </ContentTemplate>
    </asp:UpdatePanel>
    </td><td valign="top">
         
      </td></tr></table>
   </form>
</body>
</html>
