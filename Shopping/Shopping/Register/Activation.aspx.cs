using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping.Register
{
    public partial class Activation : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["emailadd"].ToString() != null)
            {
                Label2.Text = "Activation Code Has been Sent Your " + Request.QueryString["emailadd"].ToString() + "Kindly Check It";

            }
            else
            {
                Response.Redirect("~/UserLoginPage.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["type"].ToString().Equals("customer"))
            {
                string query = "select * from EmailVerification where E_mail='" + Request.QueryString["emailadd"] + "'";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    String activationcode;
                    activationcode = ds.Tables[0].Rows[0]["Activation_code"].ToString();
                    if (activationcode == TextBox3.Text)
                    {
                        changestatusCustomer();
                       // ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                        Label2.Text = "Your E-mail Has Been Verified";
                        Response.Redirect("~/userloginpage.aspx");
                    }
                    else
                    {
                       // ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertmewrong()", true);
                        Label2.Text = "Your Enter Invald Verification Code Plz Check Your E-mail";
                        Label2.ForeColor = System.Drawing.Color.Red;
                    }
                }
             }
            else if (Request.QueryString["type"].ToString().Equals("seller"))
            {
                string query = "select * from EmailVerificationSeller where E_mail='" + Request.QueryString["emailadd"] + "'";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    String activationcode;
                    activationcode = ds.Tables[0].Rows[0]["Activation_code"].ToString();
                    if (activationcode == TextBox3.Text)
                    {
                        changestatusSeller();
                       // ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertme()", true);
                        Label2.Text = "Your E-mail Has Been Verified";
                        Response.Redirect("~/userloginpage.aspx");
                    }
                    else
                    {
                        // ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertmewrong()", true);
                        Label2.Text = "Your Enter Invald Verification Code Plz Check Your E-mail";
                        Label2.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            
        }
        public void changestatusCustomer()
        {
            String uptadedate = "Update EmailVerification set status='Verified' where E_mail='" + Request.QueryString["emailadd"] + "'";
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = uptadedate;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }
        public void changestatusSeller()
        {
            String uptadedate = "Update EmailVerificationSeller set status='Verified' where E_mail='" + Request.QueryString["emailadd"] + "'";
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = uptadedate;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

        }

    }
}