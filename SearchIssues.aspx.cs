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
    public partial class WebForm9 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();

        string incity, indistrict, insuburb;
        string bed, bath, park;

        string res;

        string inpropertyid;
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
        string city;
        int cityId;
        string adminid, usertype, firstname;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["UserLogin"] != null)
            {
                HttpCookie cookie = Request.Cookies["UserLogin"];
                adminid = cookie["AdminId"];
                usertype = cookie["UserType"];
                firstname = cookie["FirstName"];
                this.Master.profilename = "Welcome " + usertype + " " + firstname;
                this.Master.loginname = "Logout";

            }

            List<String> namess = new List<string>();
            namess = dao.returnTradespersons();

          for(int i=0;i<namess.Count();i++)
            {
                dpTradesperson.Items.Add(namess[i]);
            }
        }

        public void addGridViewData()
        {

        }

        protected void txtPropertyid_TextChanged(object sender, EventArgs e)
        {


        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

         


        }

        public void showId(int id)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            
        }

        public void sendTradesEmail(int tradespersonid, int issueid)
        {
            string tradesEmail="", firstname="";
            string issue="", address="";
            int propertyid=0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string query = "select emailid, firstName from tbperson where personid =(select personid from tbtradesperson where tradespersonid ='" + tradespersonid + "')";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader rd = cmd.ExecuteReader();

                if(rd.HasRows)
                {
                    while(rd.Read())
                    {
                        tradesEmail = rd.GetString(0);
                        firstname = rd.GetString(1);
                    }
                }

                rd.Close();

                string query2 = "select i.issueName, p.propertyid, p.streetNo, p.streetName, p.suburb, p.city from tbissues i, tbproperty p where i.propertyid = p.propertyid and i.tradespersonid = '" + tradespersonid + "'";
                SqlCommand cmd2 = new SqlCommand(query2, conn);
                SqlDataReader reader = cmd2.ExecuteReader();
               

                if(reader.HasRows)
                {
                   while(reader.Read())
                    {
                        issue = reader.GetString(0);
                        propertyid = reader.GetInt32(1);
                        address = reader.GetString(2) + "," + reader.GetString(3) + "," + reader.GetString(4) + "," + reader.GetString(5);

                    }
                }
                reader.Close();
               
            }
            MailMessage message = new MailMessage();
            message.To.Add(tradesEmail);
            message.From = new MailAddress("aastha2150@gmail.com");
            message.Subject = "A new Issue has been assigned to you!";
            message.Body = string.Format("<h1> Hi {0} </h1> <br/> You have been assigned a new issue <b> {1} </b> of the property with property id <b> {2} </b> situated at <b> {3} </b>. <br/> Please login to the website to see the details",firstname,issue, propertyid, address);
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

        protected void dpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            city = dpCity.SelectedItem.ToString();
            cityId = dao.returnCityid(city);

            txtinput.Text = cityId.ToString();
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
                string query = "select * from tbissues s, tbproperty p where p.propertyid = s.propertyid " + res;

                DataTable dtbl = new DataTable();

                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(dtbl);
                GridView1.DataSource = dtbl;
                GridView1.DataBind();
                //string query = "select * from tbproperty p, tbrpeoperty r where p.propertyid=r.propertyid";
                //SqlCommand cmd = new SqlCommand(query, sqlCon);
                //cmd.ExecuteNonQuery();
            }
            dpTradesperson.Visible = true;
            btnSelect.Visible = true;

        }

        public void sendAdminEmail(int issueid)
        {
            MailMessage message = new MailMessage();
            message.To.Add("aastha2150@gmail.com");//company email id
            message.From = new MailAddress("aastha2150@gmail.com");
            message.Subject = "We received your issue!";
            message.Body = string.Format("Hi Admin, <br/> A solved Issue photo has been added of the issue with issueid <b> {0} </b>. Please login the website to see the details.", issueid);
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

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            
            StringBuilder sb = new StringBuilder();
            int tradespersonid;
            string name="", type="";
            List<string> issueids = new List<string>();

            foreach (GridViewRow item in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)item.FindControl("cbselect");
                if (chk.Checked)
                {
                   
                    sb.Append(GridView1.DataKeys[item.RowIndex].Value);
                    issueids.Add(GridView1.DataKeys[item.RowIndex].Value.ToString());
                }

               
            }
       

            string input = dpTradesperson.SelectedItem.ToString();
            string[] tnames = new string[2];
            tnames = input.Split('-');

            for (int i = 0; i < 2; i++)
            {
                name = tnames[0];
                type = tnames[1];
            }

            try
            {
                foreach (string item in issueids)
                {

                  tradespersonid =  dao.addTradespersonid(name, type, Convert.ToInt32(item));
                    dao.changeStatus(Convert.ToInt32(item));
                    sendTradesEmail(tradespersonid, Convert.ToInt32(item));
                   
                   
                }

                //email to admin
                

                lblMessage.Text = "The tradesperson has been succesfully infomed about the issue.";

            }
            catch(Exception ex)
            {
                lblMessage.Text = "Error occurred " + ex.Message;
            }










        }
    }
}