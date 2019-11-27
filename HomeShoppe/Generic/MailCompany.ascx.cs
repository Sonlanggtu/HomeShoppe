using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Generic
{
    public partial class MailCompany : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string query_EmailCompany = @"select Email from ThongTinCuaHang";
            SqlCommand exec_EmailCompany = new SqlCommand(query_EmailCompany, Conn);
            SqlDataReader render_EmailCompany = exec_EmailCompany.ExecuteReader();
            while (render_EmailCompany.Read())
            {
                LtMailCompany.Text = render_EmailCompany["Email"].ToString();
            }
            Conn.Close();
        }
    }
}