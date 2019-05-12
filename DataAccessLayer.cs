using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.SessionState;

namespace Topstar
{
    public class DataAccessLayer
    {
        public SqlConnection connection = null;
        String connectionString = null;


        public void openConnection()
        {
            connectionString = ConfigurationManager.ConnectionStrings["dbtopstarConnectionString"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        public void AddPanelIems(string logo, string companyName, string address, int phoneNo, string nav, string aboutus)
        {
            openConnection();

            String query = "insert into tbPanel values ('" +logo + "','" + companyName + "','" + address + "','" + phoneNo + "','" + nav +"','" + aboutus + "')";

            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();


        }

        public void resetPassword(string emailid, string password)
        {
            openConnection();

            string query = "update tbperson set perPassword ='" + password + "' where emailid ='" + emailid + "'";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
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
            connection.Close();
            return cityid;

        }

        public void addImages(string imgName, string imgPath, int propertyid, string defaultValue)
        {
            openConnection();

            string addImages = "insert into tbimages(name, imagePath, propertyid, defaultValue) values('" + imgName + "','" + imgPath + "','" + propertyid + "','" + defaultValue + "')";
            SqlCommand cmd4 = new SqlCommand(addImages, connection);
            cmd4.ExecuteNonQuery();
        }

        public List<String> returnTradespersons()
        {
            openConnection();

            string query = "select p.firstName, t.tradespersontype from tbperson p, tbtradesperson t where p.personid = t.personid";
            SqlCommand cmd = new SqlCommand(query, connection);
            string result="";
       

            List<String> names = new List<String>();
            SqlDataReader reader = cmd.ExecuteReader();

            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    result = reader.GetString(0) + "-" + reader.GetString(1);
                  
                    names.Add(result);
                }
            }
            else
            {
                result = "No rows found";
            }
            reader.Close();
            return names;
          

           
        }

        public int addTradespersonid(string name, string type, int issueid)
        {
            openConnection();

            string query = "select t.tradespersonid from tbperson p, tbtradesperson t where p.firstName = '" + name + "' and t.tradespersonType ='" + type + "'";
            SqlCommand cmd = new SqlCommand(query, connection);

            int tradespersonid = Convert.ToInt32(cmd.ExecuteScalar());
           
            string query2 = "update tbissues set tradespersonid= '" + tradespersonid + "' where issueid ='" + issueid + "'";
            SqlCommand cmd2 = new SqlCommand(query2, connection);
            cmd2.ExecuteNonQuery();

            connection.Close();
            return tradespersonid;

        }

        public int Addrentproperty(int streetNo, string streetname, string suburb, string city, int bedrooms, int bathrooms, int parking, string availability, string type, string description, decimal weeklyrent, string furnished, string district, int area, string special, decimal specialPrice)
        {
            openConnection();

            string query = " insert into tbproperty values ('" + streetNo + "','" + streetname + "','" + suburb + "',' " + city + "','" + bathrooms + "','" + bathrooms + "','" + parking + "','" + availability + "','" + type + "','" + description + "','" + district + "','" + area + "','" + special + "','" + specialPrice + "')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();

            string getPropertyid = "select propertyid from tbproperty where streetNo ='" + streetNo + "' and streetName = '" + streetname + "'";
            SqlCommand cmd2 = new SqlCommand(getPropertyid, connection);
            int propertyid = Convert.ToInt32(cmd2.ExecuteScalar());

            string addrentproperty = "insert into tbrproperty(propertyid , Rweekly, furnishedstatus) values ('" + propertyid + "','" + weeklyrent + "','" + furnished + "')";
            SqlCommand cmd3 = new SqlCommand(addrentproperty, connection);
            cmd3.ExecuteNonQuery();

            return propertyid;


        }

        public void addSolvedPhoto(string path, int issueid)
        {
            openConnection();

            string query = "update tbissues set solvedPhoto ='" + path + "',solved='Yes' where issueid ='" + issueid + "'";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();

            connection.Close();
           
       

        }

        public int Addbuyproperty(int streetNo, string streetname, string suburb, string city, int bedrooms, int bathrooms, int parking, string availability, string type, string description, decimal price, string district, int area, string special, decimal specialPrice)
        {
            openConnection();

            string query = " insert into tbproperty values ('" + streetNo + "','" + streetname + "','" + suburb + "',' " + city + "','" + bathrooms + "','" + bathrooms + "','" + parking + "','" + availability + "','" + type + "','" + description + "','" + district + "','" + area + "','" + special + "','" + specialPrice + "')";
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

        public void addIssue(int propertyid, string name, string image, string description, string dateTime, int customerid, string status)
        {
            openConnection();

            string query = "insert into tbissues(propertyid, issueDate, issueDescription, issueName, issuePhoto, customerid, solved) values ('" + propertyid + "','" + dateTime + "','" + description + "','" + name + "','" + image + "','" + customerid + "','" + status +"')";
            SqlCommand cmd = new SqlCommand(query, connection);
            cmd.ExecuteNonQuery();
        }

        public void changeStatus(int issueid)
        {
            openConnection();

            string query = "update tbissues set solved='Yes' where issueid='" + issueid + "'";
            SqlCommand cmd = new SqlCommand(query, connection);

            cmd.ExecuteNonQuery();
            
        }
        public string userLogin(string username, string perPassword)
        {
            openConnection();

            //string quary = "SELECT COUNT(1) FROM tbperson where (username='" + username + "' AND perPassword = '" + perPassword + "')";


            String quary = "select usertype, firstName from tbperson where username ='" +
                 username + "'and perPassword= '" + perPassword + "'";

            SqlCommand command = new SqlCommand(quary, connection);
            SqlDataReader reader = command.ExecuteReader();
            string profileName="";

            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    profileName = reader.GetString(0) + " " + reader.GetString(1) ;
                }
            }
            
            connection.Close();
            return profileName;    


        }

        public int getCustomerid(string username, string password)
        {
            openConnection();

            string query = "select p.personid from tbperson p, tbcustomer c where p.username = '" + username + "' and p.perPassword='" + password + "'";
            SqlCommand cmd = new SqlCommand(query, connection);

            int id = Convert.ToInt32(cmd.ExecuteScalar());

            string query2 = "select customerid from tbcustomer where personid ='" + id + "'";
            SqlCommand cmd2 = new SqlCommand(query2, connection);
            int custId = Convert.ToInt32(cmd2.ExecuteScalar());

            return custId;
        }

        public int getid(string field, string table, int personid)
        {
            openConnection();

            string query = "select " + field+ " from " + table + " where personId ='" + personid + "'";
            SqlCommand cmd = new SqlCommand(query, connection);

            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }

        
        public object getCustomeremailid(int customerid)
        {
            openConnection();

            string query = "select p.emailid from tbperson p, tbcustomer c where p.personid = c.personid and c.customerid ='" + customerid + "'";
            SqlCommand cmd = new SqlCommand(query, connection);
            return  cmd.ExecuteScalar();
 
           
        }

        public void userRegister(string lastName, string firstName, string phoneNo, string perpassword, string username, string emailid, string perAddress)
        {

            openConnection();

            String quary = "insert into tbperson values('" +
                lastName + "','" +
                firstName + "','" +
                phoneNo + "','" +
                perpassword + "','" +
                username + "','Customer','" +  emailid + "','" +
                perAddress + "') select @@identity";

            SqlCommand command = new SqlCommand(quary, connection);

            int personid  = Convert.ToInt32(command.ExecuteScalar());

            string query2 = "insert into tbcustomer values ('" + personid + "' )";
            SqlCommand cmd = new SqlCommand(query2, connection);
           
            cmd.ExecuteNonQuery();
         



        }

    }
}