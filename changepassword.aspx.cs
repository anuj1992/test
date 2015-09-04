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

public partial class changepassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    string s1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Change Password";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        s1 = Session["name"].ToString();
        SqlCommand com = new SqlCommand("update New_User_Reg set Password=@pass where Emailid=@email", con);
        com.Parameters.Add("@email", SqlDbType.VarChar).Value = s1;
        com.Parameters.Add("@pass", SqlDbType.VarChar).Value = TextBox2.Text;
        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        Label1.Text = "Your New Password Has been changed Successfully";


    }
}
