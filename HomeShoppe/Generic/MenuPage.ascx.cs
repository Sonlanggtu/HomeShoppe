using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client
{
    public partial class MenuPage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string menuPage = null;
            string query_menuPage = @"select TenTrang, URL from Menus where GroupID = 1 and TrangThai = 1";
            SqlCommand exec_menuPage = new SqlCommand(query_menuPage, Conn);
            SqlDataReader render_menuPage = exec_menuPage.ExecuteReader();
            while (render_menuPage.Read())
            {
                string MenuPage_TenTrang = render_menuPage["TenTrang"].ToString();
                string MenuPage_Url = render_menuPage["URL"].ToString();
                menuPage += "<li class='li_MenuPage'><a href='" + MenuPage_Url + "'>" + MenuPage_TenTrang + "</a></li>";
            }
            LtMenuPage.Text = menuPage;
            Conn.Close();
        }
    }
}