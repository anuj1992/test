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

public partial class updateexam : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["aname"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
        }
        display1();

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str = GridView1.SelectedRow.Cells[0].Text;
        /*SqlDataAdapter da = new SqlDataAdapter("select * from Create_Exam where Eid='" + str + "' ", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();*/
        Session["ueid"] = str;
        Response.Redirect("changeexam.aspx");
    }
    void display1()
    {

        SqlDataAdapter da = new SqlDataAdapter("select * from Create_Exam", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}
