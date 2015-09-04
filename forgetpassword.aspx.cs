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


public partial class forgetpassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["mycon"]);
    string s1, s2;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Page.Title = "Retrieve Password";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand com = new SqlCommand("select * from New_User_Reg where Emailid=@email", con);
        com.Parameters.Add("@email", SqlDbType.VarChar).Value = TextBox1.Text;
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        da.SelectCommand = com;
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count == 0)
        {
            Label1.Text = "e-mail id  '" + TextBox1.Text + "' Seems to be incorrect or does not belong to any one.";

        }
        else
        {
            //s1 = TextBox1.Text;
            s1 = ds.Tables[0].Rows[0][5].ToString();
            s2 = ds.Tables[0].Rows[0][1].ToString();
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
            msg.To.Add(new MailAddress(TextBox1.Text));
            msg.Subject = "Retrieved Password";
            msg.IsBodyHtml = true;
            msg.Body = string.Format("<html><head></head><body>  Dear <b>" + s1.ToUpper() + "</b><br/> Your registered e-mail id is: " + TextBox1.Text + "  <br/> Your password is :" + s2 + "<br/>Use this e-mail id and password for giving your Online Examination .<br/> All the best <br/> With regards <br/><b> United College Of Engineering and Management</b>  </body>");
            try
            {
                client.Send(msg);
                Label1.Text ="Your Password has been sent to  your registered e-mail check it for your password. ";
            }
            catch (Exception ex)
            {
                Label1.Text = "Error occured while sending you e-mail." + ex.Message;
            }
        }
    }
}
