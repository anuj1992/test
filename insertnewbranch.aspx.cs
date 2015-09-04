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

public partial class insertnewbranch : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "New Branch";
            if (Session["aname"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
            else
            {
                display();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("select * from Branch_Table where Branchcode=" + TextBox2.Text + "", con);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = com;
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            SqlCommand cmd = new SqlCommand("insert into Branch_Table (Branchname,Branchcode) values (@bn,@bc)", con);
            cmd.Parameters.Add("@bn", SqlDbType.VarChar).Value = TextBox1.Text.ToUpper();
            cmd.Parameters.Add("@bc", SqlDbType.VarChar).Value = TextBox2.Text.ToUpper();
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Label1.Text = "Branch: <b><i>" + TextBox1.Text.ToUpper() + "</i></b> and Branch Code: <b><i>'"+TextBox2.Text+"'</i></b> is Inserted Successfully";
            TextBox1.Text = "";
            TextBox2.Text = "";
            display();
        }
        else
        {
            Label1.Text="This  <b><i>'"+TextBox2.Text+"</i></b>' Branch Code is already  Present";
        }



    }
    void display()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Branch_Table", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}
