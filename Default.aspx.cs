using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Topstar
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;

        int customerid;
        string firstname;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.loginName = "Logout";
            
            if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
            {
                HttpCookie reqCookies = Request.Cookies["UserLogin"];
                customerid = Convert.ToInt32(reqCookies["CustomerId"]);
                firstname = reqCookies["FirstName"];
                this.Master.profileName = "Welcome " + firstname;
            }
                
        }

      
        
    }
}