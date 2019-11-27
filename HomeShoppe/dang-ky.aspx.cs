using HomeShoppe.DataBaseConection;
using System;
using System.Data;
using System.Data.SqlClient;

namespace HomeShoppe
{
    public partial class dang_ky : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string UserName = Request.Form["Username"];
            string Email = Request.Form["Email"];
            string Password = Request.Form["Password"];
            string ConfirmPassword = Request.Form["ConfirmPassword"];
            if (IsPostBack)
            {
                if (UserName != null)
                {
                    // day vao csdl
                    ConnectString ConnectionString = new ConnectString();
                    SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                    Conn.Open();
                    if (Password != ConfirmPassword)
                    {
                        LbThongBao.Visible = true;
                        LbThongBao.Text = "Mật khẩu không khớp";
                    }
                    else
                    {
                        SqlCommand insertAccount = new SqlCommand("AccountRegister", Conn);
                        insertAccount.CommandType = CommandType.StoredProcedure;
                        insertAccount.Parameters.Add(new SqlParameter("@TenTaiKhoan", UserName));
                        insertAccount.Parameters.Add(new SqlParameter("@Email", Email));
                        insertAccount.Parameters.Add(new SqlParameter("@Password", Password));
                        insertAccount.ExecuteNonQuery();
                        LbThongBao.Text = "Bạn đã đăng ký tài khoản thành công!";
                        
                    }
                    Conn.Close();
                }
            }

            

        }
    }
}