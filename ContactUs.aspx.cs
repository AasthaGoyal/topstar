using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtname.Text;
            string emailid = txtEmail.Text;
            string mess = txtMessage.Text;

        

            try
            {
                 

                    MailMessage mm = new MailMessage("aastha2150@gmail.com", txtEmail.Text);
                    mm.Subject = "New Query Received !";
                mm.Body = string.Format("Hi there, <br> A new query has been received by customer " + name + " with email id" + emailid + ". <br/> '" + mess + "'");

               
                mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential nc = new NetworkCredential();
                    nc.UserName = "aastha2150@gmail.com";
                    nc.Password = "Goyal0412aastha";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = nc;
                    smtp.Port = 587;
                    smtp.Send(mm);


             
                lblMessage.Text = "We have received your query and would be in contact shortly";

            }
            catch (Exception ex)
            {
                lblMessage.Text = "Some error occured" + ex.ToString();
            }

        }
    }
}