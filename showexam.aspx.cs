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

public partial class showexam : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "created exams";
            if (Session["aname"]!= null)
            {
                display1();
            }
            else
            {
                Response.Redirect("adminlogin.aspx");
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str5 = GridView1.SelectedRow.Cells[0].Text;
        Session["ceid"] = str5.ToString();
        Response.Redirect("examcreation.aspx");
    }
    void display1()
    {

        SqlDataAdapter da = new SqlDataAdapter("select * from Exam", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();

    }
}
