using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
        string res;  
        List<int> weeklyrent = new List<int>();
        List<int> price = new List<int>();

        string incity, indistrict, insuburb;
        string bed, bath, park;
        string propertyType;
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

            propertyType = DropDownList1.SelectedItem.ToString();

            if (propertyType == "Buy")
            {
                lblPrice.Text = "Price range";
                dpPriceFrom.Visible = false;
                dpPriceFrom0.Visible = true;

                dpPriceTo.Visible = false;
                dpPriceTo0.Visible = true;

                pnBuy.Visible = true;
                pnRent.Visible = false;

            }
            else if (propertyType == "Rent")
            {
                lblPrice.Text = "Weekly rent";
                dpPriceFrom.Visible = true;
                dpPriceFrom0.Visible = false;

                dpPriceTo.Visible = true;
                dpPriceTo0.Visible = false;

                pnBuy.Visible = false;
                pnRent.Visible = true;

            }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            txtpropertyid.Text = row.Cells[1].Text;
            txtStreetNo.Text = row.Cells[2].Text;
            txtStreetName.Text = row.Cells[3].Text;
            txtSuburb.Text = row.Cells[4].Text;
            dpDistrict.SelectedItem.Text = row.Cells[5].Text;
            dpCity.SelectedItem.Text = row.Cells[6].Text;
            txtBedrooms.Text = row.Cells[7].Text;
            txtBathrooms.Text = row.Cells[8].Text;
            txtParking.Text = row.Cells[9].Text;
            rdAvailability.ClearSelection();
            rdAvailability.Items.FindByText(row.Cells[10].Text).Selected = true;
          //  txtAvailable.Text = row.Cells[10].Text + "," + row.Cells[14].Text;
            dpType.SelectedItem.Value = row.Cells[10].Text;
            txtDescription.Text = row.Cells[12].Text;
            
            txtPrice.Text = row.Cells[13].Text;
            rbFurnished.ClearSelection();
            rbFurnished.Items.FindByText(row.Cells[14].Text).Selected = true;

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            txtpropertyid.Text = row.Cells[1].Text;
            txtStreetNo.Text = row.Cells[2].Text;
            txtStreetName.Text = row.Cells[3].Text;
            txtSuburb.Text = row.Cells[4].Text;
            dpDistrict.SelectedItem.Text = row.Cells[5].Text;
            dpCity.SelectedItem.Text = row.Cells[6].Text;
            txtBedrooms.Text = row.Cells[7].Text;
            txtBathrooms.Text = row.Cells[8].Text;
            txtParking.Text = row.Cells[9].Text;
            rdAvailability.ClearSelection();
            rdAvailability.Items.FindByText(row.Cells[10].Text).Selected = true;
          //  txtAvailable.Text = row.Cells[10].Text + "," + row.Cells[14].Text;
            dpType.SelectedItem.Text = row.Cells[10].Text;
            txtDescription.Text = row.Cells[12].Text;

            txtBuyPrice.Text = row.Cells[13].Text;
            rdPromotion.ClearSelection();
            rdPromotion.Items.FindByText(row.Cells[14].Text).Selected = true;
            txtspecialPrice.Text = row.Cells[15].Text;
            txtarea.Text = row.Cells[16].Text;

        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void dpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            string city = dpCity.SelectedItem.ToString();
            int cityId = dao.returnCityid(city);
            TextBox1.Text = cityId.ToString();

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    if(propertyType == "Rent")
                    {
                        sqlCon.Open();
                        string query = "update  tbproperty set streetNo ='" + txtStreetNo.Text + "',streetName='" + txtStreetName.Text + "',suburb='" + txtSuburb.Text + "',district='" + dpDistrict.SelectedItem.Text + "',city='" + dpCity.SelectedItem.Text + "',noOfBedrooms='" + Convert.ToInt32(txtBedrooms.Text) + "',noOfBathrooms ='" + Convert.ToInt32(txtBathrooms.Text) + "',parking='" + Convert.ToInt32(txtParking.Text) + "',type='" + dpType.SelectedItem.Text + "',description='" + txtDescription.Text + "',area='" + Convert.ToInt32(txtarea.Text) + "', special='" + rdPromotion.SelectedItem.Text + "',specialPrice='" + Convert.ToDecimal(txtspecialPrice.Text) + "' where propertyid ='" + Convert.ToInt32(txtpropertyid.Text) + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();

                        string query2 = "update tbrproperty set Rweekly='" + Convert.ToDecimal(txtPrice.Text) + "', furnishedStatus='" + rbFurnished.SelectedItem.Text + "' where propertyid ='" + Convert.ToInt32(txtpropertyid.Text) + "'";
                        SqlCommand cmd2 = new SqlCommand(query2, sqlCon);
                        cmd2.ExecuteNonQuery();

                        gdRent();
                        lblMessage.Text = "Property successfully updated";
                    }
                    else
                    {
                        sqlCon.Open();
                        string query = "update  tbproperty set streetNo ='" + txtStreetNo.Text + "',streetName='" + txtStreetName.Text + "',suburb='" + txtSuburb.Text + "',district='" + dpDistrict.SelectedItem.Text + "',city='" + dpCity.SelectedItem.Text + "',noOfBedrooms='" + Convert.ToInt32(txtBedrooms.Text) + "',noOfBathrooms ='" + Convert.ToInt32(txtBathrooms.Text) + "',parking='" + Convert.ToInt32(txtParking.Text) + "',type='" + dpType.SelectedItem.Text + "',description='" + txtDescription.Text + "',area='" + Convert.ToInt32(txtarea.Text) + "', special='" + rdPromotion.SelectedItem.Text + "',specialPrice='" + Convert.ToDecimal(txtspecialPrice.Text) + "' where propertyid ='" + Convert.ToInt32(txtpropertyid.Text) + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();

                        string query2 = "update tbbproperty set price='" + Convert.ToDecimal(txtBuyPrice.Text) + "' where propertyid ='" + Convert.ToInt32(txtpropertyid.Text) + "'";
                        SqlCommand cmd2 = new SqlCommand(query2, sqlCon);
                        cmd2.ExecuteNonQuery();

                        gdBuy();
                        lblMessage.Text = "Property successfully updated";
                    }

                }
               
            }
            catch(Exception ex)
            {
                lblMessage.Text = "Error" + ex.Message;
            }
        }

        public void gdRent()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from tbproperty p, tbrproperty r where p.propertyid=r.propertyid" + res, sqlCon);
                sqlDa.Fill(dtbl);
            }
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }

      

        public void gdBuy()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("select * from tbproperty p, tbbproperty b where p.propertyid=b.propertyid" + res, sqlCon);
                sqlDa.Fill(dtbl);
            }
            GridView2.DataSource = dtbl;
            GridView2.DataBind();
        }



        protected void btnSold_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    if(propertyType == "Rent")
                    {
                        sqlCon.Open();
                        string query = "update tbproperty set availability='Sold' where propertyid ='" + txtpropertyid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();

                        string query2 = "insert into tbhistory values('" + txtpropertyid.Text + "')";
                        SqlCommand cmd2 = new SqlCommand(query2, sqlCon);
                        cmd2.ExecuteNonQuery();

                        gdRent();
                        lblMessage.Text = "Property sold ";
                    }
                    else
                    {
                        sqlCon.Open();
                        string query = "update tbproperty set availability='No' where propertyid ='" + txtpropertyid.Text + "'";
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        cmd.ExecuteNonQuery();

                        string query2 = "insert into tbhistory values('" + txtpropertyid.Text + "')";
                        SqlCommand cmd2 = new SqlCommand(query2, sqlCon);
                        cmd2.ExecuteNonQuery();

                        gdBuy();
                        lblMessage.Text = "Property sold ";
                    }
                   

                }
                
                
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error" + ex.Message;
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            propertyType = DropDownList1.SelectedItem.ToString();

            
            if (propertyType == "Buy")
            {
                lblPrice.Text = "Price range";
                dpPriceFrom.Visible = false;
                dpPriceFrom0.Visible = true;

                dpPriceTo.Visible = false;
                dpPriceTo0.Visible = true;

            }
            else if (propertyType == "Rent")
            {
                lblPrice.Text = "Weekly rent";
                dpPriceFrom.Visible = true;
                dpPriceFrom0.Visible = false;

                dpPriceTo.Visible = true;
                dpPriceTo0.Visible = false;

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (txtBedrooms.Text.Length != 0)
            {

                bed = "and noOfBedrooms='" + Convert.ToInt32(txtBedrooms.Text) + "'";
                sb.Append(bed);
            }

            if (txtBathrooms.Text.Length != 0)
            {

                bath = "and noOfBathrooms='" + Convert.ToInt32(txtBathrooms.Text) + "'";
                sb.Append(bath);
            }


            if (txtParking.Text.Length != 0)
            {

                park = "and parking ='" + Convert.ToInt32(txtParking.Text) + "'";
                sb.Append(park);
            }

            if (txtSuburb.Text.Length != 0)
            {
                insuburb = "and suburb ='" + txtSuburb.Text + "'";
                sb.Append(insuburb);
            }


            if (dpPriceFrom.SelectedItem.Text != "Any")

            {
                if(propertyType == "Rent")
                {
                    string pricestr = "and Rweekly >= '" + dpPriceFrom.SelectedItem.Value + "'";
                    sb.Append(pricestr);
                }
                else
                {
                    string pricestr = "and price >= '" + dpPriceFrom.SelectedItem.Value + "'";
                    sb.Append(pricestr);
                }
                

            }

            if (dpPriceTo.SelectedItem.Text != "Any")
            {
                if(propertyType == "Rent")
                {
                    string priceto = "and Rweekly <= '" + dpPriceTo.SelectedItem.Value + "'";
                    sb.Append(priceto);
                }
                else
                {
                    string priceto = "and price <= '" + dpPriceTo.SelectedItem.Value + "'";
                    sb.Append(priceto);
                }
               
            }




            if (dpCity.SelectedItem.Text != "All New Zealand")
            {

                incity = "and city ='" + dpCity.SelectedItem.Value.ToString() + "'";
                sb.Append(incity);
            }

            if (dpDistrict.SelectedItem.Text != "All Districts")
            {

                indistrict = "and district='" + dpDistrict.SelectedItem.Value.ToString() + "'";
                sb.Append(indistrict);
            }

            res = sb.ToString();

            // lblQuery.Text = "select * from tbproperty p, tbrproperty r where p.propertyid=r.propertyid " + res;
           // string query = "select * from tbproperty p, tbrproperty r, tbimages m where p.propertyid=r.propertyid and p.propertyid = m.propertyid and p.availability='Yes' and m.DefaultValue = 'Yes' " + res;

            

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                if(propertyType == "Rent")
                {
                    DataTable dtbl = new DataTable();
                    string qu = "select * from tbproperty p, tbrproperty r where p.propertyid = r.propertyid" + res;
                    SqlDataAdapter sqlDa = new SqlDataAdapter(qu, sqlCon);
                    sqlDa.Fill(dtbl);
                    GridView2.Visible = false;
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();

                }
                else if(propertyType == "Buy")
                {
                    DataTable tbl = new DataTable();
                    string quu = "select * from tbproperty p, tbbproperty b where p.propertyid=b.propertyid" + res;
                    SqlDataAdapter sqlDa = new SqlDataAdapter(quu, sqlCon);
                    sqlDa.Fill(tbl);
                    GridView1.Visible = false;
                    GridView2.DataSource = tbl;
                    GridView2.DataBind();
                }
               
               
            }
            

        }
    }
}