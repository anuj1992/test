using System;
using CrystalDecisions.CrystalReports.Engine;
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

public partial class exam : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Exam Report";
        }
        int s1 =Convert.ToInt32(Session["oeid"].ToString());
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        SqlCommand com = new SqlCommand("select * from studentreport where Eid=" + s1 + " ORDER BY omarks desc", con);
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = com;
        DataTable dt = new DataTable();
        da.Fill(dt);
        CrystalReportSource1.ReportDocument.SetDataSource(dt);
        //CrystalReportViewer1.ReportSource = CrystalReportSource1;
        //CrystalReportViewer1.DataBind();
        ReportDocument crystalReport = new ReportDocument();
        crystalReport.Load(Server.MapPath("studentreport.rpt"));
        crystalReport.SetDatabaseLogon("", "", @"WINCTRL-S18SMIK\SQLEXPRESS", "OnLineExaminationSystem");
       // crystalReport.SetDatabaseLogon(DBUtil.ConnectionString);
        CrystalReportViewer1.ReportSource = CrystalReportSource1;
    }
}
