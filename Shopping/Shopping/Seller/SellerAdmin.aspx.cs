using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace Shopping.Seller
{
    public partial class SellerAdmin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
        //string cs = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        int p_id, c_id, seller_id;



        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["Group"] != null && Session["Group"].ToString() != string.Empty)
                    {
                        // Page.RegisterStartupScript("message", "swal('" + a + "','" + b + "','error');");
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('Added Success')", true);
                        //ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "swal('Good','Record','Success')", true);

                        // Page.RegisterStartupScript("K", "alert(4)");

                        Session["Group"] = string.Empty;
                    }

                    if (Session["Email"] != null)
                    {
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();
                            string query = "select Seller_Name from Seller where E_mail='" + Session["Email"] + "'";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.CommandType = CommandType.Text;
                            Session["username"] = cmd.ExecuteScalar();
                        }
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("getproductid", con);//stored procedure 
                            cmd.CommandType = CommandType.StoredProcedure;
                            p_id = (int)cmd.ExecuteScalar();
                            Product_id.Text = Convert.ToString(p_id + 1);
                            con.Close();
                        }
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();
                            string query = "select Seller_id from Seller where E_mail='" + Session["Email"] + "'";
                            SqlCommand cmd4 = new SqlCommand(query, con);
                            cmd4.CommandType = CommandType.Text;
                            //seller_id = (int)cmd4.ExecuteScalar();
                            Session["s_id"] = (int)cmd4.ExecuteScalar();
                            con.Close();
                        }
                      
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();
                            string query = "select Seller_id from Seller where E_mail='" + Session["Email"] + "'";
                            SqlCommand cmd4 = new SqlCommand(query, con);
                            cmd4.CommandType = CommandType.Text;
                            seller_id = (int)cmd4.ExecuteScalar();
                            con.Close();
                        }
                        using (SqlConnection con = new SqlConnection(cs))
                        {
                            con.Open();
                            SqlCommand cmd3 = new SqlCommand("select Cat_id,Cat_name from Categories");
                            cmd3.CommandType = CommandType.Text;
                            cmd3.Connection = con;
                            DropDownList1.DataSource = cmd3.ExecuteReader();
                            DropDownList1.DataTextField = "Cat_name";
                            DropDownList1.DataValueField = "Cat_id";
                            DropDownList1.DataBind();
                            con.Close();
                        }
                        DropDownList1.Items.Insert(0, new ListItem("Select Category"));
                    }
                    else
                    {
                        Response.Redirect("~/userloginpage.aspx");
                    }

                }
            }
            catch (Exception a)
            {

                Response.Write(a);
            }
        }

       

        protected void b1_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    string query = "select Seller_id from Seller where E_mail='" + Session["Email"] + "'";
                    SqlCommand cmd4 = new SqlCommand(query, con);
                    cmd4.CommandType = CommandType.Text;
                    seller_id = (int)cmd4.ExecuteScalar();
                    con.Close();
                }
                HttpPostedFile postedFile = f1.PostedFile;
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
                        SqlCommand cmd = new SqlCommand("InsertProduct", con);//stored procedure 
                        cmd.Parameters.AddWithValue("@Catid", cat_id.Text.ToString());
                        cmd.Parameters.AddWithValue("@Sellerid", seller_id.ToString());
                        cmd.Parameters.AddWithValue("@Catname", DropDownList1.SelectedItem.ToString());
                        cmd.Parameters.AddWithValue("@Prname", txt1.Text.ToString());
                        cmd.Parameters.AddWithValue("@Prdescription", txt4.Text.ToString());
                        cmd.Parameters.AddWithValue("@Primage", bytes);
                        cmd.Parameters.AddWithValue("@Price", txt2.Text.ToString());
                        cmd.Parameters.AddWithValue("@Stock", txt3.Text.ToString());
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        clear();
                        // ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "swal('Good','Record','Success')", true);
                        Session["Group"] = "Added";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
                else
                {
                    //Response.Write("<script>alert(5)</script>");
                }

            }
            catch (Exception ea)
            {

                Response.Write(ea);
            }
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                HttpPostedFile postedFile = f1.PostedFile;
                string filename = Path.GetFileName(postedFile.FileName);
                string fileExtension = Path.GetExtension(filename);
                int fileSize = postedFile.ContentLength;
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                    || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = false;
                }
            }
            catch (Exception ex)
            {
                args.IsValid = false;
            }
        }
        public void clear()
        {
            txt1.Text = "";
            txt2.Text = "";
            txt3.Text = "";
            txt4.Text = "";
            Product_id.Text = "";
            cat_id.Text = "";

            //txt5.Text = "";
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string value = Convert.ToString(DropDownList1.SelectedItem.Text);
                if (value != "Select Category")
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        string query = "select Cat_id from Categories where Cat_name='" + value + "'";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.CommandType = CommandType.Text;
                        c_id = (int)cmd.ExecuteScalar();
                        cat_id.Text = c_id.ToString();
                        con.Close();
                    }
                }
                else
                {

                }

            }
            catch (Exception ea)
            {
                Response.Write(ea.Message);
                ClientScript.RegisterStartupScript(GetType(), ea.ToString(), "alertmeEx()", true);

            }

        }

    }
}