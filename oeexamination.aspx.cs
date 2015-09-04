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
public partial class oeexamination : System.Web.UI.Page
{
    //int cnt=0;
    //ArrayList a1;
    public int[] a1 = new int[10];
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string sid;
        sid = Session["noq"].ToString();
        Session["count"] = 0;
        int noq = Convert.ToInt32(sid);
        if (!IsPostBack)
        {
            
            //dur.Value = Session["duration"].ToString();
            //Label2.Text = Session["duration"].ToString();


            for (int i = 0; i < 10; i++)
            {
                //if (a1[i] == 1)
                //    Session["count"] = Convert.ToInt32(Session["count"].ToString()) + 1;
                a1[i] = 1;
            }
            DisplayQuestion();

            timer1();
        }
        //for (int i = 1; i <= noq; i++)
        //{
        //    createButtons(i);
        //}
        
        CreateButtons();

    }

    public void DisplayQuestion()
    {
        // get data from session object
        Examination e = (Examination)Session["questions"];
        // display data
        lblSubject.Text = e.sname;
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
        lblCtime.Text = DateTime.Now.ToString();
        lblStime.Text = e.StartTime.ToString();

        Question q = e.questions[e.curpos];
        // display details of question
        question.InnerHtml = q.question;
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;

        // reset all radio buttons
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;

        // disable and enable buttons
        if (e.curpos == 0)
            btnPrev.Enabled = false;
        else
            btnPrev.Enabled = true;

        if (e.curpos == e.SIZE - 1)
            btnNext.Text = "Finish";
        else
            btnNext.Text = "Next";
    }

    public void ProcessQuestion()
    {
        
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        String answer;
        string id = exam.curpos.ToString();
        Button b = (Button)(pnlButtons.FindControl(id));
        // find out the answer and assign it to 
        if (rbAns1.Checked)
        {
            answer = "1";
            b.BackColor = System.Drawing.Color.Red;
        }
        else
            if (rbAns2.Checked)
            {
                answer = "2";
                b.BackColor = System.Drawing.Color.Red;
            }
            else
                if (rbAns3.Checked)
                {
                    answer = "3";
                    b.BackColor = System.Drawing.Color.Red;
                }
                else
                    if (rbAns4.Checked)
                    {
                        answer = "4";
                        b.BackColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        answer = "0";

                        if (b != null)
                        {
                            b.BackColor = System.Drawing.Color.Chocolate;
                        }
                        //}
                    }// error
        q.answer = answer;
        if (q.IsCorrect())
        {

            Session["count"] = Convert.ToInt32(Session["count"].ToString()) + 1;
            //Label3.Text =(Session["count"].ToString());
            //a1[exam.curpos] = 0;

        }
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        string id = exam.curpos.ToString();
        ProcessQuestion();
        Button b = (Button)(pnlButtons.FindControl(id));
        //btn_Click();
        //this.btn_Click(sender, e);
        if (b.ForeColor.Equals(System.Drawing.Color.Red))
        {
            if(q.IsCorrect())
            Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        }
       
        if (exam.curpos == exam.SIZE - 1)
        {
            Response.Redirect("showresult.aspx");
        }
        else
        {
            exam.curpos++;
            Session.Add("questions", exam);
            DisplayQuestion();
        }
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        // ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        exam.curpos--;
        Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        //Label3.Text = Session["count"].ToString();
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        // Examination exam = (Examination)Session["questions"];
        Session.Remove("questions");
        //exam = null;
        Response.Redirect("default.aspx");
    }
    private void createButtons(int id)
    {
        Button btn = new Button();
        btn.Text = id.ToString();
        btn.ID = id.ToString();
        btn.Font.Bold = true;
        btn.ForeColor = System.Drawing.Color.Black; ;
        btn.BackColor = System.Drawing.Color.LightSkyBlue;
        btn.Font.Size = 10;
        btn.Width = Unit.Pixel(50);
       pnlButtons.Controls.Add(btn);
    }
    protected void bt_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        btn.ForeColor =System.Drawing.Color.Red; ;
        //Label3.Text = btn.Text + "has been clicked";
        //Label3.Text = btn.Text + "has been clicked";
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
        //s1 = ds.Tables[0].Rows[0][4].ToString();
        lblDurHead.Text = "Duration : ";
        lblActual.Text = Convert.ToString(Convert.ToInt32(Session["duration"].ToString()) * 60);
        lblSec1.Text = " Sec";

        lblTRHead.Text = "Time Remaining : ";
        lblSec2.Text = " Sec";
        //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        //{
        //    butt = new Button();
        //    butt.ID = i.ToString();
        //    butt.Text = i.ToString();
        //}


    }
    protected void btnInvisible_Click(object sender, EventArgs e)
    {
        ProcessQuestion();
        Response.Redirect("showresult.aspx");
        // Response.Write("<script language='javascript'>location.href='giveexam.aspx';</script>");
    }
    void CreateButtons()
    {
        for (int i = 0; i <Convert.ToInt32(Session["noq"].ToString()); i++)
        {

            Button btn = new Button();
            btn.Text = (i+1).ToString();
            btn.ID = i.ToString();
            btn.Font.Bold = true;
            btn.ForeColor = System.Drawing.Color.Black; ;
            btn.BackColor = System.Drawing.Color.LightSkyBlue;
            btn.Font.Size = 10;
            btn.Width = Unit.Pixel(50);
            pnlButtons.Controls.Add(btn);
            pnlButtons.Visible = true;
            btn.Click += new EventHandler(btn_Click);

        }
    }
    void btn_Click(object sender, EventArgs e)
    {
        //string a = string.Empty;
        //Examination exam = (Examination)Session["questions"];
        Button btn = sender as Button;
        
        

        // btn.ForeColor = System.Drawing.Color.Red; ;
       // btn.BackColor = System.Drawing.Color.Red;
        //Label3.Text = btn.Text + "has been clicked";
        //Label1.Text = btn.Text + "has been clicked";
        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        exam.curpos = Convert.ToInt32(btn.ID);
        Question q = exam.questions[exam.curpos];
        if (btn.ForeColor.Equals(System.Drawing.Color.Red))
        {
            if(q.IsCorrect())
            Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        }
        
        Session.Add("questions", exam);
        DisplayQuestion();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ProcessQuestion();
        Response.Redirect("showresult.aspx");
    }
}

