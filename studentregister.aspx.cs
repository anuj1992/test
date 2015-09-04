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
using System.Net;
using System.Net.Mail;

public partial class studentregister : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    string s1,s2;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Page.Title = "student registraion";
            HyperLink1.Visible = false;
            day();
            year();
            month();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand com2 = new SqlCommand("select * from New_User_Reg where Idno=@id", con);
        com2.Parameters.Add("@id", SqlDbType.Int).Value = TextBox1.Text;
        SqlDataAdapter da1 = new SqlDataAdapter();
        DataSet ds1 = new DataSet();
        da1.SelectCommand = com2;
        da1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count > 0)
        {
            Label1.Text = "This Id Number '"+TextBox1.Text+"' is Already Registered";

        }
        else
        {

            SqlCommand com = new SqlCommand("select * from Student_Information where Idno=@id and Branchname='"+DropDownList4.SelectedItem.Text+"'", con);
            com.Parameters.Add("@id", SqlDbType.Int).Value = TextBox1.Text;
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            da.SelectCommand = com;
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                Label1.Text = "Id Number '" + TextBox1.Text + "' Seems to be Incorrect or does not belong to the Selected Branch ";

            }
            else
            {
                s1 = TextBox2.Text + " " + TextBox3.Text;
                s2=ds.Tables[0].Rows[0][1].ToString();
                SqlCommand cmd = new SqlCommand("insert into New_User_Reg(Emailid,Password,DOB,Idno,Univrollno,Name,Branchname,Year)values(@email,@password,@dob,@idno,@rollno,@name,@branch,@yr)", con);
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = s1.ToUpper();
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = TextBox5.Text;
                cmd.Parameters.Add("@yr", SqlDbType.VarChar).Value = DropDownList5.SelectedItem.Value.ToString();
                cmd.Parameters.Add("@dob", SqlDbType.DateTime).Value = DropDownList1.SelectedItem.Text+"-"+DropDownList2.SelectedItem.Text+"-"+DropDownList3.SelectedItem.Text;
                cmd.Parameters.Add("@idno", SqlDbType.Int).Value = TextBox1.Text;
                cmd.Parameters.Add("@branch", SqlDbType.VarChar).Value = DropDownList4.SelectedItem.Text.ToString();
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = TextBox4.Text;
                cmd.Parameters.Add("@rollno", SqlDbType.VarChar).Value = s2;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                SmtpClient client = new SmtpClient();
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.EnableSsl = true;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("unitedcollege13", "united2013@");
                client.UseDefaultCredentials = false;
                client.Credentials = credentials;
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("anuj.singh992@gmail.com");
                msg.To.Add(new MailAddress(TextBox4.Text));
                msg.Subject = "Registration Successful";
                msg.IsBodyHtml = true;
                msg.Body = string.Format("<html><head></head><body>  Dear <b>" + s1.ToUpper() + "</b> You  have been successfully registered yourself for Online Examination <br/>Your registered e-mail id is: "+TextBox4.Text+"  <br/> Your password is :"+TextBox5.Text+"<br/>Use this e-mail id and password for giving your Online Examination .<br/> All the best <br/> With regards <br/><b> United College Of Engineering and Management</b>  </body>");
                try
                {
                    client.Send(msg);
                    Label2.Text = "Dear " + s1.ToUpper() + " you have been successfully registered.You can use your registered  e-mail to retrieve your Password.";
                }
                catch (Exception ex)
                {
                    Label2.Text = "Error occured while sending you e-mail." + ex.Message;
                }
               // Label1.Text = "Dear " + s1.ToUpper() + " you have been successfully registered.";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                HyperLink1.Visible = true;

            }
        }
    }
    private void month()
    {
        for (int i = 1; i <= 12; i++)
        {
            DropDownList2.Items.Add(i.ToString());
            
        }
    }
    private void year()
    {
        for (int i = 1980; i <= 2050; i++)
        {
            DropDownList3.Items.Add(i.ToString());
            
        }
    }
    private void day()
    {
        for (int i = 1; i <= 31; i++)
        {
            DropDownList1.Items.Add(i.ToString());
            
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("userlogin.aspx");
    }
}
