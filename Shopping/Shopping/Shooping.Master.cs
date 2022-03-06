using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Shopping
{
    public partial class Shooping : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                Session.RemoveAll();
                Session["Email"] = null;
                Session["s_id"] = null;
                Response.Redirect("~/Home.aspx");
            }
        }
    }
}