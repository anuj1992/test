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
public partial class insertstuinfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    SqlCommand cmd;
    //SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["aname"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }
            else
            {
                manual.Visible = true;
                brw.Visible = false;
                LinkButton3.Visible = true;
                LinkButton1.Visible = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        dd();

    }
    void dd()
    {
        try
        {
            string filepath;
            if (FileUpload1.HasFile)
            {
                filepath = Server.MapPath("~/Studentlists/");
                FileUpload1.SaveAs(filepath + FileUpload1.FileName);
                string f = "~/Studentlists/" + FileUpload1.FileName;
                OleDbConnection oconn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(f) + ";Extended Properties=Excel 8.0");
                oconn.Open();
                OleDbCommand ocmd = new OleDbCommand("select * from [Sheet1$]", oconn);
                DataSet ds = new DataSet();
                OleDbDataAdapter odapt = new OleDbDataAdapter(ocmd);
                odapt.Fill(ds);

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {

                    cmd = new SqlCommand("insert into Student_Information(Idno,Univrollno,Name,Contactno,Fname,Fcontactno,Branchname,Branchcode,Year)values('" + ds.Tables[0].Rows[i][1].ToString() + "','" + ds.Tables[0].Rows[i][2].ToString() + "','" + ds.Tables[0].Rows[i][3].ToString() + "','" + ds.Tables[0].Rows[i][4].ToString() + "','" + ds.Tables[0].Rows[i][5].ToString() + "','" + ds.Tables[0].Rows[i][6].ToString() + "','" + DropDownList1.SelectedItem.Text.ToString() + "','" + DropDownList1.SelectedItem.Value.ToString() + "','" + DropDownList2.SelectedItem.Text.ToString() + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Label1.Text="Student Lists of '" +DropDownList1.SelectedItem.Text.ToUpper()+ "' is Inserted Successfully";
                oconn.Close();

            }
        }
        catch (Exception e)
        {
            Label1.Text = e.Message.ToString();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("insert into Student_Information(Idno,Univrollno,Name,Contactno,Fname,Fcontactno,Branchname,Branchcode,Year)values(@id,@roll,@sname,@scontact,@fname,@fcontact,@bname,@bcode,@yr)", con);
        com.Parameters.Add("@id", SqlDbType.VarChar).Value = TextBox1.Text;
        com.Parameters.Add("@roll", SqlDbType.VarChar).Value = TextBox2.Text;
        com.Parameters.Add("@sname", SqlDbType.VarChar).Value = TextBox3.Text.ToUpper();
        com.Parameters.Add("@scontact", SqlDbType.VarChar).Value = TextBox4.Text;
        com.Parameters.Add("@fname", SqlDbType.VarChar).Value = TextBox5.Text;
        com.Parameters.Add("@fcontact", SqlDbType.VarChar).Value = TextBox6.Text;
        com.Parameters.Add("@bname", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Text;
        com.Parameters.Add("@bcode", SqlDbType.VarChar).Value = DropDownList1.SelectedItem.Value;
        com.Parameters.Add("@yr", SqlDbType.VarChar).Value = DropDownList2.SelectedItem.Text;
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        brw.Visible = true;
        Label1.Text = "Student '" + TextBox3.Text.ToUpper() + "' information has been Inserted Successfully";
       
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        brw.Visible = false;
        manual.Visible = true;
        LinkButton3.Visible = true;
        LinkButton1.Visible = false;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        brw.Visible = true;
        manual.Visible = false;
        LinkButton1.Visible = true;
        LinkButton3.Visible = false;
    }
}
