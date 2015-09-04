using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections;

public partial class _Default : System.Web.UI.Page 
{
    public static SqlConnection sqlconn;
    protected string PostBackStr;
    int startid;//Here specify your starting id of Questions table. So that it will display questions from id starting from this value
   int endid;//Here specify your ending id of Questions table. So that it will display questions which has id below this value
    int totalnoofquestions = 5;//Here change the number of questions you want to display.
    string sid;
    protected void Page_Load(object sender, EventArgs e)
    {
        sqlconn = new SqlConnection(DBUtil.ConnectionString);
        PostBackStr = Page.ClientScript.GetPostBackEventReference(this, "time");

        if (IsPostBack)
        {
            string eventArg = Request["__EVENTARGUMENT"];

            if (eventArg == "time")
            {
                getNextQuestion();
            }
            endid =Convert.ToInt32(Session["tnoq"].ToString());
            totalnoofquestions =Convert.ToInt32(Session["noq"].ToString());
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Visible = false;
        txtName.Visible = false;
        Button1.Visible = false;
        Panel1.Visible = true;
        lblName.Text = "Name : " + txtName.Text;
        int score = Convert.ToInt32(txtScore.Text);
        lblScore.Text = "Score : " + Convert.ToString(score);
        Session["counter"] = "1";
        Random rnd = new Random();
        int i = rnd.Next(startid, endid + 1);
        getQuestion(i);
        ArrayList al = new ArrayList();
        al.Add(i.ToString());
        Session["ids"] = al;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        getNextQuestion();
    }
    protected void Finish_Click(object sender, EventArgs e)
    {
        if (Session["Answer"].ToString() == RblOption.SelectedIndex.ToString())
        {
            int score = Convert.ToInt32(txtScore.Text) + 1;// 1 for mark for each question
            txtScore.Text = score.ToString();
            lblScore.Text = "Score : " + Convert.ToString(score);
        }
        lblResult.Text = "Thank you for test our application. Your Score is : " + txtScore.Text;
        lblResult.Visible = true;
        Panel2.Visible = false;
    }
    public void getQuestion(int no)
    {

        sid = Session["exam"].ToString();
        string str = "select * from Question where slNo=" + no + "";
        SqlDataAdapter da2 = new SqlDataAdapter("select * from Question_Table where Eid='" + sid + "' and Quesno= "+no+"",sqlconn);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2, "Question");
        if (ds2.Tables[0].Rows.Count > 0)
        {
            DataRow dtr;
            int i = 0;
            while (i < ds2.Tables[0].Rows.Count)
            {
                dtr = ds2.Tables[0].Rows[i];
                Session["Answer"] = Convert.ToString(Convert.ToInt32(dtr["Answer"].ToString()) - 1);
                lblQuestion.Text = "Q." + Session["counter"].ToString() + "  " + dtr["Quesname"].ToString();
                RblOption.ClearSelection();
                RblOption.Items.Clear();
                RblOption.Items.Add(dtr["Optionone"].ToString());
                RblOption.Items.Add(dtr["Optiontwo"].ToString());
                RblOption.Items.Add(dtr["Optionthree"].ToString());
                RblOption.Items.Add(dtr["Optionfour"].ToString());
                i++;
            }
        }
    }
    public void getNextQuestion()
    {
        //Finish.Visible = false;
        //int endid = Convert.ToInt32(Session["tnoq"].ToString());
        if (Convert.ToInt32(Session["counter"].ToString()) < totalnoofquestions)
        {
            if (RblOption.SelectedIndex >= 0)
            {
                if (Session["Answer"].ToString() == RblOption.SelectedIndex.ToString())
                {
                    int score = Convert.ToInt32(txtScore.Text) + 1;// 1 for mark for each question
                    txtScore.Text = score.ToString();
                    lblScore.Text = "Score : " + Convert.ToString(score);
                }
            }
            Random rnd = new Random();
            int i = rnd.Next(startid, endid);
            ArrayList al = (ArrayList)Session["ids"];
            if (!al.Contains(i.ToString()))
            {
                al.Add(i.ToString());
            }
            else
            {
                while (al.Contains(i.ToString()))
                {
                    i = rnd.Next(startid, endid + 1);

                    if (al.Count == totalnoofquestions - 1 && !al.Contains(i.ToString()))
                    {
                        Button2.Visible = false;
                        Finish.Visible = true;
                        break;
                    }
                    else if (al.Count > endid + 1)
                    {
                        break;
                    }

                }
                if (!al.Contains(i.ToString()))
                {
                    al.Add(i.ToString());
                }
            }
            if (al.Count == totalnoofquestions)
            {
                Button2.Visible = false;
                Finish.Visible = true;
            }
            Session["ids"] = al;
            Session["counter"] = Convert.ToString(Convert.ToInt32(Session["counter"].ToString()) + 1);
            getQuestion(i);



        }
        else
        {
            Panel2.Visible = false;
            //code for displaying after completting the exam, if you want to show the result then you can code here.
        }
    }
    public void ConnectionOpen()
    {
        try
        {
            if (sqlconn.State == ConnectionState.Closed) { sqlconn.Open(); }
        }
        catch (SqlException ex)
        { }
        catch (SystemException sex)
        { }
    }
    public void ConnectionClose()
    {
        try
        {
            if (sqlconn.State != ConnectionState.Closed) { sqlconn.Close(); }
        }
        catch (SqlException ex)
        { }
        catch (SystemException sex)
        { }
    }

    
}
