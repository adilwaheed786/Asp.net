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
    public partial class Inventory : System.Web.UI.Page
    {
        // string str = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        string cs = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminname"] != null)
            {
                GetData();
            }
            else
            {
                Response.Redirect("~/AdminLoginpage.aspx");
            }
           
        }
        private void GetData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "select Cat_id As Id,Cat_name As [Category Name],Cat_Desc As [Description] from Categories";
                SqlCommand cmd = new SqlCommand(query, con);
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
                con.Close();
            }
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {

        }
    }
}