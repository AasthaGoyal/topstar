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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
        string email, phone, address, info;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "select companyAdress, companyPhNo, aboutUs, emailid from tbPanel where panelId=2";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                  
                    while (reader.Read())
                    {
                        address = reader.GetString(0);
                        phone = reader.GetInt32(1).ToString();
                        info = reader.GetString(2);
                        email = reader.GetString(3);
                    }
                    
                }
               
            }

            lblAboutUs.Text = info;
            lblPhone.Text = phone;
            lblPhone2.Text = phone;
            lblAddress.Text = address;
            lbladdress2.Text = address;
            lblemail.Text = email;
            lblemail2.Text = email;



        }

       
    }
}