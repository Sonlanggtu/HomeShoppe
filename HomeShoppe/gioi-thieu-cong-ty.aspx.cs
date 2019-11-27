using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client
{
    public partial class gioithieucongty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string stringDadangnhap = "";
            string getdestroy_session = Request.QueryString["session"];
            if (getdestroy_session == "destroy")
            {
                Session["KhachHang"] = null;
                ChuaDangNhap.Visible = true;
                DaDangNhap.Visible = false;
            }
            if (Session["KhachHang"] != null)
            {
                string destroy = "destroy";
                ChuaDangNhap.Visible = false;
                stringDadangnhap += "<li class='li_menu_top_left'><a href='#'><i class='fas fa-user'>Chào " + Session["KhachHang"] + ",</i></a></li>";
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/gioi-thieu-cong-ty?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            //doc ra du lieu Content Page About
            //  doc du lieu data ra footer
            Conn.Open();
            string ContentAbout = "";
            string queryContentAbout = @"select NoiDung from Pages where TenTrang = 'VeChungToi' ";
            SqlCommand exec_ContentAbout = new SqlCommand(queryContentAbout, Conn);
            SqlDataReader render_ContentAbout = exec_ContentAbout.ExecuteReader();
            while (render_ContentAbout.Read())
            {
                ContentAbout = render_ContentAbout["NoiDung"].ToString();  
            }
            LtContentPageAbout.Text = ContentAbout;
            Conn.Close();
        }
    }
}