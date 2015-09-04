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
using System.Data.OleDb;


public partial class fetchquestion : System.Web.UI.Page
{
    string str;
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    void display()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Question_Table where Eid='" + Session["eid"].ToString() + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Insert Questions";
            if (Session["aname"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
            else
            {
                str = Session["eid"].ToString();
                TextBox1.Text = str;
                manual.Visible = false;
                LinkButton3.Visible = false;
               // display();
            }
        }
        //str = Session["eid"].ToString();
        //TextBox1.Text = str;
        //manual.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        dd();
        display();
    }
    void dd()
    {
        string que, op1, op2, op3, op4, ans;
        try
        {
            string filepath;
            if (FileUpload1.HasFile)
            {
                filepath = Server.MapPath("~/Questions/");
                FileUpload1.SaveAs(filepath + FileUpload1.FileName);
                string f = "~/Questions/" + FileUpload1.FileName;
                OleDbConnection oconn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(f) + ";Extended Properties=Excel 8.0");
                oconn.Open();
                OleDbCommand ocmd = new OleDbCommand("select * from [Sheet1$]", oconn);
                DataSet ds = new DataSet();
                OleDbDataAdapter odapt = new OleDbDataAdapter(ocmd);
                odapt.Fill(ds);
                SqlDataAdapter da1 = new SqlDataAdapter("select * from Question_Table where Eid='" + Session["eid"].ToString() + "'", con);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                int count = ds1.Tables[0].Rows.Count;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    count++;
                    que = ds.Tables[0].Rows[i][1].ToString();
                    op1 = ds.Tables[0].Rows[i][2].ToString();
                    op2 = ds.Tables[0].Rows[i][3].ToString();
                    op3 = ds.Tables[0].Rows[i][4].ToString();
                    op4 = ds.Tables[0].Rows[i][5].ToString();
                    ans = ds.Tables[0].Rows[i][6].ToString();
                    SqlCommand cmd = new SqlCommand("insert into Question_Table(Eid,Quesno,Quesname,Optionone,Optiontwo,Optionthree,Optionfour,Answer)values('" + Session["eid"].ToString() + "','" + count + "','" + que + "','" + op1 + "','" + op2 + "','" + op3 + "','" + op4 + "','" + ans + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Label1.Text="Questions Of Exam Id <b>"+TextBox1.Text+"</b> has successfullly Inserted.";
                oconn.Close();

            }
        }
        catch (Exception e)
        {
            Label1.Text = e.Message.ToString();
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        brw.Visible = false;
        LinkButton1.Visible = false;
        LinkButton3.Visible = true;
        manual.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da1 = new SqlDataAdapter("select * from Question_Table where Eid='" + Session["eid"].ToString() + "'", con);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        int count = ds1.Tables[0].Rows.Count;
        count++;
        SqlCommand com = new SqlCommand("insert into Question_Table(Eid,Quesno,Quesname,Optionone,Optiontwo,Optionthree,Optionfour,Answer)values(@eid,@qno,@qname,@oone,@otwo,@othree,@ofour,@cans)", con);
        com.Parameters.Add("@eid", SqlDbType.VarChar).Value = Session["eid"].ToString();
        com.Parameters.Add("@qname", SqlDbType.VarChar).Value = TextBox2.Text;
        com.Parameters.Add("@qno", SqlDbType.Int).Value = count;
        com.Parameters.Add("@oone", SqlDbType.VarChar).Value = TextBox3.Text;
        com.Parameters.Add("@otwo", SqlDbType.VarChar).Value = TextBox4.Text;
        com.Parameters.Add("@othree", SqlDbType.VarChar).Value = TextBox5.Text;
        com.Parameters.Add("@ofour", SqlDbType.VarChar).Value = TextBox6.Text;
        com.Parameters.Add("@cans", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text;
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        display();

    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        brw.Visible = true;
        LinkButton1.Visible = true;
        LinkButton3.Visible = false;
        manual.Visible = false;
    }
}
