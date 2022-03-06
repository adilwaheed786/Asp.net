using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Shopping
{
    public partial class loginviewpage : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-7BNIILF\SQLEXPRESS;Initial Catalog=AdminTable;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton admin = this.Master.FindControl("LinkButton4") as LinkButton;
            admin.Visible = false;
            LinkButton lnkLogout = this.Master.FindControl("LinkButton3") as LinkButton;
            lnkLogout.Visible = true;
            LinkButton login = this.Master.FindControl("LinkButton1") as LinkButton;
            login.Visible = false;
            LinkButton sign = this.Master.FindControl("LinkButton2") as LinkButton;
            sign.Visible = false;
            if (Session["username"] != null)
            {
                LinkButton user = this.Master.FindControl("LinkButton7") as LinkButton;
                user.Text = "Welcome " + Session["username"];
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
            //===========/
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            if (dt != null)
            {
                Label6.Text = dt.Rows.Count.ToString();
            }
            else
            {
                Label6.Text = "0";
            }
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DropDownList dlist = (DropDownList)(e.Item.FindControl("DropDownList1"));
            Response.Redirect("Addtocart.aspx?id=" + e.CommandArgument.ToString() + "&quantity=" + dlist.SelectedItem.ToString());

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}