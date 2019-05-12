using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm14 : System.Web.UI.Page
    {

        string userType;
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
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
            userType = dpType.SelectedItem.ToString();
            if (userType == "Tradesperson")
            {
                pnTradesperson.Visible = true;
                pnAgent.Visible = false;
                PopulateGridview();
                gdView.Visible = true;
                gdAgent.Visible = false;
                gdAdmin.Visible = false;
            

            }
            else if (userType == "Agent")
            {
                pnTradesperson.Visible = false;
                pnAgent.Visible = true;
                PopulateGdagent();
                gdView.Visible = false;
                gdAgent.Visible = true;
                gdAdmin.Visible = false;

            }
            else if (userType == "Admin")
            {

                pnTradesperson.Visible = false;
                pnAgent.Visible = false;
                PopulateGdadmin();
                gdView.Visible = false;
                gdAgent.Visible = false;
                gdAdmin.Visible = true;



            }

        }

        public void PopulateGridview()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from tbperson p, tbtradesperson t where p.personId = t.personId", sqlCon);
                sqlDa.Fill(dtbl);
            }
            gdView.DataSource = dtbl;
            gdView.DataBind();
        }

        public void PopulateGdagent()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from tbperson p, tbagent a where p.personId = a.personId", sqlCon);
                sqlDa.Fill(dtbl);
            }
            gdAgent.DataSource = dtbl;
            gdAgent.DataBind();
        }

        public void PopulateGdadmin()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from tbperson p, tbadmin a where p.personId = a.personId", sqlCon);
                sqlDa.Fill(dtbl);
            }
            gdAdmin.DataSource = dtbl;
            gdAdmin.DataBind();
        }


            protected void btnUpdate_Click(object sender, EventArgs e)
             {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();

                    if(userType == "Tradesperson")
                    {
                        string query2 = "Update tbperson SET lastName='" + txtLastname.Text + "' , firstName = '" + txtFirstname.Text + "', phoneNo='" + txtPhoneno.Text + "', username='" + txtUsername.Text + "', emailid='" + txtEmailid.Text + "' , perAddress='" + txtAddress.Text + "' WHERE personid='" + txtpersonid.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                        cmd1.ExecuteNonQuery();


                        string query = "Update tbtradesperson SET tradespersonType = '" + txtTradesType.Text + "', cname ='" + txtCname.Text + "', cphone='" + txtCphoneno.Text + "', caddress='" + txtCAddress.Text + "' where personid=' " + txtpersonid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();

                        PopulateGridview();
                        lblMessage.Text = "Tradesperson modified";
                        foreach (var obj in Page.Controls.OfType<TextBox>())
                        {
                            obj.Text = "";
                        }

                    }
                  
                    else if(userType == "Agent")
                    {
                        string query2 = "Update tbperson SET lastName='" + txtLastname.Text + "' , firstName = '" + txtFirstname.Text + "', phoneNo='" + txtPhoneno.Text + "', username='" + txtUsername.Text + "', emailid='" + txtEmailid.Text + "' , perAddress='" + txtAddress.Text + "' WHERE personid='" + txtpersonid.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                        cmd1.ExecuteNonQuery();


                        string query = "Update tbagent SET position = '" + txtPosition.Text + "', department ='" + txtDepartment.Text + "', extentionNo='" + txtExtensionid.Text + "' where personid=' " + txtpersonid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();
                        PopulateGdagent();
                        lblMessage.Text = "Agent modified";
                    }
                    else if(userType == "Admin")
                    {
                        string query2 = "Update tbperson SET lastName='" + txtLastname.Text + "' , firstName = '" + txtFirstname.Text + "', phoneNo='" + txtPhoneno.Text + "', username='" + txtUsername.Text + "', emailid='" + txtEmailid.Text + "' , perAddress='" + txtAddress.Text + "' WHERE personid='" + txtpersonid.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                        cmd1.ExecuteNonQuery();

                        PopulateGdadmin();

                        lblMessage.Text = "Agent modified";
                    }

                    

                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "error" + ex.Message;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();

                    if(userType == "Tradesperson")
                    {
                        string query2 = "delete * from tbtradesperson where personid='" + txtpersonid.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                        cmd1.ExecuteNonQuery();

                        string query = "delete * from  tbperson where personid ='" + txtpersonid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();


                        lblMessage.Text = "Tradesperson deleted";
                        foreach (var obj in Page.Controls.OfType<TextBox>())
                        {
                            obj.Text = "";
                        }
                    }
                    else if(userType == "Agent")
                    {
                        string query2 = "delete * from tbagent where personid='" + txtpersonid.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                        cmd1.ExecuteNonQuery();

                        string query = "delete * from  tbperson where personid ='" + txtpersonid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();


                        lblMessage.Text = "Agent deleted";
                    }
                    else if(userType == "Admin")
                    {
                        string query2 = "delete * from tbadmin where personid='" + txtpersonid.Text + "'";
                        SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                        cmd1.ExecuteNonQuery();

                        string query = "delete * from  tbperson where personid ='" + txtpersonid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();


                        lblMessage.Text = "Admin deleted";
                    }
                   

                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "error" + ex.Message;
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            userType = dpType.SelectedItem.ToString();
        }

        protected void gdView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gdView.SelectedRow;

            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.
            lblMessage.Text = "You selected " + row.Cells[1].Text + ".";
            txtpersonid.Text = row.Cells[1].Text;
            txtLastname.Text = row.Cells[2].Text;
            txtFirstname.Text = row.Cells[3].Text;
            txtPhoneno.Text = row.Cells[4].Text;
            txtUsername.Text = row.Cells[5].Text;
            txtEmailid.Text = row.Cells[6].Text;
            txtAddress.Text = row.Cells[7].Text;
            txtTradesType.Text = row.Cells[8].Text;
            txtCname.Text = row.Cells[9].Text;
            txtCphoneno.Text = row.Cells[10].Text;
            txtCAddress.Text = row.Cells[11].Text;

        }

        protected void gdAgent_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gdAgent.SelectedRow;

            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.
            lblMessage.Text = "You selected " + row.Cells[1].Text + ".";
            txtpersonid.Text = row.Cells[1].Text;
            txtLastname.Text = row.Cells[2].Text;
            txtFirstname.Text = row.Cells[3].Text;
            txtPhoneno.Text = row.Cells[4].Text;
            txtUsername.Text = row.Cells[5].Text;
            txtEmailid.Text = row.Cells[6].Text;
            txtAddress.Text = row.Cells[7].Text;
            txtPosition.Text = row.Cells[8].Text;
            txtDepartment.Text = row.Cells[9].Text;
            txtExtensionid.Text = row.Cells[10].Text;
          

        }

        protected void gdAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gdAdmin.SelectedRow;

            // Display the first name from the selected row.
            // In this example, the third column (index 2) contains
            // the first name.
            lblMessage.Text = "You selected " + row.Cells[1].Text + ".";
            txtpersonid.Text = row.Cells[1].Text;
            txtLastname.Text = row.Cells[2].Text;
            txtFirstname.Text = row.Cells[3].Text;
            txtPhoneno.Text = row.Cells[4].Text;
            txtUsername.Text = row.Cells[5].Text;
            txtEmailid.Text = row.Cells[6].Text;
            txtAddress.Text = row.Cells[7].Text;
            

        }
    }
}