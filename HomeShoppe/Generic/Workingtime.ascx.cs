using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe.Generic
{
    public partial class Workingtime : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string query_Worktime = @"select ThoiGianLamViec from ThongTinCuaHang";
            SqlCommand exec_Worktime = new SqlCommand(query_Worktime, Conn);
            SqlDataReader render_Worktime = exec_Worktime.ExecuteReader();
            while (render_Worktime.Read())
            {
                LtWorkingtime.Text = render_Worktime["ThoiGianLamViec"].ToString();
            }
            Conn.Close();
        }
    }
}