using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_mail_Activation
{
    public partial class Activation : System.Web.UI.Page
    {
    
        string mycon = @"Data Source=DESKTOP-JJLR5BH\SQLEXPRESS;Initial Catalog=E-mailAuthentication;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "Activation Code Has been Sent Your " + Request.QueryString["emailadd"].ToString()+"Kindly Check It";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = "select * from Verification where E_mail='"+ Request.QueryString["emailadd"]+"'";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count>0)
            {
                String activationcode;
                activationcode = ds.Tables[0].Rows[0]["activation_code"].ToString();
                if (activationcode==TextBox1.Text)
                {
                    changestatus();
                    Label1.Text = "Your E-mail Has Been Verified";

                }
                else
                {
                    Label1.Text = "Your Enter Invald Verification Code Plz Check Your E-mail";

                }
            }


        }

        public void changestatus()
        {
            String uptadedate = "Update Verification set status='Verified' where E_mail='" + Request.QueryString["emailadd"] + "'";
            SqlConnection con = new SqlConnection(mycon);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = uptadedate;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();


        }
    }
}
