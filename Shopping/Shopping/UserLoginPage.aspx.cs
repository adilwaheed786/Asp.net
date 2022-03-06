using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Services.Description;
using System.Configuration;
using System.Data.SqlClient;

namespace Shopping
{
    public partial class UserLoginPage : System.Web.UI.Page
    {
        //string strcon = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        string strcon = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            Session.RemoveAll();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlDataReader rd = null;
                if (DropDownList1.SelectedValue == "Become A Buyer")
                {
                    SqlCommand cmd = new SqlCommand("Select * From Customer where E_mail=@E_mail AND password=@password", con);
                    cmd.Parameters.AddWithValue("@E_mail", TextBox1.Text.ToString());
                    cmd.Parameters.AddWithValue("@password", TextBox2.Text.ToString());
                    con.Open();
                    rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        rd.Read();
                        Session["Email"] = TextBox1.Text;
                        Response.Redirect("ProdViews.aspx");
                        //ClientScript.RegisterStartupScript(this.GetType(), "andomtext");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "andomtext", "alertmewrong()", true);
                       
                    }
                    con.Close();
                }
                else if (DropDownList1.SelectedValue == "Become A Seller")             
                {
                    SqlCommand cmd = new SqlCommand("Select * From Seller where E_mail=@E_mail AND password=@password", con);
                    cmd.Parameters.AddWithValue("@E_mail", TextBox1.Text.ToString());
                    cmd.Parameters.AddWithValue("@password", TextBox2.Text.ToString());
                    con.Open();
                    rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        rd.Read();
                        Session["Email"] = TextBox1.Text;
                        Response.Redirect("~/Seller/SellerAdmin.aspx");
                        //ClientScript.RegisterStartupScript(this.GetType(), "andomtext");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "andomtext", "alertmewrong()", true);

                    }
                    con.Close();
                }
                            //Session["username"] = TextBox1.Text;
                            //Response.Redirect("loginviewpage.aspx");
                         //ClientScript.RegisterStartupScript(this.GetType(), "andomtext", "alertme()", true);
                //    }
                //}
                //ClientScript.RegisterStartupScript(GetType(), "andomtext", "alertmewrong()", true);
                //sr.Close();
            }
            catch (Exception ea)
            {
                Response.Write(ea.Message);
            }
           


        }
    }
}