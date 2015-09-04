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

public partial class onlineexam : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    DataSet ds;
    string str,str1,str2,str3,str4,tq;
  string str5,str6,str7;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Online Exams";
            
        }
        display1();
    }
    void display1()
    {

        str = Session["branch"].ToString();
        str1 = Session["branchname"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("select * from Create_Exam where GETDATE() between Startdate and Enddate and Examfor='"+str+"' and Year='"+str1+"'", con);
        ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string str5 =GridView1.SelectedRow.Cells[1].Text;
        //string sid = Session["exam"].ToString();
        SqlCommand com2 = new SqlCommand("select * from Question_Table where Eid='" + str5 + "'", con);
        SqlDataAdapter da1 = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        da1.SelectCommand = com2;
        da1.Fill(ds1);
        
        if (ds1.Tables[0].Rows.Count == 0)
        {
            Response.Write("<script language='javascript'>alert('Currently you cannot take the test.');</script>");
        }
        else
        {
            int eid = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            
                string str7 = Session["name"].ToString();
        SqlCommand com1 = new SqlCommand("select * from oe_exams where sid=" + eid + " and mid='" + str7 + "'", con);
        SqlDataAdapter da2 = new SqlDataAdapter();
        DataSet ds2 = new DataSet();
        da2.SelectCommand = com1;
        da2.Fill(ds2);

        if (ds2.Tables[0].Rows.Count > 0)
        {
            Response.Write("<script language='javascript'>alert('You Have been Already Given This Exam  .');</script>");
        }
        else
        {
            //eid =Convert.ToInt32( GridView1.SelectedRow.Cells[0].Text); 
            SqlDataAdapter da = new SqlDataAdapter("select * from Create_Exam where Eid=" + eid + " ", con);
            DataSet ds3 = new DataSet();
            da.Fill(ds3);
            str2 = ds3.Tables[0].Rows[0][1].ToString();
            str4 = ds3.Tables[0].Rows[0][6].ToString();
            str3 = ds3.Tables[0].Rows[0][7].ToString();
          string dur  = ds3.Tables[0].Rows[0][4].ToString();
           string exam = ds3.Tables[0].Rows[0][10].ToString();
           Session["exam1"] = eid.ToString();
            Session["exam"] = exam;
            Session["ename"] = str2.ToString();
            Session["noq"] = str3.ToString();
            Session["duration"] = dur.ToString();
            Session["cmarks"] = str4.ToString();
            Session["tnoq"] = ds.Tables[0].Rows.Count;
            //Response.Redirect("instructions.aspx");
            //ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('instruction.aspx','Graph','height=1000,width=1400');", true);
            Response.Redirect("instruct.aspx");
        }
            
        }
    }
}
