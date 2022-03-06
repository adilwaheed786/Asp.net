using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class ProdViews : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
        //string cs = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] != null)
                {
                    LinkButton admin = this.Master.FindControl("LinkButton4") as LinkButton;
                    admin.Visible = false;
                    LinkButton lnkLogout = this.Master.FindControl("LinkButton3") as LinkButton;
                    lnkLogout.Visible = true;
                    LinkButton login = this.Master.FindControl("LinkButton1") as LinkButton;
                    login.Visible = false;
                    LinkButton sign = this.Master.FindControl("LinkButton2") as LinkButton;
                    sign.Visible = false;
            
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();
                        string query = "select Cust_Name from Customer where E_mail='" + Session["Email"] + "'";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.CommandType = CommandType.Text;
                        Session["username"] = cmd.ExecuteScalar();
                    }
                    LinkButton user = this.Master.FindControl("LinkButton7") as LinkButton;
                    user.Text = "Welcome " + Session["username"];
                    if (Session["cartitem"] != null)
                    {                       
                        Label6.Text = Session["cartitem"].ToString();
                    }
                    else
                    {
                        Label6.Text = "0";
                    }
                    GetData();
                }
                else
                {
                    Response.Redirect("~/userloginpage.aspx");
                }
               
               

            }           
        }
        private void GetData()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("BindAllProducts", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                          
                            sda.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                        }
                    }
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            //    //string p_id = (item.FindControl("Label1") as Label).Text;
            //    string Sellname = (item.FindControl("Label2") as Label).Text;
            //    string p_id = (item.FindControl("pid")as HiddenField).Value;
                         
            //    DropDownList dlist = (DropDownList)(item.FindControl("DropDownList1"));
            //    Response.Redirect("Addtocart.aspx?id=" + p_id + "&quantity=" + dlist.SelectedItem.ToString()+"&Seller="+ Sellname.ToString().ToUpper());
            //}
            //catch (Exception a)
            //{

            //    Response.Write(a);
            //}
            try
            {
                RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
                //string p_id = (item.FindControl("Label1") as Label).Text;
                string Sellname = (item.FindControl("Label2") as Label).Text;
                string PID = (item.FindControl("pid") as HiddenField).Value;
                DropDownList dlist = (DropDownList)(item.FindControl("DropDownList1"));

                if (Request.Cookies["CartPID"] != null)
                {
                    string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                    CookiePID = CookiePID + "," + PID + "-" + dlist.SelectedItem.ToString()+"-"+ Sellname.ToString().ToUpper();

                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = CookiePID;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                else
                {
                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = PID.ToString() + "-" + dlist.SelectedItem.ToString() + "-" + Sellname.ToString().ToUpper();
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                Response.Redirect("~/Cart.aspx?PID=" + PID);
            }
            catch (Exception a)
            {

                Response.Write(a);
            }
       
        }
    }
}