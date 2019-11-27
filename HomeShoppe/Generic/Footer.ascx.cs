using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client
{
    public partial class Footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            //  doc du lieu data ra footer
            Conn.Open();
            string queryFooter = @"select * from Footers where ID = 'f2' ";
            SqlCommand cmd = new SqlCommand(queryFooter, Conn);
            SqlDataReader render = cmd.ExecuteReader();
            while (render.Read())
            {
                string Footer = render["NoiDung"].ToString();
                LtFooter.Text = Footer;
            }
            Conn.Close();
        }
    }
}