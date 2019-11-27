using HomeShoppe.DataBaseConection;
using System;
using System.Data;
using System.Data.SqlClient;

namespace HomeShoppe
{
    public partial class dang_nhap : System.Web.UI.Page
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
            if (Session["KhachHang"] == null)
            {
                ChuaDangNhap.Visible = true;
                DaDangNhap.Visible = false;

                // kiem tra dang nhap
                string UserName = Request.Form["UserName"];
                string Password = Request.Form["Password"];

                // day vao csdl
                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                if (UserName != null)
                {
                    SqlCommand insertAccount = new SqlCommand("Login_acconut", Conn);
                    insertAccount.CommandType = CommandType.StoredProcedure;
                    insertAccount.Parameters.Add(new SqlParameter("@TenTaiKhoan", UserName));
                    insertAccount.Parameters.Add(new SqlParameter("@PasswordMaHoa", Password));
                    bool kiemtra = Convert.ToBoolean(insertAccount.ExecuteScalar());
                    if (kiemtra == true)
                    {
                        string destroy = "destroy";
                        Session.Timeout = 6020;
                        Session["KhachHang"] = UserName;
                        ChuaDangNhap.Visible = false;
                        stringDadangnhap += "<li class='li_menu_top_left'><a href='#'><i class='fas fa-user'>Chào " + Session["KhachHang"] + ",</i></a></li>";
                        stringDadangnhap += "<li class='li_menu_top_left'><a href='/dang-nhap.aspx?session='" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                        LtDaDangNhap.Text = stringDadangnhap;
                        DaDangNhap.Visible = true;
                        LbThongBao.Text = "Đăng nhập thành công";
                        Response.Redirect("/");
                    }
                    else
                    {
                        LbThongBao.Text = "Đăng nhập thất bại";
                        Conn.Close();
                    }
                }
                Conn.Close();
            }
            else
            {
                string destroy = "destroy";
                ChuaDangNhap.Visible = false;
                DaDangNhap.Visible = true;
                stringDadangnhap += "<li class='li_menu_top_left'><a href='#'><i class='fas fa-user'>Chào " + Session["KhachHang"] + ",</i></a></li>";
                stringDadangnhap += "<li class='li_menu_top_left'><a href='dang-nhap?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
            }
        }
    }
}