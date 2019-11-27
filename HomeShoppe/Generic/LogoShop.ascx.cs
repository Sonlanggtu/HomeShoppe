using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client.Generic
{
    public partial class LogoShop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string query_Logo = @"select Logo from ThongTinCuaHang";
            SqlCommand exec_Logo = new SqlCommand(query_Logo, Conn);
            SqlDataReader render_Logo = exec_Logo.ExecuteReader();
            while (render_Logo.Read())
            {
                LtLogo.Text = render_Logo["Logo"].ToString();
            }
            Conn.Close();
        }
    }
}