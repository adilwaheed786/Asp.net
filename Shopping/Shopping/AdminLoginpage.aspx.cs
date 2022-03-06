using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class AdminLoginpage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminname"]!=null)
            {
                Session.RemoveAll();
                Session["Adminname"] = null;
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {

                SqlConnection con = new SqlConnection(strcon);
                SqlDataReader rd = null;
          
                    SqlCommand cmd = new SqlCommand("Select * From MainAdmin where username=@user AND Password=@pass", con);
                    cmd.Parameters.AddWithValue("@user", TextBox1.Text.ToString());
                    cmd.Parameters.AddWithValue("@pass", TextBox2.Text.ToString());
                    con.Open();
                    rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        rd.Read();
                        Session["Adminname"] = TextBox1.Text;
                        Response.Redirect("MainAdmin/Dashboard.aspx");
                        //ClientScript.RegisterStartupScript(this.GetType(), "andomtext");
                    }
                    else
                    {
                    ClientScript.RegisterStartupScript(GetType(), "andomtext", "alertme()", true);

                }
                con.Close();
                
               
                    
               
            }
            catch (Exception ea)
            {
                Response.Write(ea.Message);
            }
        }
            }
            
        }
  