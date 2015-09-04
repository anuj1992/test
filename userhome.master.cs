using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class userhome : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);

    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "Developed By: Anuj Kumar Singh, Shivam Kushwaha and Saurabh Patel (C.S. 4th Year) 2010-14 Batch";
    }
     protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Session.Abandon();

        SqlCommand cmd = new SqlCommand("update New_User_Reg set status ='0' where Idno='" + Session["uid"].ToString() + "'", con);
        //cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = s1.ToUpper();
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("userlogin.aspx");
    }
}
