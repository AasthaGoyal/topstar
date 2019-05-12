using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fpLogoImage.HasFile)
            {
                string logo1 = fpLogoImage.FileName;
                fpLogoImage.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + logo1);

               
                string path1 = "/images/" + logo1.ToString();
              

                dao.AddPanelIems(path1, txtComName.Text, txtComAddress.Text, Convert.ToInt32(txtComPhoneNo.Text), txtNavigation.Text, txtAboutUs.Text);


            }
            else
            {
                lbMessage.Text = "Atleast one logo image is required";
            }

            string name = txtNavigation.Text;
            string pathname;



            if (fuIcon.HasFiles)
            {

                string filename = fuIcon.FileName;

                fuIcon.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + filename);
                pathname = "/images/" + fuIcon.FileName;
                dao.AddNewNavigation(name, pathname);
                lbMessage.Text = "Navigation Added";

            }
            else
            {
                lbMessage.Text = "Navigation icon is required";
            }

        }

       
    }
}