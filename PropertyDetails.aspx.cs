using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string propertyid;

        protected void Page_Load(object sender, EventArgs e)
        {
            propertyid = Request.QueryString["propertyid"];
            TextBox1.Text = propertyid;

        }
    }
}