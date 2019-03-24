using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Topstar
{
    public class DataAccessLayer
    {
        public SqlConnection connection = null;
        String connectionString = null;
        public int propertyid;

        public void openConnection()
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        public void AddPanelIems(string logo, string companyName, string img1, string img2, string img3, string address, int phoneNo, string nav)
        {
            openConnection();

            String query = "insert into tbPanel values ('" + img1 + "','" + img2 + "','" + img3 + "','" + logo + "','" + companyName + "','" + address + "','" + phoneNo + "','" + nav + "')";

            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();


        }


        public void AddNewNavigation(string name, string image)
        {
            openConnection();

            string query = "insert into tbnavigation values('" + name + "','" + image + "')";

            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
            connection.Close();


        }

        public int returnCityid(string city)
        {
            openConnection();

            string query = "select cityId from tbcity where city='" + city + "'";

            SqlCommand cmd = new SqlCommand(query, connection);
            int cityid = Convert.ToInt32(cmd.ExecuteScalar());

            return cityid;

        }

        public void addImages(string imgName, string imgPath, string defaultValue)
        {
            openConnection();

            string addImages = "insert into tbimages(name, imagePath, propertyid, defaultValue) values('" + imgName + "','" + imgPath + "','" + propertyid + "','" + defaultValue + "')";
            SqlCommand cmd4 = new SqlCommand(addImages, connection);
            cmd4.ExecuteNonQuery();
        }


        public int Addrentproperty(int streetNo, string streetname, string suburb, string city, int bedrooms, int bathrooms, int parking, DateTime availability, string type, string description, double weeklyrent, string furnished, string district)
        {
            openConnection();

            string query = " insert into tbproperty values ('" + streetNo + "','" + streetname + "','" + suburb + "',' " + city + "','" + bathrooms + "','" + bathrooms + "','" + parking + "','" + availability + "','" + type + "','" + description + "','" + district + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();

            string getPropertyid = "select propertyid from tbproperty where streetNo ='" + streetNo + "' and streetName = '" + streetname + "'";
            SqlCommand cmd2 = new SqlCommand(getPropertyid, connection);
            propertyid = Convert.ToInt32(cmd2.ExecuteScalar());

            string addrentproperty = "insert into tbrproperty(propertyid , Rweekly, furnishedstatus) values ('" + propertyid + "','" + weeklyrent + "','" + furnished + "')";
            SqlCommand cmd3 = new SqlCommand(addrentproperty, connection);
            cmd3.ExecuteNonQuery();

            return propertyid;


        }

        public int Addbuyproperty(int streetNo, string streetname, string suburb, string city, int bedrooms, int bathrooms, int parking, DateTime availability, string type, string description, int price, string district)
        {
            openConnection();

            string query = " insert into tbproperty values ('" + streetNo + "','" + streetname + "','" + suburb + "',' " + city + "','" + bathrooms + "','" + bathrooms + "','" + parking + "','" + availability + "','" + type + "','" + description + "','" + district + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();

            string getPropertyid = "select propertyid from tbproperty where streetNo ='" + streetNo + "' and streetName = '" + streetname + "'";
            SqlCommand cmd2 = new SqlCommand(getPropertyid, connection);
            int propertyid = Convert.ToInt32(cmd2.ExecuteScalar());

            string addrentproperty = "insert into tbbproperty(propertyid , price) values ('" + propertyid  + "','" + price + "')";
            SqlCommand cmd3 = new SqlCommand(addrentproperty, connection);
            cmd3.ExecuteNonQuery();

            return propertyid;

        }

        public void addTradesperson(string lastName, string firstName, int phoneNo, object password, string username,  object emailId, string address, string tradesType, string cname, int cphone, string caddress)
        {
            openConnection();

            string query = "insert into tbperson values('" + lastName + "','" + firstName + "','" + phoneNo + "','" + password + "','" + username + "','tradesperson','" + emailId + "','" + address + "') select @@identity";
            SqlCommand cmd = new SqlCommand(query, connection);
            int personid = Convert.ToInt32(cmd.ExecuteScalar());

            string query3 = "insert into tbtradesperson values ('" + personid + "','" + tradesType + "','" + cname + "','" + cphone + "','" + caddress + "')";
            SqlCommand cmd3 = new SqlCommand(query3, connection);
            cmd3.ExecuteNonQuery();

        }

        public void addAgent(string lastName, string firstName, int phoneNo, object password, string username, object emailId, string address,string position, string department, int extNo)
        {
            openConnection();

            string query = "insert into tbperson values('" + lastName + "','" + firstName + "','" + phoneNo + "','" + password + "','" + username + "','Agent','" + emailId + "','" + address + "') select @@identity";
            SqlCommand cmd = new SqlCommand(query, connection);
            int personid = Convert.ToInt32(cmd.ExecuteScalar());

            
           

            string query3 = "insert into tbagent(personId, position, department, extentionNo) values ('" + personid + "','" + position + "','" + department + "','" + extNo  + "')";
            SqlCommand cmd3 = new SqlCommand(query3, connection);
            cmd3.ExecuteNonQuery();

        }

        public void addAdmin(string lastName, string firstName, int phoneNo, object password, string username, object emailId, string address)
        {
            openConnection();

            string query = "insert into tbperson values('" + lastName + "','" + firstName + "','" + phoneNo + "','" + password + "','" + username + "','Admin','" + emailId + "','" + address + "') select @@identity";
            SqlCommand cmd = new SqlCommand(query, connection);
            int personid = Convert.ToInt32(cmd.ExecuteScalar());

          
            string query3 = "insert into tbadmin(personId) values ('" + personid + "')";
            SqlCommand cmd3 = new SqlCommand(query3, connection);
            cmd3.ExecuteNonQuery();

        }

        public void addIssue(int propertyid, string name, string image, string description, string dateTime)
        {
            openConnection();

            string query = "insert into tbissues(propertyid, issueDate, issueDescription, issueName, issuePhoto) values ('" + propertyid + "','" + dateTime + "','" + description + "','" + name + "','" + image + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
        }
    }
}