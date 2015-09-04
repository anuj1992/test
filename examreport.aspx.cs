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

public partial class examreport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Exam Report";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        SqlCommand com = new SqlCommand("select * from oe_exams where sid='Z01'", con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = com;
        DataTable dt = new DataTable();
        da.Fill(dt);
        CrystalReportSource1.ReportDocument.SetDataSource(dt);
        CrystalReportViewer1.ReportSource = CrystalReportSource1;
        CrystalReportViewer1.DataBind();
    }
}
