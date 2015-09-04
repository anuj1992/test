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

public partial class adminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Title = "Admin Login";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        string s1, s2;

        s1 = "anuj";
        s2 = "anuj92";
        if (s1 == TextBox1.Text.Trim() && s2 == TextBox2.Text.Trim())
        {
            Session["aname"] = TextBox1.Text;
            Response.Redirect("adminmenu.aspx");
        }
        else
        {
            Label1.Text="Invalid Admin User Name or Password";

        }
    }
}
