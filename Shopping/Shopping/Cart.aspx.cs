using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping
{
    public partial class Cart : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["v3"].ConnectionString;
        //string cs = ConfigurationManager.ConnectionStrings["shoping"].ConnectionString;
        string CookiePIDUpdated;
        private string HeaderText { get; set; }

        private long cartTotal;

         private long GetCartTotal()
        {
            return cartTotal;
        }

        private void SetCartTotal(long value)
        {
            if (value==0)
            {
                cartTotal = 0;
            }
            else
            {
                cartTotal = value;
            }
            
        }

        private long total;

        private long GetTotal()
        {
            return total;
        }

        private void SetTotal(long value)
        {
            if (value == 0)
            {
               total = 0;
            }
            else
            {
               total = value;
            }
        }

        private long subtotal;

        private long GetSubtotal()
        {
            return subtotal;
        }

        private void SetSubtotal(long value)
        {
            if (value == 0)
            {
                subtotal = 0;
            }
            else
            {
               subtotal = value;
            }
        }

        private long finalTotal;

        private long GetFinalTotal()
        {
            return finalTotal;
        }

        private void SetFinalTotal(long value)
        {
            if (value == 0)
            {
                finalTotal = 0;
            }
            else
            {
                finalTotal = value;
            }
        }

        private long discount1;

        private long Getdiscount()
        {
            return discount1;
        }

        private void Setdiscount(long value)
        {
            if (value == 0)
            {
                discount1 = 0;
            }
            else
            {
                discount1 = value;
            }
        }

        //Int64 Total = 0;
        // Int64 Subtotal = 0;
        // Int64 FinalTotal = 0;
        // Int64 discount = 0;
       static long a = 0;
       static long b = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

         
               
                if (Session["Email"] != null)
                {
                    if (!IsPostBack)
                    {
                        LinkButton admin = this.Master.FindControl("LinkButton4") as LinkButton;
                        admin.Visible = false;
                        LinkButton lnkLogout = this.Master.FindControl("LinkButton3") as LinkButton;
                        lnkLogout.Visible = true;
                        LinkButton login = this.Master.FindControl("LinkButton1") as LinkButton;
                        login.Visible = false;
                        LinkButton sign = this.Master.FindControl("LinkButton2") as LinkButton;
                        sign.Visible = false;

                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            con.Open();
                            string query = "select Cust_Name from Customer where E_mail='" + Session["Email"] + "'";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.CommandType = CommandType.Text;
                            Session["username"] = cmd.ExecuteScalar();
                        }
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            con.Open();
                            string query = "select Cust_id from Customer where E_mail='" + Session["Email"] + "'";
                            SqlCommand cmd4 = new SqlCommand(query, con);
                            cmd4.CommandType = CommandType.Text;
                            ViewState["custid"] = (int)cmd4.ExecuteScalar();
                            con.Close();
                        }
                        LinkButton user = this.Master.FindControl("LinkButton7") as LinkButton;
                        user.Text = "Welcome " + Session["username"];
                        BindCartProducts();
                    }
                   
                }
                else
                {
                    Response.Redirect("~/userloginpage.aspx");
                }

            
        }
        private void BindCartProducts()
        {
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    h5NoItems.InnerText = "MY CART (" + CookieDataArray.Length + " Items)";
                    DataTable dtBrands = new DataTable();
                    DataRow dr;
                    dtBrands.Columns.Add("quantity");
                    dtBrands.Columns.Add("Seller_name");
                    dtBrands.Columns.Add("Sub_total");
                    dr = dtBrands.NewRow();

                   
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string quantity = CookieDataArray[i].ToString().Split('-')[1];
                        string sellername = CookieDataArray[i].ToString().Split('-')[2];

                        using (SqlConnection con = new SqlConnection(CS))
                        {

                            String q1 = "select Product_id,Pr_name,Pr_image,Price,Pr_description from Products where Product_id=" + PID + "";
                            using (SqlCommand cmd = new SqlCommand(q1, con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dtBrands);

                                }
                            }
                        }


                        SetSubtotal(Convert.ToInt64(quantity) * Convert.ToInt64(dtBrands.Rows[i]["Price"]));
                        dtBrands.Rows[i]["quantity"] = quantity;
                        dtBrands.Rows[i]["Seller_name"] = sellername;
                        dtBrands.Rows[i]["Sub_total"] = GetSubtotal();
                        SetCartTotal(GetCartTotal() + Convert.ToInt64(dtBrands.Rows[i]["Price"]));
                        //Total += Convert.ToInt64(dtBrands.Rows[i]["Price"]);
                        SetTotal(GetTotal() + GetSubtotal());
                    }

                    rptrCartProducts.DataSource = dtBrands;
                    rptrCartProducts.DataBind();
                    divPriceDetails.Visible = true;
                    Setdiscount(Convert.ToInt64((GetTotal() * 10) / 100));
                    Discount.InnerText = ("-" + Getdiscount()).ToString();
                    spanCartTotal.InnerText = GetTotal().ToString();
                    SetFinalTotal((GetTotal() - Getdiscount()));
                    spanTotal.InnerText = "Rs. " + GetFinalTotal();
                    ViewState["withoutdiscount"] = GetTotal();
                    ViewState["withdiscount"] = GetFinalTotal();

                     a = GetTotal();
                     b = GetFinalTotal();
                    span1.InnerText = "Note:When Your Enter Coupon Code You Will Pay Total Other Wise You Will Pay Sub Total";
                    spanDiscount.InnerText = "10 % Off When Using Coupon Code";
                    if (dtBrands != null)
                    {
                        Session["cartitem"] = dtBrands.Rows.Count.ToString();
                        Label1.Text = Session["cartitem"].ToString();
                    }
                    else
                    {
                        Label1.Text = "0";
                    }
                }
                else
                {
                    //TODO Show Empty Cart
                    h5NoItems.InnerText = "Your Shopping Cart is Empty";
                    divPriceDetails.Visible = false;
                }
            }
            else
            {
                //TODO Show Empty Cart
                h5NoItems.InnerText = "Your Shopping Cart is Empty";
                divPriceDetails.Visible = false;

            }
        }
        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            Button btn = (Button)(sender);
            string PIDSIZE = btn.CommandArgument;

            List<String> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
            CookiePIDList.Remove(PIDSIZE);
            CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
            if (CookiePIDUpdated == "")
            {
                HttpCookie CartProducts = Request.Cookies["CartPID"];
                CartProducts.Values["CartPID"] = null;
                CartProducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);
            }
            else
            {
                HttpCookie CartProducts = Request.Cookies["CartPID"];
                CartProducts.Values["CartPID"] = CookiePIDUpdated;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);

            }
            Response.Redirect("~/Cart.aspx");

        }
        public void changecopounStatus()
        {
            String uptadedate = "Update Coupons set status='used' where Cust_id=" + ViewState["custid"] + "";
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = uptadedate;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
        }
        private void sendOrderWithDiscount()
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
                msg.Subject = "Your Order Has Been Placed";
                
          
                msg.Body = "Dear" + Session["username"] + ", Your Total Amount Of Buying Product Is:" + ViewState["withdiscount"] + "\nWith 10%Discount\nThanks For Using Copoun Code"+"\n\n\n Thanks & Redards WE4";
                string toaddress = Session["Email"].ToString();
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
        private void sendOrderWithoutDiscount()
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
                msg.Subject = "Your Order Has Been Placed";
                msg.Body = "Dear" + Session["username"] + ", Your Total Amount Of Buying Product Is:" + ViewState["withoutdiscount"] + "\nWith 0%Discount\nOpps You Are Not Using Copoun Code" + "\n\n\n Thanks & Redards WE4";
                string toaddress = Session["Email"].ToString();
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
        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            try
            {
       
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    DataTable dtBrands = new DataTable();
                    DataRow dr;
                    dtBrands.Columns.Add("quantity");
                    dtBrands.Columns.Add("Sub_total");
                    dtBrands.Columns.Add("Seller_name");
                    dr = dtBrands.NewRow();
                    using (SqlConnection con = new SqlConnection(CS))
                    {
                        string codevalue="";
                            con.Open();
                        if (TextBox2.Text!="")
                        {
                                string query = "Select *from Coupons where Cust_id='" + ViewState["custid"] + "'";
                                SqlConnection con1 = new SqlConnection(CS);
                                SqlCommand cmd1 = new SqlCommand(query, con1);
                                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                                DataSet ds = new DataSet();
                                da.Fill(ds);
                                if (ds.Tables[0].Rows.Count > 0)
                                {
                                    string CouponCode,status;
                                    CouponCode = ds.Tables[0].Rows[0]["Coupon_Code"].ToString();
                                    if (CouponCode == TextBox2.Text)
                                    {
                                        status = ds.Tables[0].Rows[0]["status"].ToString();
                                        if (status=="unused")
                                        {

                                            changecopounStatus();
                                            sendOrderWithDiscount();
                                            codevalue = "used";
                                            using (SqlCommand cmd = new SqlCommand("InsertOrder", con))
                                            {
                                                cmd.Parameters.AddWithValue("@Cust_id", ViewState["custid"]);
                                                cmd.Parameters.AddWithValue("@shippingid", 1);
                                                cmd.Parameters.AddWithValue("@status", codevalue);
                                                cmd.CommandType = CommandType.StoredProcedure;
                                              
                                                cmd.ExecuteNonQuery();
                                                con.Close();

                                            }
                                            using (SqlConnection conw = new SqlConnection(CS))
                                            {
                                                conw.Open();
                                                string queryq = "select Cust_id from Customer where E_mail='" + Session["Email"] + "'";
                                                SqlCommand cmd4 = new SqlCommand(queryq, conw);
                                                cmd4.CommandType = CommandType.Text;
                                                ViewState["custid"] = (int)cmd4.ExecuteScalar();
                                                conw.Close();
                                            }
                                            using (SqlConnection conf = new SqlConnection(CS))
                                            {
                                                conf.Open();
                                                SqlCommand cmd = new SqlCommand("getOrderId", conf);//stored procedure 
                                                cmd.CommandType = CommandType.StoredProcedure;
                                                ViewState["OrderId"] = (int)cmd.ExecuteScalar();
                                                conf.Close();
                                            }
                                            for (int i = 0; i < CookieDataArray.Length; i++)
                                            {
                                                string PID = CookieDataArray[i].ToString().Split('-')[0];
                                                string quantity = CookieDataArray[i].ToString().Split('-')[1];
                                                string sellername = CookieDataArray[i].ToString().Split('-')[2];

                                                using (SqlConnection conq = new SqlConnection(CS))
                                                {

                                                    String q1 = "select Product_id,Pr_name,Pr_image,Price,Pr_description from Products where Product_id=" + PID + "";
                                                    using (SqlCommand cmd = new SqlCommand(q1, conq))
                                                    {
                                                        cmd.CommandType = CommandType.Text;
                                                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                                        {
                                                            sda.Fill(dtBrands);

                                                        }
                                                    }
                                                }
                                                dtBrands.Rows[i]["quantity"] = quantity;
                                                dtBrands.Rows[i]["Sub_total"] = b;
                                                dtBrands.Rows[i]["Seller_name"] = sellername;
                                                using (SqlConnection conw = new SqlConnection(CS))
                                                {
                                                    conw.Open();
                                                    SqlCommand cmd = new SqlCommand("StockUptade", conw);//stored procedure 
                                                    cmd.Parameters.AddWithValue("@pid", Convert.ToInt64(dtBrands.Rows[i]["Product_id"]));
                                                    cmd.Parameters.AddWithValue("@quantity", dtBrands.Rows[i]["quantity"]);
                                                    cmd.CommandType = CommandType.StoredProcedure;
                                                    cmd.ExecuteNonQuery();
                                                    conw.Close();
                                                }
                                                using (SqlConnection conw = new SqlConnection(CS))
                                                {
                                                    conw.Open();
                                                    SqlCommand cmd = new SqlCommand("GetProductSellerId", conw);//stored procedure 
                                                    cmd.Parameters.AddWithValue("@pid", Convert.ToInt64(dtBrands.Rows[i]["Product_id"]));
                                                    cmd.CommandType = CommandType.StoredProcedure;
                                                    ViewState["Pr_seller_id"] = (int)cmd.ExecuteScalar();
                                                    conw.Close();
                                                }
                                                SetSubtotal(Convert.ToInt64(quantity) * Convert.ToInt64(dtBrands.Rows[i]["Price"]));

                                                using (SqlConnection conw = new SqlConnection(CS))
                                                {
                                                    using (SqlCommand cmd = new SqlCommand("InsertOrderDetail", conw))
                                                    {
                                                        cmd.Parameters.AddWithValue("@oderid", ViewState["OrderId"]);
                                                        cmd.Parameters.AddWithValue("@productid", Convert.ToInt64(dtBrands.Rows[i]["Product_id"]));
                                                        cmd.Parameters.AddWithValue("@quantity", dtBrands.Rows[i]["quantity"]);
                                                        cmd.Parameters.AddWithValue("@price", dtBrands.Rows[i]["Sub_total"]);
                                                        cmd.Parameters.AddWithValue("@sellerid", ViewState["Pr_seller_id"]);
                                                        cmd.CommandType = CommandType.StoredProcedure;
                                                        conw.Open();
                                                        cmd.ExecuteNonQuery();
                                                        conw.Close();
                                                    }
                                                }
                                                string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                                                String pid_quan_name = (Convert.ToInt64(dtBrands.Rows[i]["Product_id"]).ToString()) + "-" + dtBrands.Rows[i]["quantity"] + "-" + dtBrands.Rows[i]["Seller_name"];
                                                List<String> CookiePIDList = CookiePID.Split(',').Select(o => o.Trim()).Where(o => o != string.Empty).ToList();
                                                CookiePIDList.Remove(pid_quan_name);
                                                CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
                                                if (CookiePIDUpdated == "")
                                                {
                                                    HttpCookie CartProducts = Request.Cookies["CartPID"];
                                                    CartProducts.Values["CartPID"] = null;
                                                    CartProducts.Expires = DateTime.Now.AddDays(-1);
                                                    Response.Cookies.Add(CartProducts);
                                                }
                                                else
                                                {
                                                    HttpCookie CartProducts = Request.Cookies["CartPID"];
                                                    CartProducts.Values["CartPID"] = CookiePIDUpdated;
                                                    CartProducts.Expires = DateTime.Now.AddDays(30);
                                                    Response.Cookies.Add(CartProducts);

                                                }
                                                if (Session["cartitem"] != null)
                                                {
                                                    Session["cartitem"] = null;
                                                }
                                            }
                                        }
                                        else
                                        {
                                            Label2.Text = "Coupon Code have Already Used";
                                            Label2.ForeColor = System.Drawing.Color.Red;
                                            
                                        }
                                    }
                                    else
                                    {
                                        Label2.Text = "You have Entered Invalid Code";
                                        Label2.ForeColor = System.Drawing.Color.Red;
                                    }
                                }
                                con.Close();
                        }
                        else
                        {
                                sendOrderWithoutDiscount();
                                codevalue = "unused";
                                using (SqlCommand cm = new SqlCommand("InsertOrder", con))
                                {
                                    cm.Parameters.AddWithValue("@Cust_id", ViewState["custid"]);
                                    cm.Parameters.AddWithValue("@shippingid", 1);
                                    cm.Parameters.AddWithValue("@status", codevalue);
                                    cm.CommandType = CommandType.StoredProcedure;
                                    cm.ExecuteNonQuery();
                                }
                               
                                 
                                    string query = "select Cust_id from Customer where E_mail='" + Session["Email"] + "'";
                                    SqlCommand cmd4 = new SqlCommand(query, con);
                                    cmd4.CommandType = CommandType.Text;
                                    ViewState["custid"] = (int)cmd4.ExecuteScalar();
                                    SqlCommand cmd77 = new SqlCommand("getOrderId", con);//stored procedure 
                                    cmd77.CommandType = CommandType.StoredProcedure;
                                    ViewState["OrderId"] = (int)cmd77.ExecuteScalar();
                                    
                                for (int i = 0; i < CookieDataArray.Length; i++)
                                {
                                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                                    string quantity = CookieDataArray[i].ToString().Split('-')[1];
                                    string sellername = CookieDataArray[i].ToString().Split('-')[2];
                                  
                                    using (SqlConnection conn = new SqlConnection(CS))
                                    {

                                        String q1 = "select Product_id,Pr_name,Pr_image,Price,Pr_description from Products where Product_id=" + PID + "";
                                        using (SqlCommand cmdd = new SqlCommand(q1, conn))
                                        {
                                            cmdd.CommandType = CommandType.Text;
                                            using (SqlDataAdapter sda = new SqlDataAdapter(cmdd))
                                            {
                                                sda.Fill(dtBrands);

                                            }
                                        }
                                    }
                                    dtBrands.Rows[i]["quantity"] = quantity;
                                    dtBrands.Rows[i]["Sub_total"] = a;
                                    dtBrands.Rows[i]["Seller_name"] = sellername;
                                    using (SqlConnection conn = new SqlConnection(CS))
                                    {
                                        conn.Open();
                                        SqlCommand cmd = new SqlCommand("StockUptade", conn);//stored procedure 
                                        cmd.Parameters.AddWithValue("@pid", Convert.ToInt64(dtBrands.Rows[i]["Product_id"]));
                                        cmd.Parameters.AddWithValue("@quantity", dtBrands.Rows[i]["quantity"]);
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        cmd.ExecuteNonQuery();
                                        conn.Close();
                                    }
                                    using (SqlConnection conn = new SqlConnection(CS))
                                    {
                                        conn.Open();
                                        SqlCommand cmd = new SqlCommand("GetProductSellerId", conn);//stored procedure 
                                        cmd.Parameters.AddWithValue("@pid", Convert.ToInt64(dtBrands.Rows[i]["Product_id"]));
                                        cmd.CommandType = CommandType.StoredProcedure;
                                        ViewState["Pr_seller_id"] = (int)cmd.ExecuteScalar();
                                        con.Close();
                                    }
                                    SetSubtotal(Convert.ToInt64(quantity) * Convert.ToInt64(dtBrands.Rows[i]["Price"]));

                                    using (SqlConnection conn = new SqlConnection(CS))
                                    {
                                        using (SqlCommand cmdn = new SqlCommand("InsertOrderDetail", conn))
                                        {
                                            cmdn.Parameters.AddWithValue("@oderid", ViewState["OrderId"]);
                                            cmdn.Parameters.AddWithValue("@productid", Convert.ToInt64(dtBrands.Rows[i]["Product_id"]));
                                            cmdn.Parameters.AddWithValue("@quantity", dtBrands.Rows[i]["quantity"]);
                                            cmdn.Parameters.AddWithValue("@price", dtBrands.Rows[i]["Sub_total"]);
                                            cmdn.Parameters.AddWithValue("@sellerid", ViewState["Pr_seller_id"]);
                                            cmdn.CommandType = CommandType.StoredProcedure;
                                            conn.Open();
                                            cmdn.ExecuteNonQuery();
                                            conn.Close();
                                        }
                                    }
                                    string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                                    String pid_quan_name = (Convert.ToInt64(dtBrands.Rows[i]["Product_id"]).ToString()) + "-" + dtBrands.Rows[i]["quantity"] + "-" + dtBrands.Rows[i]["Seller_name"];
                                    List<String> CookiePIDList = CookiePID.Split(',').Select(o => o.Trim()).Where(o => o != string.Empty).ToList();
                                    CookiePIDList.Remove(pid_quan_name);
                                    CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
                                    if (CookiePIDUpdated == "")
                                    {
                                        HttpCookie CartProducts = Request.Cookies["CartPID"];
                                        CartProducts.Values["CartPID"] = null;
                                        CartProducts.Expires = DateTime.Now.AddDays(-1);
                                        Response.Cookies.Add(CartProducts);
                                    }
                                    else
                                    {
                                        HttpCookie CartProducts = Request.Cookies["CartPID"];
                                        CartProducts.Values["CartPID"] = CookiePIDUpdated;
                                        CartProducts.Expires = DateTime.Now.AddDays(30);
                                        Response.Cookies.Add(CartProducts);

                                    }
                                    if (Session["cartitem"] != null)
                                    {
                                        Session["cartitem"] = null;
                                    }
                                }
                            }
                            
                        }
                        
                       
                        
                }
            }

                Response.Redirect("~/Cart.aspx");
                Response.Write("<script>alert('Order Placed')</script>");
               
            }
            catch (Exception a)
            {

                Response.Write(a);
            }
        }



    }
}