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

public partial class createexamination : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["aname"] != null)
        {
            //HyperLink1.Visible = false;
            int n;
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
            SqlDataAdapter da = new SqlDataAdapter("select * from Exam", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                n = 1;
            }
            else
            {
                n = Convert.ToInt32(dt.Rows.Count);
                n++;
            }
            txteid.Text = "E0" + n.ToString();
        }
        else
        {
            Response.Redirect("adminlogin.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into Exam(Exam_id,Exam_name) values (@eid,@ename)", con);
        cmd.Parameters.Add("@eid", SqlDbType.VarChar).Value =txteid.Text.ToUpper();
        cmd.Parameters.Add("@ename", SqlDbType.VarChar).Value =txtename.Text.ToUpper();
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        lblError.Text = "Exam " +txtename.Text.ToUpper() + " with Examid " +txteid.Text.ToUpper() + "  Created successfully";
        txteid.Text = "";
        txtename.Text = "";

    }
}
