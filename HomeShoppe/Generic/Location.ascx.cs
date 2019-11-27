using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Generic
{
    public partial class Location : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string query_Location = @"select Vitri from ThongTinCuaHang";
            SqlCommand exec_Location = new SqlCommand(query_Location, Conn);
            SqlDataReader render_Location = exec_Location.ExecuteReader();
            while (render_Location.Read())
            {
                LtLocation.Text = render_Location["ViTri"].ToString();
            }
            Conn.Close();
        }
    }
}