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

public partial class instruction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       lblTotal.Text = Session["noq"].ToString();
       lblMinute.Text = Session["duration"].ToString();
       lblCorrect.Text = Session["cmarks"].ToString();
    }
    protected void btnStartExam_Click(object sender, EventArgs e)
    {
        if (chkStart.Checked == true)
        {
            String sid, sname;
            //int que;

            sid = Session["exam"].ToString();
            sname = Session["ename"].ToString();


            Examination exam = new Examination(Session["name"].ToString(), sid, sname, Int32.Parse(Session["noq"].ToString()));
            exam.GetQuestions();
            Session.Add("questions", exam);
            Response.Redirect("examination.aspx");
            //ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('examination.aspx','Graph','height=1000,width=1400');", true);
        }
        else
        {
            Response.Write("<script language='javascript'>alert('You Have to check the CheckBox to Start Your Exam.');</script>");
        }
    }
}
