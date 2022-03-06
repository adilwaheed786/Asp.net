using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class UserSignUpPage : System.Web.UI.Page
    {
        // public bool IsPost { get; private set; }
       // string strcon = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        string strcon = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
        static string activationcode;
        static string CouponCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //if (!IsPostBack)
            //{
            //    Page.ClientScript.RegisterClientScriptBlock(GetType(), "alert", "<script>$(document).ready(function(){ $('.alert-success').hide();$('.alert-danger').hide();});</script>");
            //}

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Random random1 = new Random();
                CouponCode = random1.Next(10001, 99999).ToString();
                SqlConnection con = new SqlConnection(strcon);
                if (DropDownList1.SelectedValue == "Become A Buyer")
                {
                    string query = "Insert into Customer(Cust_Name,E_mail,Address,Password,Creation_date,Admin_id) values(@Cust_Name,@E_mail,@Address,@password,@date,@adminid);";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Cust_Name", TextBox1.Text.ToString());
                    cmd.Parameters.AddWithValue("@Address", TextBox5.Text.ToString());
                    cmd.Parameters.AddWithValue("@Password", TextBox2.Text.ToString());
                    cmd.Parameters.AddWithValue("@E_mail", TextBox3.Text.ToString());
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@adminid",1);

                    bool exists = false;
                    // create a command to check if the username exists
                    using (SqlCommand cm = new SqlCommand("select count(*) from [Customer] where E_mail = @E_mail", con))
                    {
                        cm.Parameters.AddWithValue("@E_mail", TextBox3.Text.ToString());
                        exists = (int)cm.ExecuteScalar() > 0;
                    }
                    // if exists, show a message error
                    if (exists)
                    {
                        // lblStatus.Text = "E_Mail Exist";
                    }
                    else
                    {
                        cmd.ExecuteNonQuery();
                        using (SqlConnection conn = new SqlConnection(strcon))
                        {
                            conn.Open();
                            string query1 = "select Cust_id from Customer where E_mail='" + TextBox3.Text.ToString()+ "'";
                            SqlCommand cmd4 = new SqlCommand(query1, conn);
                            cmd4.CommandType = CommandType.Text;
                            ViewState["custid"] = (int)cmd4.ExecuteScalar();
                            conn.Close();
                        }
                        
                        int Discount = 10;
                        DateTime date = DateTime.Now;
                        using (SqlCommand cm = new SqlCommand("Insert into Coupons(Cust_id, Coupon_Code, Discount_percent, Till_Date,status) values(@custid,@code,@discount,@date,@status)", con))
                        {
                            cm.CommandType = CommandType.Text;
                            cm.Parameters.AddWithValue("@custid", ViewState["custid"]);
                            cm.Parameters.AddWithValue("@code", CouponCode);
                            cm.Parameters.AddWithValue("@discount", Discount);
                            cm.Parameters.AddWithValue("@date", date);
                            cm.Parameters.AddWithValue("@status", "unused");
                            cm.ExecuteNonQuery();
                            sendCouponcode();
                        }
                                               
                        Random random = new Random();
                        activationcode = random.Next(1001, 9999).ToString();
                        SqlConnection con1 = new SqlConnection(strcon);
                        using (SqlCommand cmd1 = new SqlCommand("EmailVerifyCustomer", con1))
                        {
                            cmd1.Parameters.AddWithValue("@email", TextBox3.Text.ToString());
                            cmd1.Parameters.AddWithValue("@status","unverified");
                            cmd1.Parameters.AddWithValue("@ActivateCode",activationcode);
                            cmd1.Parameters.AddWithValue("@custid", ViewState["custid"]);
                            cmd1.CommandType = CommandType.StoredProcedure;
                            con1.Open();
                            cmd1.ExecuteNonQuery();
                            con1.Close();
                        }
                        sendcode();
                        Response.Redirect("~/Register/Activation.aspx?type=customer&emailadd=" + TextBox3.Text);
                       // ClientScript.RegisterStartupScript(this.GetType(), "random", "alertme()", true);
                        //Response.Redirect("userloginpage.aspx");
                        // clear();
                    }
                    con.Close();
                    //cmd.ExecuteNonQuery();
                    //con.Close();


                }
                else if (DropDownList1.SelectedValue == "Become A Seller")
                {
                    string query = "EXEC InsertSeller @Seller_Name,@E_mail,@Address,@password,@date";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Seller_Name", TextBox1.Text.ToString());
                    cmd.Parameters.AddWithValue("@Address", TextBox5.Text.ToString());
                    cmd.Parameters.AddWithValue("@Password", TextBox2.Text.ToString());
                    cmd.Parameters.AddWithValue("@E_mail", TextBox3.Text.ToString());
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    bool exists = false;
                    // create a command to check if the username exists
                    using (SqlCommand cm = new SqlCommand("select count(*) from [Seller] where E_mail = @E_mail", con))
                    {
                        cm.Parameters.AddWithValue("@E_mail", TextBox3.Text.ToString());
                        exists = (int)cm.ExecuteScalar() > 0;
                    }

                    // if exists, show a message error
                    if (exists)
                    {
                        //lblStatus.Text = "E_Mail Exist";
                    }
                    else
                    {
                        cmd.ExecuteNonQuery();
                        using (SqlConnection conn = new SqlConnection(strcon))
                        {
                            conn.Open();
                            string query1 = "select Seller_id from Seller where E_mail='" + TextBox3.Text.ToString() + "'";
                            SqlCommand cmd4 = new SqlCommand(query1, conn);
                            cmd4.CommandType = CommandType.Text;
                            ViewState["sellerid"] = (int)cmd4.ExecuteScalar();
                            conn.Close();
                        }
                        Random random = new Random();
                        activationcode = random.Next(1001, 9999).ToString();
                        SqlConnection con1 = new SqlConnection(strcon);
                        using (SqlCommand cmd1 = new SqlCommand("EmailVerifySeller", con1))
                        {
                            cmd1.Parameters.AddWithValue("@email", TextBox3.Text.ToString());
                            cmd1.Parameters.AddWithValue("@status", "unverified");
                            cmd1.Parameters.AddWithValue("@ActivateCode", activationcode);
                            cmd1.Parameters.AddWithValue("@Sellerid", ViewState["sellerid"]);
                            cmd1.CommandType = CommandType.StoredProcedure;
                            con1.Open();
                            cmd1.ExecuteNonQuery();
                            con1.Close();
                        }
                        sendcode();
                        Response.Redirect("~/Register/Activation.aspx?type=seller&emailadd=" + TextBox3.Text);
                        // ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                       
                        // clear();
                    }
                    con.Close();
                }
           
        }
            catch (Exception ax)
            {
                Response.Write(ax);
               // ClientScript.RegisterStartupScript(this.GetType(), "data[]", "alertmeException('"+ax+"')", true);

            }
            
        }
        private void sendcode()
        {
            try
            {
                string  status=" ";
            if (DropDownList1.SelectedValue == "Become A Seller")
            {
                status = "Welcome Your Account Has Been Created For Seller";
            }
            else if(DropDownList1.SelectedValue == "Become A Buyer")
            {
                status = "Welcome Your Account Has Been Created For Buyer[Customer]";
            }

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("DevelopingPurpose2222@gmail.com", "developingpurpose2222");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Activation Code To Verify E-Mail Address";
            msg.Body = status.ToString() +"\n\nDear " + TextBox1.Text + ",Your Activation Code is " + activationcode + "\n\n\n\n Thanks & Redards WE4 \n\nE-Commerce Website For Testing Purpose Only";
            string toaddress = TextBox3.Text;
            msg.To.Add(toaddress);
            string fromaddress = "E-Commerce[WE4] <DevelopingPurpose2222@gmail.com>";
            msg.From = new MailAddress(fromaddress);
           
                smtp.Send(msg);
            }
            catch (Exception a)
            {

                Response.Write(a);
            }

        }
        private void sendCouponcode()
        {
            try
            {

           
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
           // smtp.Credentials = new System.Net.NetworkCredential("DemoProject419@gmail.com", "SAAR_goal");
            smtp.Credentials = new System.Net.NetworkCredential("DevelopingPurpose2222@gmail.com", "developingpurpose2222");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Redeem  your Cuopon Code";
            msg.Body = "Dear" + TextBox1.Text + ", Your Coupon Code is:" + CouponCode + "\n\n\n Thanks & Redards WE4";
            string toaddress = TextBox3.Text;
            msg.To.Add(toaddress);
            string fromAdress = "E-Commerce[WE4] <DevelopingPurpose2222@gmail.com>";
            msg.From = new MailAddress(fromAdress);
            
                smtp.Send(msg);

            }
            catch (Exception a)
            {

                Response.Write(a);
            }

        }
        public void clear()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

           
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
        
        }

        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            bool exists = false;
            if (DropDownList1.SelectedValue == "Become A Buyer")
            {
                // create a command to check if the username exist
                using (SqlCommand cm = new SqlCommand("select count(*) from [Customer] where E_mail='" + TextBox3.Text +"'", con))
                {
                   // cm.Parameters.AddWithValue("@E_mail", TextBox3.Text.ToString());
                    exists = (int)cm.ExecuteScalar() > 0;
                }
                // if exists, show a message error
                if (exists)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }

            }
            else if (DropDownList1.SelectedValue == "Become A Seller")
            {
                // create a command to check if the username exists
                using (SqlCommand cm = new SqlCommand("select count(*) from [Seller] where E_mail ='" + TextBox3.Text + "'", con))
                {
                   // cm.Parameters.AddWithValue("@E_mail", TextBox3.Text.ToString());
                    exists = (int)cm.ExecuteScalar() > 0;
                }
                // if exists, show a message error
                if (exists)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }

            }
            con.Close();
        }
    }
}