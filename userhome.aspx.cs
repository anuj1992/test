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

public partial class userhome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    string str1;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        display1();
    }
    void display1()
    {
        str1 = Session["name"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("select * from New_User_Reg where Emailid='" + str1 + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}
