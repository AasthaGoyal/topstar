using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topstar
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string propertyType;
        string city;
        int cityId;
        List<int> weeklyrent = new List<int>();
        List<int> price = new List<int>();

        DataAccessLayer dao = new DataAccessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            propertyType = dpType.SelectedItem.ToString();

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

        protected void dpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            city = dpCity.SelectedItem.ToString();
            cityId = dao.returnCityid(city);

            TextBox1.Text = cityId.ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (propertyType == "Buy")
            {
                DataList.DataSourceID = "dataBuy";
            }
            else if (propertyType == "Rent")
            {

                DataList.DataSourceID = "dataRent";
            }
        }
    }
}