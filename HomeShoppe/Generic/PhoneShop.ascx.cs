using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;
namespace HomeShoppe.Page.Client.Generic
{
    public partial class PhoneShop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra menutop
            Conn.Open();
            string query_PhoneShop = @"select SDT from ThongTinCuaHang";
            SqlCommand exec_PhoneShop = new SqlCommand(query_PhoneShop, Conn);
            SqlDataReader render_PhoneShop = exec_PhoneShop.ExecuteReader();
            while (render_PhoneShop.Read())
            {
                LtPhoneShop.Text = render_PhoneShop["SDT"].ToString();
            }
            Conn.Close();
        }
    }
}