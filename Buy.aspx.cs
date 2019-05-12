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
    public partial class WebForm15 : System.Web.UI.Page
    {
        string res;

        string city;
        int cityId;
        List<int> weeklyrent = new List<int>();
        List<int> price = new List<int>();

        string incity, indistrict, insuburb;
        string bed, bath, park;
      
        DataAccessLayer dao = new DataAccessLayer();


        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            city = dpCity.SelectedItem.ToString();
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


            if (dpPriceFrom.SelectedItem.Text != "Any")

            {
                string pricestr = "and price >= '" + dpPriceFrom.SelectedItem.Value + "'";
                sb.Append(pricestr);

            }

            if (dpPriceTo.SelectedItem.Text != "Any")
            {
                string priceto = "and price <= '" + dpPriceTo.SelectedItem.Value + "'";
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

            // lblQuery.Text = "select * from tbproperty p, tbrproperty r where p.propertyid=r.propertyid " + res;
          string query = "select * from tbproperty p, tbbproperty b, tbimages m where p.propertyid=b.propertyid and p.propertyid = m.propertyid and m.DefaultValue = 'Yes' " + res;

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
    }
}