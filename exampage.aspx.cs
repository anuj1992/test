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

public partial class exampage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         CreateButtons();
         if (!Page.IsPostBack)
         {
             Page.Title = "Examination";
             // dur.Value = Session["duration"].ToString();
             Session["count"] = 0;
             //Label3.Text = Session["duration"].ToString();

             DisplayQuestion();
             Button2.Enabled = false;
             Button3.Enabled = false;
             Button4.Enabled = false;
             Button6.Enabled = false;
             Button7.Enabled = false;
             lblBranch.Text = Session["branchname"].ToString();
             lblyr.Text = Session["branch"].ToString();
             lblName.Text = Session["uname"].ToString();
         }
    }
    public void DisplayQuestion()
    {
        //Button btn = sender as Button;
        string ans, qid;
        int cp;
        // get data from session object
        Examination e = (Examination)Session["questions"];
        // display data
        cp = e.curpos;
        lblSubject.Text = e.sname;
        lblQno.Text = e.curpos + 1 + "/" + e.SIZE;
        lblCtime.Text = DateTime.Now.ToString();
        lblStime.Text = e.StartTime.ToString();

        Question q = e.questions[e.curpos];
        qid = e.curpos.ToString();
        Button b = (Button)(pnlButtons.FindControl(qid));
        //ans = q.answer;
        //if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
        //{
        //    if (q.IsCorrect())
        //        //Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        //}
        // display details of question
        question.Text = q.question.ToString();
        ans1.InnerHtml = q.ans1;
        ans2.InnerHtml = q.ans2;
        ans3.InnerHtml = q.ans3;
        ans4.InnerHtml = q.ans4;
        ans = q.answer;
        if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
        {
            if (ans == "1")
            {
                rbAns1.Checked = true; ;
            }
            else
                if (ans == "2")
                {
                    rbAns2.Checked = true;
                }
                else
                    if (ans == "3")
                    {
                        rbAns3.Checked = true;
                    }
                    else
                        if (ans == "4")
                        {
                            rbAns4.Checked = true;
                        }

        }
        else
        {


            // reset all radio buttons
            rbAns1.Checked = false;
            rbAns2.Checked = false;
            rbAns3.Checked = false;
            rbAns4.Checked = false;
        }
        // disable and enable buttons
        if (e.curpos == 0)
            btnPrev.Enabled = false;
        else
            btnPrev.Enabled = true;

        if (e.curpos == e.SIZE - 1)
            btnNext.Text = "Goto First Question";
        else
            btnNext.Text = "Save & Next";
    }

    public void ProcessQuestion()
    {
        //Button btn = sender as Button;
        Examination exam = (Examination)Session["questions"];
        Question q = exam.questions[exam.curpos];
        String answer;
        string id = exam.curpos.ToString();
        Button b = (Button)(pnlButtons.FindControl(id));
        // find out the answer and assign it to 
        if (rbAns1.Checked)
        {
            answer = "1";
            b.BackColor = System.Drawing.Color.Green;
        }
        else
            if (rbAns2.Checked)
            {
                answer = "2";
                b.BackColor = System.Drawing.Color.Green;
            }
            else
                if (rbAns3.Checked)
                {
                    answer = "3";
                    b.BackColor = System.Drawing.Color.Green;
                }
                else
                    if (rbAns4.Checked)
                    {
                        answer = "4";
                        b.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        answer = "0";

                        if (b != null)
                        {
                            b.BackColor = System.Drawing.Color.Red;
                        }
                        //}
                    }// error
        q.answer = answer;
        if (q.IsCorrect())
        {

            Session["count"] = Convert.ToInt32(Session["count"].ToString()) + 1;
            //Label3.Text =(Session["count"].ToString());

        }
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }
    public void ProcessMarkQuestion()
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
            b.BackColor = System.Drawing.Color.DarkOrchid;
        }
        else
            if (rbAns2.Checked)
            {
                answer = "2";
                b.BackColor = System.Drawing.Color.DarkOrchid;
            }
            else
                if (rbAns3.Checked)
                {
                    answer = "3";
                    b.BackColor = System.Drawing.Color.DarkOrchid;
                }
                else
                    if (rbAns4.Checked)
                    {
                        answer = "4";
                        b.BackColor = System.Drawing.Color.DarkOrchid;
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

        }
        exam.questions[exam.curpos] = q;
        Session.Add("questions", exam);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {


        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];

        if (exam.curpos == exam.SIZE - 1)
        {
            exam.curpos = 0;
            string id;
           // exam.curpos++;
            id = exam.curpos.ToString();
            Button b = (Button)(pnlButtons.FindControl(id));
            Question q = exam.questions[exam.curpos];
            if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
            {
                if (q.IsCorrect())
                    Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
            }
            Session.Add("questions", exam);
            DisplayQuestion();
            //int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
            //exam.ncans = Convert.ToInt32(Session["count"].ToString());
            //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
            //cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
            //cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
            //cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
            //cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
            //cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
            //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
            //cmd.ExecuteNonQuery();
            //con.Close();
            //Response.Redirect("studentresult.aspx");
        }
        else
        {
            string id;
            exam.curpos++;
            id = exam.curpos.ToString();
            Button b = (Button)(pnlButtons.FindControl(id));
            Question q = exam.questions[exam.curpos];
            if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
            {
                if (q.IsCorrect())
                    Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
            }
            Session.Add("questions", exam);
            DisplayQuestion();
        }
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        exam.curpos--;
        Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("questions");
        Response.Redirect("default.aspx");
    }
    protected void btnInvisible_Click(object sender, EventArgs e)
    {
        Examination exam = (Examination)Session["questions"];
        ProcessQuestion();
        int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
        exam.ncans = Convert.ToInt32(Session["count"].ToString());
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
        cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
        cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
        cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
        cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
        cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
        cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("studentresult.aspx");
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Examination exam = (Examination)Session["questions"];
    //    ProcessQuestion();
    //    int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
    //    exam.ncans = Convert.ToInt32(Session["count"].ToString());
    //    SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
    //    cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
    //    cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
    //    cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
    //    cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
    //    cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
    //    cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    Response.Redirect("showresult.aspx");
    //}
    void CreateButtons()
    {
        for (int i = 0; i < Convert.ToInt32(Session["noq"].ToString()); i++)
        {

            Button btn = new Button();
            btn.Text = (i + 1).ToString();
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

        Button btn = sender as Button;
        // btn.ForeColor = System.Drawing.Color.Red; ;
        //btn.BackColor = System.Drawing.Color.Red;
        //Label3.Text = btn.Text + "has been clicked";
        //Label1.Text = btn.Text + "has been clicked";
        ProcessQuestion();
        Examination exam = (Examination)Session["questions"];
        exam.curpos = Convert.ToInt32(btn.ID);
        Question q = exam.questions[exam.curpos];
        if (btn.BackColor.Equals(System.Drawing.Color.Green))
        {
            if (q.IsCorrect())
                Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
        }
        Session.Add("questions", exam);
        DisplayQuestion();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        // ProcessQuestion();
        ProcessMarkQuestion();
        Examination exam = (Examination)Session["questions"];

        if (exam.curpos == exam.SIZE - 1)
        {
            exam.curpos = 0;
            string id;
            //exam.curpos++;
            id = exam.curpos.ToString();
            Button b = (Button)(pnlButtons.FindControl(id));
            Question q = exam.questions[exam.curpos];
            if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
            {
                if (q.IsCorrect())
                    Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
            }
            Session.Add("questions", exam);
            DisplayQuestion();
            //int marks = Convert.ToInt32(Session["count"].ToString()) * Convert.ToInt32(Session["cmarks"].ToString());
            //exam.ncans = Convert.ToInt32(Session["count"].ToString());
            //SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("insert into oe_exams (mid,sid,noq,nocans,omarks,stdate) values (@mid,@sid,@noq,@ncans,@om,@stdate)", con);
            //cmd.Parameters.Add("@mid", SqlDbType.VarChar).Value = exam.mid;
            //cmd.Parameters.Add("@sid", SqlDbType.Int).Value = Convert.ToInt32(Session["exam1"].ToString());
            //cmd.Parameters.Add("@noq", SqlDbType.VarChar).Value = exam.SIZE;
            //cmd.Parameters.Add("@ncans", SqlDbType.VarChar).Value = exam.ncans;
            //cmd.Parameters.Add("@om", SqlDbType.Int).Value = marks;
            //cmd.Parameters.Add("@stdate", SqlDbType.DateTime).Value = exam.StartTime;
            //cmd.ExecuteNonQuery();
            //con.Close();
            //Response.Redirect("studentresult.aspx");

        }
        else
        {
            string id;
            exam.curpos++;
            id = exam.curpos.ToString();
            Button b = (Button)(pnlButtons.FindControl(id));
            Question q = exam.questions[exam.curpos];
            if (b.BackColor.Equals(System.Drawing.Color.Green) || b.BackColor.Equals(System.Drawing.Color.DarkOrchid))
            {
                if (q.IsCorrect())
                    Session["count"] = Convert.ToInt32(Session["count"].ToString()) - 1;
            }
            Session.Add("questions", exam);
            DisplayQuestion();
        }

    }

    protected void clrResponse_Click(object sender, EventArgs e)
    {
        rbAns1.Checked = false;
        rbAns2.Checked = false;
        rbAns3.Checked = false;
        rbAns4.Checked = false;
    }
}
