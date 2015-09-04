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

public partial class examination : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!Page.IsPostBack)
        {
            //string sid;
            //sid = Session["noq"].ToString();
            //Session["count"] = 0;
            //int noq = Convert.ToInt32(sid);
            //dur.Value = Session["duration"].ToString();
            //Label2.Text = Session["duration"].ToString();
            //for (int i = 1; i <= noq; i++)
            //{
            //    createButtons(i);
            //}

           // DisplayQuestion();
            timer1();
        }

    }
    void timer1()
    {
        string s1;
        //// Button butt;
        ////SqlCommand com = new SqlCommand("select * from Create_Exam", con);
        //con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=OnLineExaminationSystem;Integrated Security=True");
        //SqlDataAdapter da = new SqlDataAdapter();
        //SqlCommand com = new SqlCommand("select * from Create_Exam", con);
        //DataSet ds = new DataSet();
        //da.SelectCommand = com;
        //da.Fill(ds);
        ////s1 = ds.Tables[0].Rows[0][4].ToString();
        //lblDurHead.Text = "Duration : ";
        //lblActual.Text = Convert.ToString(Convert.ToInt32(Session["duration"].ToString()) * 60);
        //lblSec1.Text = " Sec";

        //lblTRHead.Text = "Time Remaining : ";
        //lblSec2.Text = " Sec";
        //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //{
        //    butt = new Button();
        //    butt.ID = i.ToString();
        //    butt.Text = i.ToString();
        //}


    }

    }

