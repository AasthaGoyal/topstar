using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        string customerid, usertype, firstname;
        string personId;
        string lastName = "";
        string firstName = "";
        int phoneNo = 1;
        string perPassword = "";
        string username = "";
        string emailid = "";
        string perAddress = "";

        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtfname.Enabled = true;
            txtlname.Enabled = true;
            txtusername.Enabled = true;
            txtphone.Enabled = true;
            txtemail.Enabled = true;
            txtaddress.Enabled = true;

        }

            protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //lblMessage.Text = personId.ToString();

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            try
            {
               //string query = "update tbperson set firstName='" + txtfname.Text + "', lastName='" + txtlname.Text + "',Username='" + txtusername.Text + "',phoneNo ='" + txtphone.Text + "',emailid='" + txtemail.Text + "',perAddress='" + txtaddress.Text + "' where personid=" + personId ;
                //string query = "update tbperson set firstName='" + txtFirstName., Text + "' where personid ='" + personId + "'";
             string query = "update tbperson set firstName ='" + txtfname.Text + "', lastName='" + txtlname.Text + "' where personid = " + personId ;
                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.ExecuteNonQuery();

                lblMessage.Text = "Your profile has been successfully updated";
                showData();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error occured " + ex.Message;
            }


        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserLogin"];
                customerid = cookie["CustomerId"];
                usertype = cookie["UserType"];
                firstname = cookie["FirstName"];
                personId = cookie["personid"];

                this.Master.profileName = "Welcome " + firstname;
                this.Master.loginName = "Logout";

            }


            showData();


        }

        public void showData()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            String quary2 = "select lastName, firstName, phoneNo, perPassword, username, emailid, perAddress from tbperson where personid ='" +
                personId + "'";
            SqlCommand command2 = new SqlCommand(quary2, connection);

            SqlDataReader reader = command2.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lastName = reader.GetString(0);
                        firstName = reader.GetString(1);
                        phoneNo = reader.GetInt32(2);
                        perPassword = reader.GetString(3);
                        username = reader.GetString(4);

                        emailid = reader.GetString(5);
                        perAddress = reader.GetString(6);
                    }

                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "error" + ex.Message;
            }
            connection.Close();
            reader.Close();


            txtfname.Text = firstname;
            txtlname.Text = lastName;

            txtusername.Text = username;


            txtphone.Text = phoneNo.ToString();
            txtemail.Text = emailid;
            txtaddress.Text = perAddress;
            lblname.Text = firstname;

            txtfname.Enabled = false;
            txtlname.Enabled = false;
            txtusername.Enabled = false;
            txtphone.Enabled = false;
            txtemail.Enabled = false;
            txtaddress.Enabled = false;

        }


    }
        
    }