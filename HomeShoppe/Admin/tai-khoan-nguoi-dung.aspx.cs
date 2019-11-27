using HomeShoppe.DAO;
using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class tai_khoan_nguoi_dung : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string lock_user_client = Request.QueryString["username"];
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                if (lock_user_client != null)
                {
                    int checkbox = 3;
                    var taikhoan = new TaiKhoanDAO();
                    var getcheck = taikhoan.ViewAccount(lock_user_client).KhoaTaiKhoan;
                    if (getcheck == true)
                    {
                        checkbox = 0;
                    }
                    else
                    {
                        checkbox = 1;
                    }
                    lockUserClient(lock_user_client, checkbox);
                }
                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                string get_TaiKhoanQuanTri = "select TenTaiKhoan, Email, SoLanDangNhapSai,NgayTaiKhoanHetHan, KhoaTaiKhoan, ChucVu from TaiKhoan where XacDinhQuanTri = 0";
                SqlCommand query_TaiKhoanQuanTri = new SqlCommand(get_TaiKhoanQuanTri, Conn);
                SqlDataReader render_TaiKhoanQuanTri = query_TaiKhoanQuanTri.ExecuteReader();
                string Read_TaiKhoanQuanTri = "";
                while (render_TaiKhoanQuanTri.Read())
                {
                    int SoLanDangNhapSai = Convert.ToInt32(render_TaiKhoanQuanTri["SoLanDangNhapSai"]);
                    string TenTaiKhoan = render_TaiKhoanQuanTri["TenTaiKhoan"].ToString();
                    string Email = render_TaiKhoanQuanTri["Email"].ToString();
                    bool KhoaTaiKhoan = Convert.ToBoolean(render_TaiKhoanQuanTri["KhoaTaiKhoan"]);
                    string ChucVu = render_TaiKhoanQuanTri["ChucVu"].ToString();
                    string NgayTaiKhoanHetHan = Convert.ToString(render_TaiKhoanQuanTri["NgayTaiKhoanHetHan"]);

                    Read_TaiKhoanQuanTri += "<tr>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center' scope='row'>" + TenTaiKhoan + "</td>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center'>" + Email + "</td>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center'>" + SoLanDangNhapSai + "</td>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center'>" + NgayTaiKhoanHetHan + "</td>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center'>" + KhoaTaiKhoan + "</td>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center;'>" + ChucVu + "</td>";
                    Read_TaiKhoanQuanTri += "<td style='text-align: center;'><button class='btn btn-warning lock_account_client' type='button' name='username' data-username='" + TenTaiKhoan + "'> Lock/Unlock </ button></td>";
                    Read_TaiKhoanQuanTri += "</tr>";
                }
                LtTaiKhoanNguoiDung.Text = Read_TaiKhoanQuanTri;
                Conn.Close();
            }
            
        }

        public void lockUserClient(string lock_user_client, int checkbox)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string UpdateUserLock = @"update TaiKhoan set KhoaTaiKhoan = "+ checkbox + " where TenTaiKhoan = '"+ lock_user_client + "'";
            SqlCommand cmd_UpdateUserLock = new SqlCommand(UpdateUserLock, Conn);
            cmd_UpdateUserLock.ExecuteNonQuery();
            Conn.Close();
        }
    }
}