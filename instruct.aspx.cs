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

public partial class instruct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(DBUtil.ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        int sid = Convert.ToInt32(Session["exam1"].ToString());
        if (!IsPostBack)
        {
            SqlCommand com1 = new SqlCommand("select * from oe_exams where sid=" + sid + " and mid='" + Session["name"].ToString() + "'", con);
            SqlDataAdapter da2 = new SqlDataAdapter();
            DataSet ds2 = new DataSet();
            da2.SelectCommand = com1;
            da2.Fill(ds2);

            if (ds2.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language='javascript'>alert('You cannot give the exam again.');</script>");
                Response.Redirect("onlineexam.aspx");
            }
            else
            {
                lblTotal.Text = Session["noq"].ToString();
                lblMinute.Text = Session["duration"].ToString();
                lblCorrect.Text = Session["cmarks"].ToString();
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String sid, sname;
        //int que;
        if (chkStart.Checked == true)
        {
            sid = Session["exam"].ToString();
            sname = Session["ename"].ToString();


            Examination exam = new Examination(Session["name"].ToString(), sid, sname, Int32.Parse(Session["noq"].ToString()));
            exam.GetQuestions();
            Session.Add("questions", exam);
            Response.Redirect("exampage.aspx");
        }
        else
        {
            Response.Write("<script language='javascript'>alert('You Have to check the CheckBox to Start Your Exam.');</script>");

        }
    }
}
