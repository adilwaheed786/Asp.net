using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace Shopping.Seller
{
    public partial class Inventory : System.Web.UI.Page
    {
        //string cs = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        string cs = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (Session["Group"] != null && Session["Group"].ToString() != string.Empty)
                {
                    if (Session["Group"].Equals("Deleted"))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Record Deleted  SuccessFully')", true);
                        Session["Group"] = string.Empty;
                    }
                    else if(Session["Group"].Equals("Updated"))
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Record Uptaded  SuccessFully')", true);
                        Session["Group"] = string.Empty;
                    }
                    // Page.RegisterStartupScript("message", "swal('" + a + "','" + b + "','error');");
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "swal('Good','Record','Success')", true);
                    // Page.RegisterStartupScript("K", "alert(4)");
                    //Session["Group"] = string.Empty;
                }
                if (Session["Email"] != null)
                {                   
                    GetData();
                }
                else
                {
                    Response.Redirect("~/userloginpage.aspx");
                }

            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "delete from Products where Product_id=" + id;
                SqlCommand cmd = new SqlCommand(query, con);
                int row = cmd.ExecuteNonQuery();
                if (row > 0)
                {
                    GetData();
                }
                Session["Group"] = "Deleted";
                Response.Redirect(Request.Url.AbsoluteUri);
               // ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Record Deleted  SuccessFully')", true);

                con.Close();
            }

        }
        private void GetData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "select * from Products where Seller_id=" + Session["s_id"];
                SqlCommand cmd = new SqlCommand(query, con);
                //GridView1.DataSource = cmd.ExecuteReader();
                //GridView1.DataBind();

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
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int cid;
            int pid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            // int cid = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox).Text);
            // int sid = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox).Text);
            // string catname = (GridView1.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList).Text;
            DropDownList ddList = (DropDownList)(GridView1.Rows[e.RowIndex].FindControl("DropDownList2"));
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd3 = new SqlCommand("select cat_id from Categories where Cat_name ='" + ddList.SelectedItem.ToString() + "'");
                cmd3.CommandType = CommandType.Text;
                cmd3.Connection = con;
                cid = (int)cmd3.ExecuteScalar();
                con.Close();
            }
            string prname = (GridView1.Rows[e.RowIndex].FindControl("name") as TextBox).Text;
            string Pro_des = (GridView1.Rows[e.RowIndex].FindControl("prd") as TextBox).Text;

            int price = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("price") as TextBox).Text);
            int stock = Convert.ToInt32((GridView1.Rows[e.RowIndex].FindControl("stock") as TextBox).Text);
            FileUpload file = (FileUpload)(GridView1.Rows[e.RowIndex].FindControl("FileUpload1"));
            HttpPostedFile postedFile = file.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("UptadeProduct", con);//stored procedure 
                    cmd.Parameters.AddWithValue("@Catid", cid.ToString());
                    cmd.Parameters.AddWithValue("@Sellerid", Session["s_id"].ToString());
                    cmd.Parameters.AddWithValue("@Productid", pid.ToString());
                    cmd.Parameters.AddWithValue("@Catname", ddList.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@Prname", prname.ToString());
                    cmd.Parameters.AddWithValue("@Prdescription", Pro_des.ToString());
                    cmd.Parameters.AddWithValue("@Primage", bytes);
                    cmd.Parameters.AddWithValue("@Price", price.ToString());
                    cmd.Parameters.AddWithValue("@Stock", stock.ToString());
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.EditIndex = -1;
                    GetData();
                    Session["Group"] = "Updated";
                    Response.Redirect(Request.Url.AbsoluteUri);
                    //ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "swal('Good','Record','Success')", true);    
                  //  ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Record Updated Success')", true);

                    // }



                }
            }
            //GridView1.EditIndex = -1;
            //GetData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddList = (DropDownList)e.Row.FindControl("DropDownList2");
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        SqlCommand cmd3 = new SqlCommand("select Cat_id,Cat_name from Categories");
                        cmd3.CommandType = CommandType.Text;
                        cmd3.Connection = con;
                        ddList.DataSource = cmd3.ExecuteReader();
                        ddList.DataTextField = "Cat_name";
                        ddList.DataValueField = "Cat_id";
                        ddList.DataBind();
                        con.Close();
                    }




                }
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query =string.Format("select * from Products where (Seller_id ="+ Session["s_id"]+ "and( [Product_id] like + '%"+search.Text+ "%'" +
                        "or [Cat_id] like '%"+search.Text+ "%' or[Cat_name] like '%" + search.Text + "%' or[Pr_name] like '%" + search.Text + "%' or[Pr_description] like '%" + search.Text + "%'"+
                        "or[Price] like '%" + search.Text + "%' or[Stock] like '%" + search.Text + "%'))");
                    SqlCommand cmd = new SqlCommand(query, con);

                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                GridView1.DataSource = dt;
                                GridView1.DataBind();
                            }
                            else
                            {
                                GridView1.DataSource = null;
                                GridView1.DataBind();
                            }

                        }
                        con.Close();
                    }

                }
            }
            catch (Exception ea)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Some Exception:"+ea+"')", true);

                throw;
            }
           
        }

    }
}