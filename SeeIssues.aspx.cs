using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        string adminid, usertype, firstname;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserLogin"];
                adminid = cookie["AdminId"];
                usertype = cookie["UserType"];
                firstname = cookie["FirstName"];
                this.Master.profilename = "Welcome " + usertype + " " + firstname;
                this.Master.loginname = "Logout";

            }

        }

        protected void btnSolved_Click(object sender, EventArgs e)
        {
            btnSolved.BackColor = System.Drawing.Color.Gray;
            btnUnsolved.BackColor = System.Drawing.Color.LightGray;
            DataList1.DataSourceID = "sqlSolved";
        }

        protected void btnUnsolved_Click(object sender, EventArgs e)
        {
            btnUnsolved.BackColor = System.Drawing.Color.Gray;
            btnSolved.BackColor = System.Drawing.Color.LightGray;
            DataList1.DataSourceID = "sqlUnsolved";
        }
    }
}