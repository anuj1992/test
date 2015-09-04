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
public partial class viewstuinfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
    string str, str1,str2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["aname"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
        }
    }
    protected void searchid_Click(object sender, EventArgs e)
    {
        str = TextBox1.Text;
        SqlDataAdapter da = new SqlDataAdapter("select * from New_User_Reg where Idno='" + str + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Label1.Text = "This Id number does not found";
            
        }
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void searchbr_Click(object sender, EventArgs e)
    {
        str1 = DropDownList1.SelectedItem.Text;
        str2 = DropDownList5.SelectedItem.Text;
        SqlDataAdapter da = new SqlDataAdapter("select * from New_User_Reg where Branchname='" + str1 + "' and Year='" + str2 + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Label1.Text = "No any information is found";

        }
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}
