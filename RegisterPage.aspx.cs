using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataAccessLayer alayer = new DataAccessLayer();
            string input = txtPass.Text;
            string hashedPassword;
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                hashedPassword = builder.ToString();

            }
            //   lblMessage.Text = hashedPassword;
            alayer.userRegister(txtLastName.Text, txtFirstName.Text, txtPNO.Text, hashedPassword, txtUserName.Text, txtEmail.Text, txtAddress.Text);
            txtLastName.Text = "";
            txtFirstName.Text = "";
            txtUserName.Text = "";
            txtPass.Text = "";
            //txtPNO.Text = "";
            // DropDownList1.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";

            lblMessage.Text = "You have been successfully registered.";
            lblLogin.Visible = true;
            Response.Redirect("LoginPage.aspx");

        }
    }
}