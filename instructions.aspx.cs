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

public partial class instructions : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = Session["noq"].ToString();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String sid, sname;
        //int que;

        sid = Session["exam"].ToString();
        sname = Session["ename"].ToString();
       
       
            Examination exam = new Examination(Session["name"].ToString(), sid, sname, Int32.Parse(Session["noq"].ToString()));
            exam.GetQuestions();
            Session.Add("questions", exam);
           // Response.Redirect("examination.aspx");
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('examination.aspx','Graph','height=1000,width=1400');", true);
        //window.open('Default2.aspx','PoP_Up','width=500,height=500,menubar=yes,toolbar=yes,resizable=yes,fullscreen=1');
        
    }
}
