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
    public partial class WebForm5 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtPassword.Text == txtConfirmPassword.Text)
            {
                string hashedPassword;
                using (SHA256 sha256Hash = SHA256.Create())
                {
                    byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(txtPassword.Text));
                    StringBuilder builder = new StringBuilder();
                    for (int i = 0; i < bytes.Length; i++)
                    {
                        builder.Append(bytes[i].ToString("x2"));
                    }
                    hashedPassword = builder.ToString();

                }

                dao.resetPassword(txtUsername.Text, hashedPassword);
                lblMessage.Text = "Your password has been successfully changed.";
                lblLogin.Visible = true;
            
            }
            else
            {
                lblMessage.Text = "The passwords dont match";
            }
        }
    }
}