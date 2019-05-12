using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataAccessLayer aLayer = new DataAccessLayer();
            string input = txtPass.Text;
            string hashedPassword;
            string type = "", firstname = "";
            int personid = 0;

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
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
             
                String query = "select usertype, firstName, personid from tbperson where username ='" +
                txtId.Text + "'and perPassword= '" + hashedPassword + "'";

                SqlCommand command = new SqlCommand(query, sqlCon);
                SqlDataReader reader = command.ExecuteReader();
               
                if (reader.HasRows)
                {
                    
                    this.Master.loginName = "Logout";
                    while (reader.Read())
                    {
                        type = reader.GetString(0);
                        firstname = reader.GetString(1);
                        personid = reader.GetInt32(2);
                       
                    }
                    this.Master.profileName = "Welcome " + type + " " + firstname;
                    lblMessage.Text = "Login was successful";
                }
                else
                {
                    lblMessage.Text = "Invalid Username and password combination!"; 
                 
                }

                // string userType = aLayer.userLogin(txtId.Text, hashedPassword);


               

               

                // aLayer.userLogin(txtId.Text, hashedPassword);
                if (type == "Customer" || type == "customer")
                {
                    HttpCookie UserLogin = new HttpCookie("UserLogin");
                    UserLogin.Values["UserType"] = type;
                    UserLogin.Values["FirstName"] = firstname;
                    UserLogin.Values["PersonId"] = personid.ToString();
                    int custId = aLayer.getid("customerid", "tbcustomer", personid);
                    UserLogin.Values["CustomerId"] = custId.ToString();
                    // Label1.Text = custId.ToString();
                    UserLogin.Expires.AddDays(1);
                    Response.Cookies.Add(UserLogin);
                    Response.Redirect("Home.aspx");


                }
                else if (type == "Tradesperson" || type == "tradesperson")
                {
                    HttpCookie UserLogin = new HttpCookie("UserLogin");
                    UserLogin.Values["UserType"] = type;
                    UserLogin.Values["FirstName"] = firstname;
                    UserLogin.Values["PersonId"] = personid.ToString();
                    try
                    {
                        int tradespersonid = aLayer.getid("tradespersonid", "tbtradesperson", personid);
                        UserLogin.Values["TradespersonId"] = tradespersonid.ToString();
                       
                    //   Label1.Text = tradespersonid.ToString();
                    }
                    catch(Exception ex)
                    {
                        //Label1.Text = ex.Message;
                        lblMessage.Text = "Error occured " + ex.Message;
                    }



                    UserLogin.Expires.AddDays(1);
                    Response.Cookies.Add(UserLogin);

                    Response.Redirect("TradesLogin.aspx");
                }
                else if (type == "Admin" || type == "admin")
                {
                    HttpCookie UserLogin = new HttpCookie("UserLogin");
                    UserLogin.Values["UserType"] = type;
                    UserLogin.Values["FirstName"] = firstname;
                    UserLogin.Values["PersonId"] = personid.ToString();

                    int adminId = aLayer.getid("adminid", "tbadmin", personid);
                    UserLogin.Values["AdminId"] = adminId.ToString();
                          UserLogin.Expires.AddDays(1);
                    Response.Cookies.Add(UserLogin);


                    Response.Redirect("AddProperty.aspx");
                }
                else if (type == "Agent" || type == "agent")
                {
                    HttpCookie UserLogin = new HttpCookie("UserLogin");
                    UserLogin.Values["UserType"] = type;
                    UserLogin.Values["FirstName"] = firstname;
                    UserLogin.Values["PersonId"] = personid.ToString();

                    int agentid = aLayer.getid("agentid", "tbagent", personid);
                    UserLogin.Values["AgentId"] = agentid.ToString();
                    UserLogin.Expires.AddDays(1);
                    Response.Cookies.Add(UserLogin);


                    Response.Redirect("Addproperty.aspx");
                }


                //txtId.Text = "";
                //txtPass.Text = "";


                // Response.Redirect("AdminLogin.");

              



            }
                //if(type == "Admin")
                //{
                //    Response.Redirect("AddProperty.aspx");
                //}
                //else if(type == "Customer")
                //{
                //    Response.Redirect("Home.aspx");
                //}
                //else if(type == "Tradesperson" || type=="Agent")
                //{
                //    Response.Redirect("TradesLogin.aspx");
                //}
                //  lblMessage.Text = "Welcome " + userType;
                //  Response.Redirect("IssuePage.aspx?userType='" + userType + "'");
                //    Response.Redirect("Issue.aspx?custmerid=" + custId + "'");

            }

        

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}