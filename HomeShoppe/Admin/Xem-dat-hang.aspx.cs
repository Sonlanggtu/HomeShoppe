using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class Xem_dat_hang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                string queryDonHang = "select IDDatHang, TenSanPham , ChiTietDatHang.Gia as Gia_CTDatHang, SoLuong from ChiTietDatHang, SanPham where ChiTietDatHang.IDSanPham = SanPham.ID";
                SqlCommand cmDatHang = new SqlCommand(queryDonHang, Conn);
                SqlDataReader reader_DonHang = cmDatHang.ExecuteReader();
                string DocHoaDon = "";
                while (reader_DonHang.Read())
                {
                    int IDDatHang = Convert.ToInt32(reader_DonHang["IDDatHang"]);
                    string TenSanPham = reader_DonHang["TenSanPham"].ToString();
                    decimal Gia_CTDatHang = Convert.ToDecimal(reader_DonHang["Gia_CTDatHang"]);
                    int SoLuong = Convert.ToInt32(reader_DonHang["SoLuong"]);

                    DocHoaDon += "<tr>";
                    DocHoaDon += "<td style='text-align: center'>" + IDDatHang + "</td>";
                    DocHoaDon += "<td style='text-align: center'>" + TenSanPham + "</td>";
                    DocHoaDon += "<td style='text-align: center'>" + Gia_CTDatHang + "</td>";
                    DocHoaDon += "<td style='text-align: center'>" + SoLuong + "</td>";
                    DocHoaDon += "</tr> ";
                }
                LtDatHang.Text = DocHoaDon;
                Conn.Close();
                // Tinh Hoa Don

                Conn.Open();
                string queryDonHang2 = "select IDDatHang,SUM(Gia*SoLuong) as TongTienDonHang from ChiTietDatHang group by IDDatHang order by IDDatHang";
                SqlCommand cmDatHang2 = new SqlCommand(queryDonHang2, Conn);
                SqlDataReader reader_DonHang2 = cmDatHang2.ExecuteReader();
                string DocHoaDon2 = "";
                while (reader_DonHang2.Read())
                {
                    int IDDatHang = Convert.ToInt32(reader_DonHang2["IDDatHang"]);
                    decimal TongTienDonHang = Convert.ToDecimal(reader_DonHang2["TongTienDonHang"]);
                    DocHoaDon2 += "<tr>";
                    DocHoaDon2 += "<td style='text-align: center'>Đơn Hàng: " + IDDatHang + " - " + TongTienDonHang + " đ</td>";
                    DocHoaDon2 += "</tr> ";
                }
                LtTinhHoaDon.Text = DocHoaDon2;
                Conn.Close();

                // Tinh Tong tien tat ca phieu hang
                Conn.Open();
                string TongTienTatCaHoaDon = "";
                string queryDonHang3 = "select sum(SoLuong*Gia) as TongTienBanDuoc from ChiTietDatHang";
                SqlCommand cmDatHang3 = new SqlCommand(queryDonHang3, Conn);
                SqlDataReader reader_DonHang3 = cmDatHang3.ExecuteReader();
                while (reader_DonHang3.Read())
                {
                    decimal TongTienBanDuoc = Convert.ToDecimal(reader_DonHang3["TongTienBanDuoc"]);
                    TongTienTatCaHoaDon += "<tr>";
                    TongTienTatCaHoaDon += "<td style='text-align: center'>Tổng tiền của tất đơn hàng : " + TongTienBanDuoc + "</td>";
                    TongTienTatCaHoaDon += "</tr> ";
                }

                LTTongTienTatHoaDon.Text = TongTienTatCaHoaDon;
                Conn.Close();
            }
           
        }
    }
}