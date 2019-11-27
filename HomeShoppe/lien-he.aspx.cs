using HomeShoppe.DataBaseConection;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace HomeShoppe
{
    public partial class lien_he : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/lien-he?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            string HoTenKhachHang = Request.Form["HovaTen"];
            string EmailKhachHang = Request.Form["Email"];
            string SDTKhachHang = Request.Form["SDT"];
            string TieuDe = Request.Form["TieuDe"];
            string LoiNhanKhachHang = Request.Form["NoiDung"];

            feedback(HoTenKhachHang, EmailKhachHang, SDTKhachHang, TieuDe,LoiNhanKhachHang);
           // day vao csdl

        }

        public void feedback(string HoTenKhachHang, string EmailKhachHang, string SDTKhachHang, string TieuDe, string LoiNhanKhachHang)
        {
            // day vao csdl
            //HttpContext context = new HttpContext();

            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            if (HoTenKhachHang != null)
            {
                SqlCommand insertAccount = new SqlCommand("SendFeedback", Conn);
                insertAccount.CommandType = CommandType.StoredProcedure;
                insertAccount.Parameters.Add(new SqlParameter("@HoTenKhachHang", HoTenKhachHang));
                insertAccount.Parameters.Add(new SqlParameter("@EmailKhachHang", EmailKhachHang));
                insertAccount.Parameters.Add(new SqlParameter("@SDTKhachHang", SDTKhachHang));
                insertAccount.Parameters.Add(new SqlParameter("@TieuDe", TieuDe));
                insertAccount.Parameters.Add(new SqlParameter("@LoiNhanKhachHang", LoiNhanKhachHang));
                insertAccount.Parameters.Add(new SqlParameter("@NgayTao", DateTime.Now));
                insertAccount.ExecuteNonQuery();
                LtThongBao.Text = "Cảm ơn bạn, chúng tôi sẽ đọc ý kiến của bạn!";
                LtThongBao.Visible = true;
            }
            Conn.Close();
        }
    }
}