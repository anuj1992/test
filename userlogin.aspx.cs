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

public partial class userlogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    protected void Page_Load(object sender, EventArgs e)
    {
      
        
        if (!IsPostBack)
        {
            HyperLink1.Visible = false;
            Page.Title = "UserLogin";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand com2 = new SqlCommand("select * from New_User_Reg where Emailid=@email and Password=@pass", con);
        com2.Parameters.Add("@email", SqlDbType.VarChar).Value =TextBox1.Text;
        com2.Parameters.Add("@pass", SqlDbType.VarChar).Value = TextBox2.Text;
        SqlDataAdapter da1 = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        da1.SelectCommand = com2;
        da1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count == 0)
        {
            Label1.Text = "Invalid Username or Password ";
            HyperLink1.Visible = true;
        }

        else
        {
            Session["name"] = TextBox1.Text;
            Session["uid"] = ds1.Tables[0].Rows[0][3].ToString();
            Session["branch"] = ds1.Tables[0].Rows[0][6].ToString();
            Session["branchname"] = ds1.Tables[0].Rows[0][7].ToString();
            Session["uname"] = ds1.Tables[0].Rows[0][5].ToString();
            Session["status"] = ds1.Tables[0].Rows[0][8].ToString();
            if (Session["status"].ToString() == "1")
            {
                Response.Write("<script language='javascript'>alert('You are already login multiple logins are not allowed');</script>");

            }
            else
            {
                SqlCommand cmd = new SqlCommand("update New_User_Reg set status ='1' where Idno='" + Session["uid"].ToString() + "'", con);
                //cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = s1.ToUpper();
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("onlineexam.aspx");
            }
        }
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
}
