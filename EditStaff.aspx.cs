using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace Topstar
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        string userType;
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
           

        protected void Page_Load(object sender, EventArgs e)
        {
            userType = dpType.SelectedItem.ToString();
            if(!IsPostBack)
            {
                PopulateGdadmin();
                PopulateGdagent();
                PopulateGridview();

            }
         
            //if (!IsPostBack)
            //{
            //    if (userType == "Tradesperson")
            //    {
            //        lblMessage.Text = "Tradesperson reaching";
            //       // PopulateGridview();
            //    }
            //    else if (userType == "Agent")
            //    {
            //        PopulateGdagent();
            //    }
            //    else if (userType == "Agent")
            //    {
            //        PopulateGdadmin();
            //    }


            //}
           
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            userType = dpType.SelectedItem.ToString();

            if(userType == "Tradesperson")
            {
                //gdView.Visible = true;
            }
            else if(userType == "Agent")
            {
              
                gdAgent.Visible = true;
            }
            else if(userType == "Admin")
            {
                gdAgent.Visible = true;
                
            }
        }

        protected void gdView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();
                     string query2 = "Update tbperson SET lastName=@lastname , firstName = @firstname, phoneNo=@phoneNo, username=@username, userType=@usertype , emailid=@emailid , perAddress=@address WHERE personid=@personid";
                 //   string query2 = "select personId from tbperson WHERE personId=@personid";
                    SqlCommand cmd1 = new SqlCommand(query2, sqlCon);


                    cmd1.Parameters.AddWithValue("@lastname", (gdView.Rows[e.RowIndex].FindControl("lastName") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@firstname", (gdView.Rows[e.RowIndex].FindControl("firstName") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@phoneNo", (gdView.Rows[e.RowIndex].FindControl("phoneNo") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@username", (gdView.Rows[e.RowIndex].FindControl("username") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@usertype", (gdView.Rows[e.RowIndex].FindControl("userType") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@emailid", (gdView.Rows[e.RowIndex].FindControl("emailid") as TextBox).Text.Trim());
                    cmd1.Parameters.AddWithValue("@address", (gdView.Rows[e.RowIndex].FindControl("perAddress") as TextBox).Text.Trim());
                    //     cmd1.Parameters.AddWithValue("@personid", (gdView.Rows[e.RowIndex].FindControl("personId") as TextBox).Text.Trim());

                    cmd1.Parameters.AddWithValue("@personid", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    int value = Convert.ToInt32(cmd1.ExecuteScalar());


                    string query = "Update tbtradesperson SET tradespersonType = @type, cname =@cname, cphone=@cphone, caddress=@caddress WHERE personid=@id ";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);
                    cmd.Parameters.AddWithValue("@type", (gdView.Rows[e.RowIndex].FindControl("tradespersonType") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@cname", (gdView.Rows[e.RowIndex].FindControl("cname") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@cphone", (gdView.Rows[e.RowIndex].FindControl("cphone") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@caddress", (gdView.Rows[e.RowIndex].FindControl("caddress") as TextBox).Text.Trim());
                    //    cmd1.Parameters.AddWithValue("@id", (gdView.Rows[e.RowIndex].FindControl("personId") as TextBox).Text.Trim());

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    gdView.EditIndex = -1;

                    lblMessage.Text = value + "Value added";


                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error " + ex.Message;
            }
        }

        protected void gdView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdView.EditIndex = e.NewEditIndex;
            PopulateGridview();
        }

        protected void gdView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdView.EditIndex = -1;
            PopulateGridview();
        }

        protected void gdView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();

                    string query = "delete from tbtradesperson  WHERE personid=@id ";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                    string query2 = "delete from tbperson  WHERE personid=@personid";
                    SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                    cmd1.Parameters.AddWithValue("@personid", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd1.ExecuteNonQuery();


                   
                   // gdView.EditIndex = -1;

                    PopulateGridview();
                    lblMessage.Text = "The data was deleted successfully";


                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error " + ex.Message;
            }
        }

        protected void gdAgent_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();

                    string query = "delete from tbagent  WHERE personid=@id ";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                    string query2 = "delete from tbperson  WHERE personid=@personid";
                    SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                    cmd1.Parameters.AddWithValue("@personid", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd1.ExecuteNonQuery();



                    // gdView.EditIndex = -1;

                    PopulateGridview();
                    lblMessage.Text = "The data was deleted successfully";


                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error " + ex.Message;
            }
        }

        protected void gdAgent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void gdAgent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdAgent.EditIndex = e.NewEditIndex;
            PopulateGdagent();
        }

        protected void gdAgent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdAgent.EditIndex = -1;
            PopulateGdagent();

        }

        protected void gdAdmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {

                    sqlCon.Open();

                    string query = "delete from tbadmin  WHERE personid=@id ";
                    SqlCommand cmd = new SqlCommand(query, sqlCon);

                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();

                    string query2 = "delete from tbperson  WHERE personid=@personid";
                    SqlCommand cmd1 = new SqlCommand(query2, sqlCon);

                    cmd1.Parameters.AddWithValue("@personid", Convert.ToInt32(gdView.DataKeys[e.RowIndex].Value.ToString()));
                    cmd1.ExecuteNonQuery();



                    // gdView.EditIndex = -1;

                    PopulateGridview();
                    lblMessage.Text = "The data was deleted successfully";


                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error " + ex.Message;
            }

        }

        protected void gdAdmin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //need to be done
        }

        protected void gdAdmin_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdAdmin.EditIndex = e.NewEditIndex;
            PopulateGdadmin();
        }

        protected void gdAdmin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdAgent.EditIndex = -1;
            PopulateGdadmin();
        }
    }

    

   
}