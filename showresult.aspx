<%@ Page Language="C#" MasterPageFile="~/examination.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<script runat="server">

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Exam Result";
        }
        // show exam result
        Examination exam = (Examination)Session["questions"];
        lblSubject.Text = exam.sname;
        lblStime.Text = exam.StartTime.ToString();
        TimeSpan ts = DateTime.Now.Subtract(exam.StartTime);
        lblMin.Text = ts.Minutes.ToString();
        lblNquestions.Text = exam.SIZE.ToString();
        
        // find how many correct answers
        int cnt = 0,marks;
        //foreach (Question q in exam.questions)
        //{
        //    if (q.IsCorrect())
        //        cnt++;
        //}
        marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
        lblNcans.Text = Session["count"].ToString();
        //exam.ncans = Convert.ToInt32(Session["count"].ToString());
        //Session.Add("questions", exam);

        //if (cnt > 3)
        //    lblGrade.Text = "Excellent";
        //else
        //    if (cnt > 1)
        //        lblGrade.Text = "Average";
        //    else
        //        lblGrade.Text = "Poor";
        //// add row to OE_EXAMS table
        //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        //con.Open();
        //SqlCommand cmd = new SqlCommand("select isnull( max(examid),0) + 1 from oe_exams", con);
        //int  examid = (Int32) cmd.ExecuteScalar();
        //cmd.CommandText = "insert into oe_exams values(@examid,@mid,@mname,@sid,@sname,@noq,@ncans,@om,@stdate,getdate())";
        //cmd.Parameters.Add("@examid", SqlDbType.Int).Value = examid;
        //cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
        //cmd.Parameters.Add("@mname", SqlDbType.VarChar).Value = Session["uname"].ToString();
        //cmd.Parameters.Add("@sid", SqlDbType.VarChar).Value = exam.sid;
        //cmd.Parameters.Add("@sname", SqlDbType.VarChar).Value = Session["ename"].ToString();
        //cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
        //cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
        //cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
        //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        //cmd.ExecuteNonQuery();
        //con.Close();   
        
    }

    protected void lbRank_Click(object sender, EventArgs e)
    {

        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
      //Examination exam = (Examination)Session["questions"];
      //double per =  (double) exam.ncans / exam.SIZE;
      //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
      //con.Open();
      //SqlCommand cmd = new SqlCommand("select count(*) from oe_exams where nocans * 1.0 / noq >= @per and  sid = @sid", con);
      //cmd.Parameters.Add("@per", SqlDbType.Decimal).Value = per;
      //cmd.Parameters.Add("@sid", SqlDbType.Int).Value = exam.sid;
      //int rank = (Int32)cmd.ExecuteScalar();

      //cmd.CommandText = "select count(*) from oe_exams where sid = @sid";
      //int total = (Int32) cmd.ExecuteScalar();
         
      //con.Close();

      //lblRank.Text = "<h4>Your Rank : " + rank.ToString() + " out of " + total.ToString() + " </h4>"; 
   
    }

    protected void closeWindow_Click(object sender, EventArgs e)
    {
        this.ClientScript.RegisterClientScriptBlock(this.GetType(), "Close", "window.close()", true);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <h2>
    Examination Result</h2>
    &nbsp;
    <br />
    <table bgcolor="#eeeeee" style="height: 202px; width: 335px">
        <tr bgcolor="#FFCCCC">
            <td style="font-size: medium" class="style8">
                Subject:
            </td>
            <td class="style11" style="font-size: medium">
                <asp:Label ID="lblSubject" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="style6" style="font-size: medium">
                Starting Time :
            </td>
            <td class="style12" style="font-size: medium">
                <asp:Label ID="lblStime" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
        <tr>
            <td class="style9" style="font-size: medium">
                Time Taken In Minutes : 
            </td>
            <td class="style13" style="font-size: medium">
                <asp:Label ID="lblMin" runat="server" Text="Label"></asp:Label></td>
        </tr>
        
                <tr>
            <td class="style10" style="font-size: medium">
               No. of Questions :
            </td>
            <td class="style14" style="font-size: medium">
                <asp:Label ID="lblNquestions" runat="server"></asp:Label></td>
        </tr>
        
                <tr>
            <td class="style6" style="font-size: medium">
                No. of correct answers :
            </td>
            <td class="style12" style="font-size: medium">
                <asp:Label ID="lblNcans" runat="server" Text="Label"></asp:Label></td>
        </tr>

        <tr>
            <td class="style5" style="font-size: medium">
                Grade : 
            </td>
            <td class="style15" style="font-size: medium">
                <asp:Label ID="lblGrade" runat="server" Text="Label"></asp:Label></td>
        </tr>


    </table>
    <br />
    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/reviewquestions.aspx" Visible="false" runat="server">HyperLink</asp:HyperLink>
    <asp:LinkButton ID="lbRank" runat="server" OnClick="lbRank_Click"> Click here to Close this Window</asp:LinkButton><br />
    <br />
    <asp:Label ID="lblRank" runat="server"></asp:Label><br />
    
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style5
        {
            height: 14px;
        }
        .style6
        {
            height: 7px;
        }
        .style8
        {
            height: 11px;
        }
        .style9
        {
            height: 13px;
        }
        .style10
        {
            height: 22px;
        }
        .style11
        {
            height: 11px;
            width: 154px;
        }
        .style12
        {
            height: 7px;
            width: 154px;
        }
        .style13
        {
            height: 13px;
            width: 154px;
        }
        .style14
        {
            height: 22px;
            width: 154px;
        }
        .style15
        {
            height: 14px;
            width: 154px;
        }
    </style>

</asp:Content>


