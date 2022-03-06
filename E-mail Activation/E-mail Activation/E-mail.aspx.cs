using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace E_mail_Activation
{
    public partial class E_mail : System.Web.UI.Page
    {
        static string activationcode;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Random random =new Random();
            activationcode =random.Next(1001, 9999).ToString();
            string query = "insert into Verification(E_mail,status,activation_code) values('"+TextBox1.Text+"','unverified','"+activationcode+"')";
             string mycon = @"Data Source=DESKTOP-JJLR5BH\SQLEXPRESS;Initial Catalog=E-mailAuthentication;Integrated Security=True";
            SqlConnection con=new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd=new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection= con;
            cmd.ExecuteNonQuery();
            sendcode();
            Response.Redirect("Activation.aspx?emailadd=" + TextBox1.Text);
        }

        private void sendcode()
        {

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("DevelopingPurpose2222@gmail.com", "developingpurpose2222");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Activation Code To Verify E-Mail Address";
            msg.Body = "Dear " + TextBox1.Text + "user ,Your Activation Code is " + activationcode + "\n\n\n\n Thanks  \n\nE-Commerce Website For Testing Purpose Only";
            string toaddress = TextBox1.Text;
            msg.To.Add(toaddress);
            string fromaddress = "E-Commerce  <DevelopingPurpose2222@gmail.com>";
            msg.From=new MailAddress(fromaddress);
            try
            {
                smtp.Send(msg);
            }
            catch (Exception a)
            {

                Response.Write(a);
            }

        }

    }
}