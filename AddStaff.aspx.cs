using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

namespace Topstar
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
        string hashedPassword;
        string userType;

        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            userType = dpType.SelectedItem.ToString();
            //lblMessage.Text = "Code reaching";
            lblMessage.Text = userType;
            string input = txtPassword.Text;

            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                StringBuilder buidler = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    buidler.Append(bytes[i].ToString("x2"));
                }
                hashedPassword = buidler.ToString();
            }



            if (userType == "Tradesperson")
            {

              dao.addTradesperson(txtLastname.Text, txtFirstName.Text, Convert.ToInt32(txtPhoneNo.Text), hashedPassword, txtUsername.Text, txtEmail.Text, txtAddress.Text, txtTradestype.Text, txtCname.Text, Convert.ToInt32(txtCphoneNo.Text), txtCaddress.Text);
                    lblMessage.Text = "Tradesperson successfully added"  ;
            }
            else if (userType == "Agent")
            {

                dao.addAgent(txtLastname.Text, txtFirstName.Text, Convert.ToInt32(txtPhoneNo.Text), hashedPassword, txtUsername.Text, txtEmail.Text, txtAddress.Text, txtPosition.Text, txtDepartment.Text, Convert.ToInt32(txtExtNo.Text));
                lblMessage.Text = "Agent successfully added";
            }
            else if (userType == "Admin")
            {
                dao.addAdmin(txtLastname.Text, txtFirstName.Text, Convert.ToInt32(txtPhoneNo.Text), hashedPassword, txtUsername.Text, txtEmail.Text, txtAddress.Text);
                lblMessage.Text = "Admin successfully added";
            }
            else
            {
                lblMessage.Text = "User not identified";
            }




        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            userType = dpType.SelectedItem.ToString();
            if (userType == "Tradesperson")
            {
                pTrades.Visible = true;
                pAgent.Visible = false;
            }
            else if (userType == "Agent")
            {
                pTrades.Visible = false;
                pAgent.Visible = true;
            }
            else if(userType == "Admin")
            {
                pTrades.Visible = false;
                pAgent.Visible = false;
            }
        }
    }
}