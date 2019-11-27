using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client
{
    public partial class MenuTop : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra menutop
            Conn.Open();
            string menutop = null;
            string query_menutop = @"select TenTrang, URL from Menus where GroupID = 2";
            SqlCommand exec_menutop = new SqlCommand(query_menutop, Conn);
            SqlDataReader render_menutop = exec_menutop.ExecuteReader();
            while (render_menutop.Read())
            {
                string MenuTop_TenTrang = render_menutop["TenTrang"].ToString();
                string MenuTop_Url = render_menutop["URL"].ToString();
                menutop += "<li class='li_menu_top_left'><a href = '" + MenuTop_Url + "'><i class='fas fa-pencil-alt'>" + MenuTop_TenTrang + "</i></a></li>";
            }
            LtMenuTop.Text = menutop;
            Conn.Close();
        }
    }
}