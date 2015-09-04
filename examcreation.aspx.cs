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

public partial class examcreation : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Create Exam";
            if (Session["aname"] != null)
            {
                HyperLink1.Visible = false;
                DropDownList3.Enabled = false;
                TextBox1.Text = Session["ceid"].ToString();
                display1();

            }
            else
            {
                Response.Redirect("adminlogin.aspx");
            }
        }
    }
    void display1()
    {

        //str = Session["branch"].ToString();
        //str1 = Session["branchname"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("select * from Branch_Table", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkSelect");

            if (cb.Checked == true)
            {
                if (cb != null && cb.Checked)
                {
                    //Label2.Text += row.Cells[0].Text.ToString()+",";
                    SqlCommand cmd = new SqlCommand("insert into Create_Exam (Ename,Startdate,Enddate,Duration,Negmark,Correctmark,nofq,Examfor,Year,ExamId) values (@ename,@estart,@eend,@eduration,@nmark,@omark,@noq,@efor,@yr,@exid)", con);
                    cmd.Parameters.Add("@ename", SqlDbType.VarChar).Value = TextBox2.Text.ToUpper();
                    cmd.Parameters.Add("@estart", SqlDbType.DateTime).Value =Convert.ToDateTime( TextBox3.Text);
                    cmd.Parameters.Add("@eend", SqlDbType.DateTime).Value =Convert.ToDateTime( TextBox4.Text);
                    cmd.Parameters.Add("@noq", SqlDbType.Int).Value = TextBox5.Text;
                    cmd.Parameters.Add("@eduration", SqlDbType.VarChar).Value = DropDownList5.SelectedItem.Text;
                    cmd.Parameters.Add("@nmark", SqlDbType.VarChar).Value = DropDownList3.SelectedItem.Text;
                    cmd.Parameters.Add("@omark", SqlDbType.VarChar).Value = DropDownList4.SelectedItem.Text;
                    cmd.Parameters.Add("@efor", SqlDbType.VarChar).Value = row.Cells[0].Text.ToString();
                    cmd.Parameters.Add("@yr", SqlDbType.VarChar).Value = DropDownList2.Text.ToUpper();
                    cmd.Parameters.Add("@exid", SqlDbType.VarChar).Value = TextBox1.Text;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        Label1.Text = "Exam " + TextBox2.Text.ToUpper() + " with Examid " + TextBox1.Text.ToUpper() + "  Created successfully";
        HyperLink1.Visible = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }
    protected void chkSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkAll =
           (CheckBox)GridView1.HeaderRow.FindControl("chkSelectAll");
        if (chkAll.Checked == true)
        {
            foreach (GridViewRow gvRow in GridView1.Rows)
            {
                CheckBox chkSel =
                     (CheckBox)gvRow.FindControl("chkSelect");
                chkSel.Checked = true;
            }
        }
        else
        {
            foreach (GridViewRow gvRow in GridView1.Rows)
            {
                CheckBox chkSel = (CheckBox)gvRow.FindControl("chkSelect");
                chkSel.Checked = false;
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox cb = (CheckBox)row.FindControl("chkSelect");

            if (cb.Checked == true)
            {
                if (cb != null && cb.Checked)
                {
                    //Label2.Text += row.Cells[0].Text.ToString()+",";
                    SqlCommand cmd = new SqlCommand("insert into Create_Exam (Ename,Startdate,Enddate,Duration,Negmark,Correctmark,nofq,Examfor,Year,ExamId) values (@ename,@estart,@eend,@eduration,@nmark,@omark,@noq,@efor,@yr,@exid)", con);
                    cmd.Parameters.Add("@ename", SqlDbType.VarChar).Value = TextBox2.Text.ToUpper();
                    cmd.Parameters.Add("@estart", SqlDbType.DateTime).Value = TextBox3.Text;
                    cmd.Parameters.Add("@eend", SqlDbType.DateTime).Value = TextBox4.Text;
                    cmd.Parameters.Add("@noq", SqlDbType.Int).Value = TextBox5.Text;
                    cmd.Parameters.Add("@eduration", SqlDbType.VarChar).Value = DropDownList5.SelectedItem.Text;
                    cmd.Parameters.Add("@nmark", SqlDbType.VarChar).Value = DropDownList3.SelectedItem.Text;
                    cmd.Parameters.Add("@omark", SqlDbType.VarChar).Value = DropDownList4.SelectedItem.Text;
                    cmd.Parameters.Add("@efor", SqlDbType.VarChar).Value = row.Cells[0].Text.ToString();
                    cmd.Parameters.Add("@yr", SqlDbType.VarChar).Value = DropDownList2.Text.ToUpper();
                    cmd.Parameters.Add("@exid", SqlDbType.VarChar).Value = TextBox1.Text;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        Label1.Text = "Exam " + TextBox2.Text.ToUpper() + " with Examid " + TextBox1.Text.ToUpper() + "  Created successfully";
        HyperLink1.Visible = true;
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
    }
}
