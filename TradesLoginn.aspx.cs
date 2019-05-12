using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        string tradespersonid, usertype, firstname;
        int issueid;
        DataAccessLayer dao = new DataAccessLayer();
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
           // HttpCookie reqCookies = Request.Cookies["UserLogin"];
            if(HttpContext.Current.Request.Cookies["UserLogin"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserLogin"];
                tradespersonid = cookie["TradespersonId"];
                usertype = cookie["UserType"];
                firstname = cookie["FirstName"];
                this.Master.profileName = "Welcome " + usertype + " " + firstname;
                this.Master.loginName = "Logout";
               
            }
            else
            {
                lblMessage.Text = "There are no allocated issues to you yet";
            }

            TextBox1.Text = tradespersonid;

      

           loadGridview();


        }

       
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            issueid = Convert.ToInt32(row.Cells[1].Text);

            
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
                    dao.addSolvedPhoto(imgPath, issueid);
                    lblMessage.Text = "The solved issue has been added";
                    loadGridview();

                    string body = "Hi there";
                    body += "<br/> The issue with Id " + issueid + "has been solved by the tradesperson " + tradespersonid + ".";

                    try
                    {
                        MailMessage message = new MailMessage();
                        message.To.Add("aastha2150@gmail.com");
                        message.From = new MailAddress("aastha2150@gmail.com");
                        message.Subject = "Issue " + issueid + " Solved";
                        message.Body = body;
                        message.IsBodyHtml = true;
                        SmtpClient client = new SmtpClient("smtp.gmail.com");
                        client.Send(message);
                    }
                    catch(Exception ex)
                    {
                        lblMessage.Text = "Error in sending email " + ex.Message;
                    }

                }
                else
                {
                    lblMessage.Text = "No image selected";
                }
            }
            catch(Exception ex)
            {
                lblMessage.Text = "Error " + ex.Message;
            }
            
        }

        public void loadGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from   tbproperty p, tbissues s where p.propertyid = s.propertyid and s.tradespersonid = '" + tradespersonid+ "' ", sqlCon);
                sqlDa.Fill(dtbl);
            }
            
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }
}