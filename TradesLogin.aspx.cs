using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        string tradespersonid, usertype, firstname;
        int issueid;
        DataAccessLayer dao = new DataAccessLayer();
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            // HttpCookie reqCookies = Request.Cookies["UserLogin"];
            if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserLogin"];
                tradespersonid = cookie["TradespersonId"];
                usertype = cookie["UserType"];
                firstname = cookie["FirstName"];
                this.Master.profileName = "Welcome " + usertype + " " + firstname;
                this.Master.loginName = "Logout";

            }
            //else
            //{
            //    lblMessage.Text = "There are no allocated issues to you yet";
            //}

            TextBox1.Text = tradespersonid;

            //    tradespersonid = Convert.ToInt32(Request.QueryString["tradespersonid"]);


            loadGridview();


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            issueid = Convert.ToInt32(row.Cells[1].Text);
            Label1.Text = row.Cells[1].Text;
            //  txtissueid.Text =  row.Cells[1].Text;

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (fuSolved.HasFiles)
                {
                    string imgName = fuSolved.FileName;
                    fuSolved.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + imgName);
                    string imgPath = "/images/" + imgName;

                    //    txtissueid.Text = imgPath;
                   dao.addSolvedPhoto(imgPath, Convert.ToInt32(Label1.Text));
                    lblMessage.Text = "The solved issue has been added";
                    loadGridview();

                    sendCustomerEmail(Convert.ToInt32(Label1.Text));
                    sendAdminEmail(Convert.ToInt32(Label1.Text), Convert.ToInt32(tradespersonid));
                    //string body = "Hi Admin";
                    //body += "<br/> The issue with Id <b> " + issueid + "</b> has been solved by the tradesperson <b> " + tradespersonid + "</b>.";
                    //body += "<br/> Please login to see the details."

                    //try
                    //{
                    //    MailMessage message = new MailMessage();
                    //    message.To.Add("aastha2150@gmail.com");//comoany email id
                    //    message.From = new MailAddress("aastha2150@gmail.com");
                    //    message.Subject = "Issue " + issueid + " Solved";
                    //    message.Body = body;
                    //    message.IsBodyHtml = true;
                    //    SmtpClient client = new SmtpClient("smtp.gmail.com");
                    //    client.Send(message);
                    //}
                    //catch (Exception ex)
                    //{
                    //    lblMessage.Text = "Error in sending email " + ex.Message;
                    //}
                }
                else
                {
                    lblMessage.Text = "No image selected";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error " + ex.Message;
            }

        }

        public void sendCustomerEmail(int issueid)
        {
            string customerEmail = "", name = "", issueName = "";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query2 = "select emailid, firstName from tbperson where personid =(select personid from tbcustomer where customerid =(select customerid from tbissues where issueid ='" + issueid + "'))";
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                SqlDataReader reader = cmd2.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        customerEmail = reader.GetString(0);
                        name = reader.GetString(1);
                    }
                }
                reader.Close();
                string query3 = "select issueName from tbissues where issueid ='" + issueid + "'";
                SqlCommand cmd3 = new SqlCommand(query3, conn);
                issueName = cmd3.ExecuteScalar().ToString();

            }

            MailMessage message = new MailMessage();
            message.To.Add(customerEmail);
            message.From = new MailAddress("aastha2150@gmail.com");
            message.Subject = "The Property issue added by you has been resolved!";
            message.Body = string.Format("<h1> Hi {0} </h1> <br/> The issue <b> {1} </b> assigned by you has been resolved. Please login to the website to see the details", name, issueName);
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


        }


        public void sendAdminEmail(int issueid, int propertyid)
        {
            MailMessage message = new MailMessage();
            message.To.Add("aastha2150@gmail.com");//company email id
            message.From = new MailAddress("aastha2150@gmail.com");
            message.Subject = "We received your issue!";
            message.Body = string.Format("Hi Admin, <br/> A solved Issue photo has been added of the issue with issueid <b> {0} </b> by tradesperson with id <b> {1} </b>. Please login the website to see the details.", issueid, propertyid);
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
        }

        public void loadGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from   tbproperty p, tbissues s where p.propertyid = s.propertyid and s.tradespersonid = '" + tradespersonid + "' ", sqlCon);
                sqlDa.Fill(dtbl);
            }

            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }

}