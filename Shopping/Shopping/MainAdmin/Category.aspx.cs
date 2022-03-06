using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping.MainAdmin
{
    public partial class Category : System.Web.UI.Page
    {
       // string str = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        string str = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
       public int c_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Categ"] != null && Session["Categ"].ToString() != string.Empty)
                {
                    if (Session["Categ"].Equals("Already"))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Category Already Exist Try Another')", true);
                        Session["Categ"] = string.Empty;
                    }
                    else if (Session["Categ"].Equals("Insert"))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Category Added  SuccessFully')", true);
                        Session["Categ"] = string.Empty;
                    }
                }
                if (Session["Adminname"] != null)
                {
                    using (SqlConnection con = new SqlConnection(str))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("getcat_id", con);//stored procedure 
                        cmd.CommandType = CommandType.StoredProcedure;
                        c_id = (int)cmd.ExecuteScalar();
                        cat_id.Text = Convert.ToString(c_id + 1);
                        con.Close();
                    }
                }
                else
                {
                    Response.Redirect("~/AdminLoginpage.aspx");
                }
            }
           
        }
      
        public void clear()
        {
            cat_id.Text = "";
            txt2.Text = "";
            txt1.Text = "";
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(str);
            SqlDataAdapter sda = new SqlDataAdapter("select * from [Categories] where Cat_name='" + txt1.Text.ToString() + "'", con);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                Session["Categ"] = "Already";
                Response.Redirect(Request.Url.AbsoluteUri);
                //Response.Write("<script>alert ('This Catergary Already Exist')</script>");
            }
            else
            {
                SqlConnection con1 = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into [Categories] values(@Cat_name,@Cat_Desc,@Admin_id)", con);
                cmd.Parameters.AddWithValue("@Cat_name", txt1.Text);
                cmd.Parameters.AddWithValue("@Cat_Desc", txt2.Text);
                cmd.Parameters.AddWithValue("@Admin_id", 1);
                cmd.ExecuteNonQuery();
                con.Close();
                // Response.Write("<script>alert('One Record Added')</script>");
                Session["Categ"] = "Insert";
                Response.Redirect(Request.Url.AbsoluteUri);
                clear();
            }
        }
    }
}