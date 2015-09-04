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

public partial class examresult : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    string s1, s2, s3;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = " Branchwise Exam Result";
            if (Session["aname"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from New_User_Reg where Branchname='"+DropDownList1.SelectedItem.Text+"' and Year='"+DropDownList2.SelectedItem.Text+"'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        SqlDataAdapter da1 = new SqlDataAdapter("select * from Create_Exam where Examfor='" + DropDownList1.SelectedItem.Text + "' and Year='" + DropDownList2.SelectedItem.Text + "'", con);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        GridView2.DataSource = ds1;
        GridView2.DataBind();



    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        s1 = GridView1.SelectedRow.Cells[0].Text;
        Session["idno"] = s1;

        SqlDataAdapter da = new SqlDataAdapter("select * from studentreport where Idno='"+Session["idno"].ToString()+"'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script language='javascript'>alert('There is no record to view.');</script>");
        }
        else
        {
            //GridView3.DataSource = ds;
            //GridView3.DataBind();
            Response.Redirect("studentreport.aspx");
        }
    }
    protected void GridView2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        s2 = GridView2.SelectedRow.Cells[0].Text;
        Session["oeid"] = s2;
        SqlDataAdapter da = new SqlDataAdapter("select * from oe_exams where sid='" + s2 + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script language='javascript'>alert('There is no record to view.');</script>");
        }
        else
        {
            //GridView3.DataSource = ds;
            //GridView3.DataBind();
            Response.Redirect("exam.aspx");
        }
    }
}
