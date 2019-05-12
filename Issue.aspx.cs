using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
        DateTime now;
        string customerEmail ;
        int customerid;
        string firstname, usertype;

        string incity, indistrict, insuburb;
        string bed, bath, park;

        string res;

        string inpropertyid;
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
        string city;
        int cityId;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["UserLogin"] == null)
            {
                this.Master.loginName = "Login";
                MessageBoxShow("Please login to add an issue");
                txtName.Enabled = false;
                txtDescription.Enabled = false;
                txtDate.Enabled = false;
                txtPropertyid.Enabled = false;
                fpIssueImage.Enabled = false;

            }
            else
            {
                this.Master.loginName = "Logout";
                HttpCookie reqCookies = Request.Cookies["UserLogin"];
                if(reqCookies["CustomerId"] == " ")
                {
                    MessageBoxShow("Please login to add an issue");
                    txtName.Enabled = false;
                    txtDescription.Enabled = false;
                    txtDate.Enabled = false;
                    txtPropertyid.Enabled = false;
                }
                else
                {
                    customerid = Convert.ToInt32(reqCookies["CustomerId"]);
                    firstname = reqCookies["FirstName"];
                    usertype = reqCookies["UserType"];
                    this.Master.profileName = "Welcome " + usertype + " " + firstname;
                    if(customerid != 0)
                    {
                        customerEmail = dao.getCustomeremailid(customerid).ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Please login to add a issue";
                    }

                }
               
            }
         
            now = DateTime.Now;
            txtDate.Text = now.ToString();

        }

        protected void dpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            city = dpCity.SelectedItem.ToString();
            cityId = dao.returnCityid(city);

            txtinput.Text = cityId.ToString();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtPropertyid.Text = row.Cells[1].Text;
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        private void MessageBoxShow(string message)
        {
            this.AlertBoxMessage.InnerText = message;
            this.AlertBox.Visible = true;
        }

        protected void txtPropertyid_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (txtBedrooms.Text.Length != 0)
            {

                bed = "and p.noOfbedrooms='" + Convert.ToInt32(txtBedrooms.Text) + "'";
                sb.Append(bed);
            }

            if (txtBathrooms.Text.Length != 0)
            {

                bath = "and p.noOfBathrooms='" + Convert.ToInt32(txtBathrooms.Text) + "'";
                sb.Append(bath);
            }


            if (txtParking.Text.Length != 0)
            {

                park = "and p.parking ='" + Convert.ToInt32(txtParking.Text) + "'";
                sb.Append(park);
            }

            if (txtSuburb.Text.Length != 0)
            {
                insuburb = "and p.suburb ='" + txtSuburb.Text + "'";
                sb.Append(insuburb);
            }





            if (dpCity.SelectedItem.Text != "All New Zealand")
            {

                incity = "and p.city ='" + dpCity.SelectedItem.Value.ToString() + "'";
                sb.Append(incity);
            }

            if (dpDistrict.SelectedItem.Text != "All Districts")
            {

                indistrict = "and p.district='" + dpDistrict.SelectedItem.Value.ToString() + "'";
                sb.Append(indistrict);
            }
            if (txtPropertyid.Text.Length != 0)
            {
                inpropertyid = "and p.propertyid ='" + Convert.ToInt32(txtPropertyid.Text) + "'";
                sb.Append(inpropertyid);
            }
            res = sb.ToString();

            //lblQuery.Text = "select * from tbproperty p, tbrproperty r where p.propertyid=r.propertyid " + res;
            // string query = "select * from tbproperty p, tbimages m where p.propertyid=b.propertyid and p.propertyid = m.propertyid and p.availability='Yes' and m.DefaultValue = 'Yes' " + res;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                string query = "select * from tbproperty p, tbimages m where p.propertyid = m.propertyid and m.defaultValue='Yes' " + res;

                DataTable dtbl = new DataTable();

                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(dtbl);
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                //string query = "select * from tbproperty p, tbrpeoperty r where p.propertyid=r.propertyid";
                //SqlCommand cmd = new SqlCommand(query, sqlCon);
                //cmd.ExecuteNonQuery();
            }
        }

        protected void btnAddIssue_Click(object sender, EventArgs e)
        {
            string path, name;
            if(fpIssueImage.HasFiles)
            {
                 name = fpIssueImage.FileName;
                fpIssueImage.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + name);
                 path = "~/images/" + name;

                

                dao.addIssue(Convert.ToInt32(txtPropertyid.Text), txtName.Text, path, txtDescription.Text, txtDate.Text, Convert.ToInt32(customerid), "No");
                lblMessage.Text = "The issue has been added";

                string body = "<h1> Hello "+ firstname + "</h1> <br/>";
                body += "<br/>This is to inform you that we have received the issue for the property with property ID '" + txtPropertyid.Text + "'";
                body += "<br/> Admin has been informed and would be in contact within 7-14 business days";

                string body2 = "<h1>Hi Admin</h1>";
                body2 += "<br/> A new issue <b>" + txtName.Text + " </b> has been receieved for the property with property Id <b>" + txtPropertyid.Text + "</b>.";
                body2 += "<br/> The Issue was added on <b>" + txtDate.Text + " </b> and should be solved within 7-14 business days. ";
                body2 += "<br/> Please contact the associated tradespersons to get the issue solved";

                try
                {
                    MailMessage message = new MailMessage();
                    message.To.Add(customerEmail);
                    message.From = new MailAddress("aastha2150@gmail.com");
                    message.Subject = "We received your issue!";
                    message.Body = body;
                    message.IsBodyHtml = true;                  
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential nc = new NetworkCredential();
                    nc.UserName = "aastha2150@gmail.com";
                    nc.Password = "Goyal0412aastha";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = nc;
                    smtp.Port = 587;
                    smtp.Send(message);

                    MailMessage msg = new MailMessage();
                    msg.To.Add("aastha2150@gmail.com");//company email would be added
                    msg.From = new MailAddress("aastha2150@gmail.com");
                    msg.Subject = "New Issue Received!";
                    msg.Body = body2;
                    msg.IsBodyHtml = true;
                    SmtpClient smtp2 = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential ncc = new NetworkCredential();
                    ncc.UserName = "aastha2150@gmail.com";
                    ncc.Password = "Goyal0412aastha";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = ncc;
                    smtp.Port = 587;
                    smtp.Send(msg);


                    lblMessage.Text = "We have received the issue and would be in contact soon.";
                }
                catch(Exception ex)
                {
                    lblMessage.Text = "Error occurred " + ex.Message;
                }

              
            }
            else
            {
                lblMessage.Text = "Issue photo is required";
            }
        }
    }
}