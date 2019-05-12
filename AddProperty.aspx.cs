using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

namespace Topstar
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        DataAccessLayer dao = new DataAccessLayer();
        

        string furnishedStatus, type, special;
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
        }

        protected void rbPromotion_TextChanged(object sender, EventArgs e)
        {
            if (rbPromotion.SelectedItem.ToString() == "Yes")
            {
                txtspecialPrice.Enabled = true;
                special = "Yes";
            }
            else
            {
                txtspecialPrice.Enabled = false;
                special = "No";
            }
        }

        protected void rbPromotion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rbPromotion.SelectedItem.ToString() == "Yes")
            {
                txtspecialPrice.Enabled = true;
                special = "Yes";
            }
            else
            {
                txtspecialPrice.Enabled = false;
                special = "No";
            }
        }

        protected void txtcity_TextChanged(object sender, EventArgs e)
        {

        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
             type = dpType.SelectedItem.ToString();
            if (type == "Buy")
            {
                RentPanel.Visible = false;
                BuyPanel.Visible = true;
            
                
            }
            else if (type == "Rent")
            {
                RentPanel.Visible = true;
                BuyPanel.Visible = false;
            

            }

           
        }

 


        protected void btnAddProperty_Click(object sender, EventArgs e)
        {
            type = dpType.SelectedItem.ToString();
            if (type == "Rent")
            {
                lblMessage.Text = "Rent reaching";
                furnishedStatus = rbFurnishedStatus.SelectedItem.ToString();

                int propertyid = dao.Addrentproperty(Convert.ToInt32(txtStreetNo.Text), txtStreetName.Text, txtSuburb.Text, txtCity.Text, Convert.ToInt32(txtNoOfBedrooms.Text), Convert.ToInt32(txtNoOfBathroonms.Text), Convert.ToInt32(txtParking.Text), rbAvailability.SelectedItem.Text, dpPropertyType.SelectedValue.ToString(), txtDescription.Text,Convert.ToDecimal(txtPrice.Text) , furnishedStatus, txtDistrict.Text, Convert.ToInt32(txtarea.Text), special, Convert.ToDecimal(txtspecialPrice.Text));
                DirectoryInfo di = Directory.CreateDirectory("E:/Topstar/Topstar/Topstar/images/" + propertyid);

                string filePath = Server.MapPath("~/images/" + propertyid + "/");
                HttpFileCollection uploadedFiles = Request.Files;


                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];

                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {

                            userPostedFile.SaveAs(filePath + Path.GetFileName(userPostedFile.FileName));
                            //string imgPath = filePath + Path.GetFileName(userPostedFile.FileName);
                            string imgPath = "~/images/" + propertyid + "/" + userPostedFile.FileName;
                            string imgName = userPostedFile.FileName;
                            if (i == 0)
                            {
                                dao.addImages(imgName, imgPath, propertyid, "Yes");
                            }
                            else
                            {
                                dao.addImages(imgName, imgPath,propertyid,  "No");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message.ToString();

                    }
                }

                lblMessage.Text = "The property was added successfully";

            }
            else if (type == "Buy")
            {

                lblMessage.Text = "Buy reachine";
                int propertyid2 = dao.Addbuyproperty(Convert.ToInt32(txtStreetNo.Text), txtStreetName.Text, txtSuburb.Text, txtCity.Text, Convert.ToInt32(txtNoOfBedrooms.Text), Convert.ToInt32(txtNoOfBathroonms.Text), Convert.ToInt32(txtParking.Text), rbAvailability.SelectedItem.Text, dpPropertyType.SelectedValue.ToString(), txtDescription.Text, Convert.ToInt32(txtPrice.Text), txtDistrict.Text, Convert.ToInt32(txtarea.Text), special, Convert.ToDecimal(txtspecialPrice.Text));
                DirectoryInfo di = Directory.CreateDirectory("E:/Topstar/Topstar/Topstar/images/" + propertyid2);

                string filePath = Server.MapPath("~/images/" + propertyid2 + "/");
                HttpFileCollection uploadedFiles = Request.Files;


                for (int i = 0; i < uploadedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = uploadedFiles[i];
                    try
                    {
                        if (userPostedFile.ContentLength > 0)
                        {

                            userPostedFile.SaveAs(filePath + Path.GetFileName(userPostedFile.FileName));
                            string imgPath = "~/images/" + propertyid2 + "/" + userPostedFile.FileName;
                            string imgName = userPostedFile.FileName;
                            if (i == 1)
                            {
                                dao.addImages(imgName, imgPath, propertyid2, "Yes");
                            }
                            else
                            {
                                dao.addImages(imgName, imgPath, propertyid2, "No");
                            }

                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.Message.ToString();

                    }
                }

                lblMessage.Text = "The property was added successfully";

            }
        }

    }


    }
