<%@ Page Language="C#" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    int cnt = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateButtons();
        if (!Page.IsPostBack)
        {
            Page.Title = "Examination";
          // dur.Value = Session["duration"].ToString();
           Session["count"] = 0;
           //Label3.Text = Session["duration"].ToString();
           
            DisplayQuestion();
            Button2.Enabled = false;
            Button3.Enabled = false;
            Button4.Enabled = false;
            Button6.Enabled = false;
            Button7.Enabled = false;
            lblBranch.Text = Session["branchname"].ToString();
            lblyr.Text = Session["branch"].ToString();
            lblName.Text = Session["uname"].ToString();
        }
        
        
    }

    public void DisplayQuestion()
    {
        //Button btn = sender as Button;
        string ans,qid;
        int cp;
        // get data from session object
        Examination e = (Examination)Session["questions"];
        // display data
        cp = e.curpos;
        lblSubject.Text = e.sname;
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
        lblCtime.Text = DateTime.Now.ToString();
        lblStime.Text = e.StartTime.ToString();

        Question q = e.questions[e.curpos];
        qid = e.curpos.ToString();
        Button b = (Button)(pnlButtons.FindControl(qid));
        //ans = q.answer;
        //if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
        //{
        //    if (q.IsCorrect())
        //        //Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        //}
        // display details of question
        question.Text = q.question.ToString();
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;
        ans = q.answer;
        if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
        {
            if (ans == "1")
            {
                rbAns1.Checked = true; ;
            }
            else
                if (ans == "2")
                {
                    rbAns2.Checked = true;
                }
                else
                    if (ans == "3")
                    {
                        rbAns3.Checked = true;
                    }
                    else
                        if (ans == "4")
                        {
                            rbAns4.Checked = true;
                        }
                       
        }
        else
        {


            // reset all radio buttons
            rbAns1.Checked = false;
            rbAns2.Checked = false;
            rbAns3.Checked = false;
            rbAns4.Checked = false;
        }
        // disable and enable buttons
        if (e.curpos == 0)
            btnPrev.Enabled = false;
        else
            btnPrev.Enabled = true;

        if (e.curpos == e.SIZE - 1)
            btnNext.Text = "Finish";
        else
            btnNext.Text = "Save & Next";
    }

    public void ProcessQuestion()
    {
        //Button btn = sender as Button;
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        String answer;
        string id = exam.curpos.ToString();
        Button b = (Button)(pnlButtons.FindControl(id));
        // find out the answer and assign it to 
        if (rbAns1.Checked)
        {
            answer = "1";
            b.BackColor = System.Drawing.Color.Green;
        }
        else
            if (rbAns2.Checked)
            {
                answer = "2";
                b.BackColor = System.Drawing.Color.Green;
            }
            else
                if (rbAns3.Checked)
                {
                    answer = "3";
                    b.BackColor = System.Drawing.Color.Green;
                }
                else
                    if (rbAns4.Checked)
                    {
                        answer = "4";
                        b.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        answer = "0";

                        if (b != null)
                        {
                            b.BackColor = System.Drawing.Color.Red;
                        }
                        //}
                    }// error
        q.answer = answer;
        if (q.IsCorrect())
        {

            Session["count"] = Convert.ToInt32(Session["count"].ToString()) + 1;
            //Label3.Text =(Session["count"].ToString());

        }
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }
    public void ProcessMarkQuestion()
    {

        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        String answer;
        string id = exam.curpos.ToString();
        Button b = (Button)(pnlButtons.FindControl(id));
        // find out the answer and assign it to 
        if (rbAns1.Checked)
        {
            answer = "1";
            b.BackColor = System.Drawing.Color.DarkOrchid;
        }
        else
            if (rbAns2.Checked)
            {
                answer = "2";
                b.BackColor = System.Drawing.Color.DarkOrchid;
            }
            else
                if (rbAns3.Checked)
                {
                    answer = "3";
                    b.BackColor = System.Drawing.Color.DarkOrchid;
                }
                else
                    if (rbAns4.Checked)
                    {
                        answer = "4";
                        b.BackColor = System.Drawing.Color.DarkOrchid;
                    }
                    else
                    {
                        answer = "0";

                        if (b != null)
                        {
                            b.BackColor = System.Drawing.Color.Chocolate;
                        }
                        //}
                    }// error
        q.answer = answer;
        if (q.IsCorrect())
        {

            Session["count"] = Convert.ToInt32(Session["count"].ToString()) + 1;
            //Label3.Text =(Session["count"].ToString());

        }
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
       
        
        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        
        if (exam.curpos == exam.SIZE - 1)
        {
            
            int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
            exam.ncans = Convert.ToInt32(Session["count"].ToString());
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
            cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
            cmd.Parameters.Add("@sid", SqlDbType.Int).Value =Convert.ToInt32(Session["exam1"].ToString());
            cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
            cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
            cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
            cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
            cmd.ExecuteNonQuery();
            con.Close();   
            Response.Redirect("showresult.aspx");
        }
        else
        {
            string id;
            exam.curpos++;
            id = exam.curpos.ToString();
            Button b = (Button)(pnlButtons.FindControl(id));
            Question q = exam.questions[exam.curpos];
            if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
            {
                if (q.IsCorrect())
                    Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
            }
            Session.Add("questions", exam);
            DisplayQuestion();
        }
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        exam.curpos--;
        Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("questions");
        Response.Redirect("default.aspx");
    }
    protected void btnInvisible_Click(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        ProcessQuestion();
        int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
        exam.ncans = Convert.ToInt32(Session["count"].ToString());
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
        cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
        cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
        cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
        cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.ExecuteNonQuery();
        con.Close();   
        Response.Redirect("showresult.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        ProcessQuestion();
        int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
        exam.ncans = Convert.ToInt32(Session["count"].ToString());
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
        cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
        cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
        cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
        cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.ExecuteNonQuery();
        con.Close();  
        Response.Redirect("showresult.aspx");
    }
    void CreateButtons()
    {
        for (int i = 0; i < Convert.ToInt32(Session["noq"].ToString()); i++)
        {

            Button btn = new Button();
            btn.Text = (i + 1).ToString();
            btn.ID = i.ToString();
            btn.Font.Bold = true;
            btn.ForeColor = System.Drawing.Color.Black; ;
            btn.BackColor = System.Drawing.Color.LightSkyBlue;
            btn.Font.Size = 10;
            btn.Width = Unit.Pixel(50);
            pnlButtons.Controls.Add(btn);
            pnlButtons.Visible = true;
            btn.Click += new EventHandler(btn_Click);

        }
    }
    void btn_Click(object sender, EventArgs e)
    {
        //string a = string.Empty;

        Button btn = sender as Button;
        // btn.ForeColor = System.Drawing.Color.Red; ;
        //btn.BackColor = System.Drawing.Color.Red;
        //Label3.Text = btn.Text + "has been clicked";
        //Label1.Text = btn.Text + "has been clicked";
        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        exam.curpos = Convert.ToInt32(btn.ID);
        Question q = exam.questions[exam.curpos];
        if (btn.BackColor.Equals(System.Drawing.Color.Green))
        {
            if (q.IsCorrect())
                Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        }
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
       // ProcessQuestion();
        ProcessMarkQuestion();
        Examination exam = (Examination)Session["questions"];

        if (exam.curpos == exam.SIZE - 1)
        {

            int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
            exam.ncans = Convert.ToInt32(Session["count"].ToString());
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
            cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
            cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
            cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
            cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
            cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
            cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("showresult.aspx");
        }
        else
        {
            string id;
            exam.curpos++;
            id = exam.curpos.ToString();
            Button b = (Button)(pnlButtons.FindControl(id));
            Question q = exam.questions[exam.curpos];
            if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
            {
                if (q.IsCorrect())
                    Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
            }
            Session.Add("questions", exam);
            DisplayQuestion();
        }

    }

    protected void clrResponse_Click(object sender, EventArgs e)
    {
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Examination</title>
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
    <script src="invoke.js" type="text/javascript"></script>
    
    <link href="but.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript">
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
	function disableRefresh()
	{
       if(event.keyCode == 116)
		{
			return  false;
		}
		else
		{
		   return true;
		}
	}
	function disableCtrlKeyCombination(e)
    {
        var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j','s');
        var key;
        var isCtrl;
        if(window.event)
        {
            key = window.event.keyCode;
            if(window.event.ctrlKey)
                 isCtrl = true;
            else
                 isCtrl = false;
        }
        else
        {
            key = e.which; 
            if(e.ctrlKey)
                 isCtrl = true;
            else
                 isCtrl = false;
        }
        if(isCtrl)
        {
          for(i=0; i<forbiddenKeys.length; i++)
          {
            if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
            {
                alert('Key combination CTRL + '+String.fromCharCode(key)+' has been disabled.');
                return false;
            }
          }
        }
        return true;
    }
    </script> 
    <script language="javascript" type="text/javascript">
        window.history.forward(1);
        document.attachEvent("onkeydown", my_onkeydown_handler);
        function my_onkeydown_handler()
        {
            switch (event.keyCode)
            {
                case 116 :
                event.returnValue = false;
                event.keyCode = 0;
                window.status = "We have disabled F5";
                break;
            }
        }
        document.onmousedown=disableclick;
        status="Right Click is not allowed";
        function disableclick(e)
        {
          if(event.button==2)
           {
                alert(status);
                return false;	         
           }
        }
      </script>  
       <script language="javascript" type="text/javascript">
        window.history.forward(1);
        document.attachEvent("onkeydown", setClipBoardData);
        function setClipBoardData()
        {
            setInterval("window.clipboardData.setData('text','')",20);
        }
        function blockError()
        {
            window.location.reload(true);
            return true;
        }
        window.onerror = blockError;
      </script>   
      <style type="text/css">h2 { background: #CCCCCC; color: #FFFFFF; padding: 25px; font-weight:100; background: url(images/header1.png);
	font-style: normal;
	font-variant: normal;
	font-size: 30px;
	line-height:4px;
	font-family: impact;
	width: 1272px;
	height: 14px;
	text-align: left;
	margin-right: 0px;
}</style>
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
        .style6
        {
            text-decoration: underline;
            color: #FF0000;
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
    </style>
    
</head>
<body onload="RunTimer();">
     <h2>Online Examination-United College Of Engineering & Management</h2>
     <form id="form1" runat="server">
     
     
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
    <table width="100%" bgcolor="#dddddd">
    
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
    <hr />
    
    <p />
        <span class="style10"><big><b>Question:</b></big></span>
    
    <br />
    <br />
    <b><asp:Label ID="question" runat="server" Text="Label" style="background-color:#eeeeee"></asp:Label> </b>
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
        &nbsp;<asp:Button ID="Button5" runat="server" CssClass="button" 
            Text="Mark for Review &amp; Next" Width="146px" onclick="Button5_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="clrResponse" runat="server" CssClass="button" 
            onclick="clrResponse_Click" Text="Clear Response" Width="120px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnNext"
            runat="server" Text="Save &amp; Next" Width="75px" OnClick="btnNext_Click" 
            CssClass="button" />
        
    
        &nbsp;<asp:Button ID="btnInvisible" runat="server" onclick="btnInvisible_Click" 
      style="DISPLAY: none"   />
        <br />
        <hr />
        <b><span class="style2"><span 
            class="style1"><br />
        <br />
        <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" 
            ConfirmText="Do You Really Want to Submit Your Exam?" TargetControlID="Button1">
        </cc1:ConfirmButtonExtender>
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
        <br /><asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Submit Test" CssClass="button" /><br /><asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</td>
    </tr>
    </table>
        </ContentTemplate>
     </asp:UpdatePanel>
    </form>
    
</body>
</html>
