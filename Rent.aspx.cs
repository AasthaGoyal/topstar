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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string res;

        string city;
        int cityId;
        List<int> weeklyrent = new List<int>();
        List<int> price = new List<int>();

        string  incity, indistrict, insuburb;
        string bed, bath, park;
        string inaddress, type, status, image;
        int inarea, inbed, inbath, inpark;
        decimal inprice;

        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;


        protected void txtBedrooms_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtBathrooms_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtParking_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtSuburb_TextChanged(object sender, EventArgs e)
        {
            
           
        }

        DataAccessLayer dao = new DataAccessLayer();

        protected void dpDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            
           
        }

        protected void dpPriceFrom_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            

          
        }

        protected void dpCity_SelectedIndexChanged(object sender, EventArgs e)
        {

            city = dpCity.SelectedItem.Text;
            cityId = dao.returnCityid(city);

           

            TextBox1.Text = cityId.ToString();
            
        }

       


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();

            if (txtBedrooms.Text.Length != 0)
            {
          
                bed = "and noOfbedrooms='" + Convert.ToInt32(txtBedrooms.Text) + "'";
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
            

            if (dpPriceFrom.SelectedItem.Text != "Any" )
                
            {
                string pricestr = "and Rweekly >= '" + dpPriceFrom.SelectedItem.Value + "'";
                sb.Append(pricestr);
                
            }

            if(dpPriceTo.SelectedItem.Text != "Any")
            {
                string priceto = "and Rweekly <= '" + dpPriceTo.SelectedItem.Value + "'";
                sb.Append(priceto);
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
            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            //    string query = "select p.streetNo, p.streetName, p.district, p.suburb, p.city, p.noOfBedrooms, p.noOfBathrooms, p.parking, p.type, p.area, r.Reeekly, r.furnishedStatus, m.imagePath  from tbproperty p, tbrproperty r, tbimages m where p.propertyid = r.propertyid and p.propertyid = m.propertyid and p.availability='Yes' and m.DefaultValue = 'Yes' " + res;

            //    SqlCommand cmd = new SqlCommand(query, conn);
            //    SqlDataReader reader = cmd.ExecuteReader();

            //    if (reader.HasRows)
            //    {
            //        while (reader.HasRows)
            //        {
            //            inaddress = reader.GetString(0) + "," + reader.GetString(1) + "," + reader.GetString(2) + "," + reader.GetString(3) + "," + reader.GetString(4);
            //            inbed = reader.GetInt32(5);
            //            inbath = reader.GetInt32(6);
            //            inpark = reader.GetInt32(7);
            //            type = reader.GetString(8);
            //            inarea = reader.GetInt32(9);
            //            inprice = reader.GetDecimal(10);
            //            status = reader.GetString(11);
            //            image = reader.GetString(12);

            //        }
            //    }

            //    lbladdress.Text = inaddress;
            //    lblbath.Text = inbath.ToString();
            //    lblbed.Text = inbed.ToString();
            //    lblpark.Text = inpark.ToString();
            //    lblprice.Text = inprice.ToString();
            //    lblstatus.Text = status;
            //    lbltype.Text = type;
            //    lblarea.Text = inarea.ToString();
            //    Image1.ImageUrl = image;

            string query = "select * from tbproperty p, tbrproperty r, tbimages m where p.propertyid=r.propertyid and p.propertyid = m.propertyid and m.DefaultValue = 'Yes' " + res;

            DataTable dtbl = new DataTable();

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlDataAdapter sqlDa = new SqlDataAdapter(query, sqlCon);
                sqlDa.Fill(dtbl);
                //string query = "select * from tbproperty p, tbrpeoperty r where p.propertyid=r.propertyid";
                //SqlCommand cmd = new SqlCommand(query, sqlCon);
                //cmd.ExecuteNonQuery();
            }
            DataList.DataSource = dtbl;
            DataList.DataBind();
        }
                // lblQuery.Text = "select * from tbproperty p, tbrproperty r where p.propertyid=r.propertyid " + res;
               



        
    }
}