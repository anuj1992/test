using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

public class Examination
{
    public int SIZE;
    public string  mid;
    public string sid;
    public String sname;
    public int ncans;
    public List<Question> questions;
    public DateTime StartTime;
    public int curpos = 0;

    public Examination(string  mid, string sid, String sname,int SIZE)
    {
        this.mid = mid;
        this.sid = sid;
        this.sname = sname;
        this.SIZE = SIZE;
        StartTime = DateTime.Now;
    }

    public void GetQuestions()
    {
        // get questions from OE_QUESTIONS table
        SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter("select * from Question_Table where Eid='"+sid+"'",con);
        DataSet ds = new DataSet();
        da.Fill(ds, "questions");
        int nquestions = ds.Tables[0].Rows.Count; 

        // get N no. of random number
        Random r = new Random();
        int[] positions = new int[SIZE];
        int num;
        for (int pos = 0; pos < SIZE; )
        {
            num = Math.Abs(r.Next(nquestions));
            // check whether the number is already in the array
            bool found = false;
            for( int i = 0; i < pos ; i ++)
                if (num == positions[i]) { found = true; break; }

            if (!found)
            {   positions[pos] = num;
                pos++;
            }
        } // end of for

        // load data from DataSet into Question Objects
        questions = new List<Question>();
        DataRow dr;
        Question q;
        foreach (int pos in positions)
        {
            dr = ds.Tables[0].Rows[pos];
            q = new Question(dr["Quesname"].ToString(), dr["Optionone"].ToString(), dr["Optiontwo"].ToString(), dr["Optionthree"].ToString(), dr["Optionfour"].ToString(), dr["Answer"].ToString());
            questions.Add(q);
        }

    } // end of GetQuestions()
} // end of Class
