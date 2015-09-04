using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
public partial class studentresult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);

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
        int cnt = 0, marks;
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon();

        SqlCommand cmd = new SqlCommand("update New_User_Reg set status ='0' where Idno='" + Session["uid"].ToString() + "'", con);
        //cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = s1.ToUpper();
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("logout.aspx");
    }
}
