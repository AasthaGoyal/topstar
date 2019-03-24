using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;


namespace Topstar
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       //byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string input = TextBox1.Text;

            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
                StringBuilder buidler = new StringBuilder();
                for(int i=0;i<bytes.Length;i++)
                {
                    buidler.Append(bytes[i].ToString("x2"));
                }
                TextBox2.Text = buidler.ToString();
            }
        }
    }
}