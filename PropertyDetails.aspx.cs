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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;

        int propertyid;
        int id;
        string address, description, Type, status;
        int bath, bed, parking;
        decimal price;

        protected void Page_Load(object sender, EventArgs e)
        {
            propertyid = Convert.ToInt32(Request.QueryString["propertyid"]);
            if (!IsPostBack)
            {
                SetImageUrl();
            }

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                //    string checkRent = "select exists(select * from tbrproperty where propertyid ='" + propertyid + "')";
                //SqlCommand cmd = new SqlCommand(checkRent, sqlCon);
                //    int countRent = Convert.ToInt32(cmd.ExecuteScalar());

                //    string checkBuy = "select exists(select * from tbbproperty where propertyid ='" + propertyid + "')";
                //    SqlCommand cmd2 = new SqlCommand(checkBuy, sqlCon);
                //    int countBuy = Convert.ToInt32(cmd.ExecuteScalar());

                //    if(countRent != 0 && countBuy == 0)
                //    {
                string query = "select p.propertyid, p.streetNo, p.streetName, p.suburb, p.district, p.city, p.noOfBedrooms, p.noOfBathrooms, p.parking, p.type, p.description,p.area, p.special , p.specialPrice, p.availability, r.Rweekly from tbproperty p, tbrproperty r, tbimages m where p.propertyid=r.propertyid and p.propertyid = m.propertyid and m.DefaultValue = 'Yes' and p.propertyid='" + propertyid + "'";
                SqlCommand cmd = new SqlCommand(query, sqlCon);

                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.HasRows)
                {
                    while(reader.Read())
                    {
                        propertyid = reader.GetInt32(0);
                        address = reader.GetString(1) + "," + reader.GetString(2) + "," + reader.GetString(3) + "," + reader.GetString(4) + "," + reader.GetString(5);
                        bed = reader.GetInt32(6);
                        bath = reader.GetInt32(7);
                        parking = reader.GetInt32(8);
                        Type = reader.GetString(9);
                        description = reader.GetString(10);
                        int area = reader.GetInt32(11);

                        price = reader.GetDecimal(15);
                        status = reader.GetString(14);
                    }
                }

                lbladdress.Text =  address;
                lblRent.Text = "$" + price.ToString() + "/Week";
                lblbed.Text =  bed.ToString();
                lblbath.Text = bath.ToString();
                lblparking.Text = parking.ToString();
                lbltype.Text = Type;
                lblFurnished.Text = status;
                lbldesc.Text = description;

               

                //}
                //else if (countBuy != 0 && countRent == 0)
                //{


            }


        }



      

        public void SetImageUrl()
        {
            DataSet ds = new DataSet();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "select imagePath, imageid, name from tbimages where propertyid = " + propertyid;
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds, "image");

                string query2 = "select imageid from tbimages where propertyid = " + propertyid + " and defaultValue='Yes'";
                SqlCommand cmd2 = new SqlCommand(query2, con);
                id = Convert.ToInt32(cmd2.ExecuteScalar());

                ViewState["ImageData"] = ds;
                ViewState["ImageDisplayed"] = id;
            }


            DataRow imageDataRow = ds.Tables["image"].Select().FirstOrDefault(x => x["imageid"].ToString() == id.ToString());
            
            Image1.ImageUrl = imageDataRow["imagePath"].ToString();
           
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            int i = (int)ViewState["ImageDisplayed"];
            i = i + 1;
            ViewState["ImageDisplayed"] = i;

            DataRow imageDataRow = ((DataSet)ViewState["ImageData"]).Tables["image"].Select().FirstOrDefault(x => x["imageid"].ToString() == i.ToString());
            if (imageDataRow != null)
            {
                Image1.ImageUrl = imageDataRow["imagePath"].ToString();
                
            }
            else
            {
                SetImageUrl();
            }


        }




    }
}