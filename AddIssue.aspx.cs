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
    public partial class WebForm4 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
        DateTime now;
        string customerEmail, firstName="Aashi";

        protected void Page_Load(object sender, EventArgs e)
        {
             now = DateTime.Now;
            txtDate.Text = now.ToString();
        }

        protected void txtPropertyid_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddIssue_Click(object sender, EventArgs e)
        {
            string path, name;
            if(fpIssueImage.HasFiles)
            {
                 name = fpIssueImage.FileName;
                fpIssueImage.PostedFile.SaveAs(Server.MapPath(".") + "/images/" + name);
                 path = "~/images/" + name;

                dao.addIssue(Convert.ToInt32(txtPropertyid.Text), txtName.Text, path, txtDescription.Text, txtDate.Text);
                lblMessage.Text = "The issue has been added";

                using (MailMessage mm = new MailMessage("aastha2150@gmail.com", "aastha2150@gmail.com"))
                {
                    mm.Subject = "Issue Received Confirmation";
                    string body = "Hello " + firstName + ", ";
                    body += "<br/> This is to confirm that we have received an issue from you regarding a property. We would be in contact within 7-14 business days.";
                    body += "<br/> Thank you for your request.";

                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("aastha2150@gmail.com", "Goyal0412aastha");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 465;
                    smtp.Send(mm);

                }
            }
            else
            {
                lblMessage.Text = "Issue photo is required";
            }
        }
    }
}