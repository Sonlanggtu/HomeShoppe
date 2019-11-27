using HomeShoppe.DataBaseConection;
using System;
using System.Data;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string del_session_Login = Request.QueryString["thoat"];
            
            if(del_session_Login == "exit")
            {
                Session["Quantri"] = null;
                Response.Redirect("/");
            }
            string Username = Request.Form["Username"];
            string Password = Request.Form["Password"];
            

            if (Username != null)
            {
                string stringDadangnhap = "";
                // day vao csdl
                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                SqlCommand insertAccount = new SqlCommand("Login_acconut_Admin", Conn);
                insertAccount.CommandType = CommandType.StoredProcedure;
                insertAccount.Parameters.Add(new SqlParameter("@TenTaiKhoan", Username));
                insertAccount.Parameters.Add(new SqlParameter("@PasswordMaHoa", Password));
                bool kiemtra = Convert.ToBoolean(insertAccount.ExecuteScalar());
                if (kiemtra == true)
                {
                    string destroy = "destroy";
                    Session["Quantri"] = Username;
                    stringDadangnhap += "<li class='li_menu_top_left'><a href='#'><i class='fas fa-user'>Chào " + Session["Quantri"] + ",</i></a></li>";
                    stringDadangnhap += "<li class='li_menu_top_left'><a href='/dang-nhap.aspx?session='" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                    LtDaDangNhap.Text = stringDadangnhap;
                    LbThongBao.Text = "Đăng nhập thành công";
                    LbThongBao.Visible = true;
                    Response.Redirect("/Admin/index");
                }
                else
                {
                    LbThongBao.Text = "Đăng nhập thất bại";
                    Conn.Close();
                }
                Conn.Close();
            }
           

        }
    }
}