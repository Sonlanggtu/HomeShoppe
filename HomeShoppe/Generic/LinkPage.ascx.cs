using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client.Generic
{
    public partial class LinkPage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ConnectString ConnectionString = new ConnectString();
            //SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());

            //Conn.Open();
            //string LinkPageDetail = null;
            //string query_LinkPageDetail = @"select TenTrang, URL from Menus where ";
            //SqlCommand exec_LinkPageDetail = new SqlCommand(query_LinkPageDetail, Conn);
            //SqlDataReader render_LinkPageDetail = exec_LinkPageDetail.ExecuteReader();
            //while (render_LinkPageDetail.Read())
            //{
            //    string MenuPage_TenTrang = render_LinkPageDetail["TenTrang"].ToString();
            //}
            ////LtMenuPage.Text = menuPage;
            //Conn.Close();
        }
    }
}