using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe
{
    public partial class ti_viv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra New Product
            Conn.Open();
            string Tivi = null;
            string query_Tivi = @"select TenSanPham, SanPham.DinhDanh as DinhDanhSP,HinhAnh ,
                        Gia, GiaKhuyenMai, Url  from SanPham, DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                        and (IDDanhMucSanPham = 4) and (TrangThai = 1)";
            SqlCommand exec_Tivi = new SqlCommand(query_Tivi, Conn);
            SqlDataReader render_Tivi = exec_Tivi.ExecuteReader();
            while (render_Tivi.Read())
            {
                string Tivi_TenSanPham = render_Tivi["TenSanPham"].ToString();
                string Tivi_DinhDanh = render_Tivi["DinhDanhSP"].ToString();
                string Tivi_HinhAnh = render_Tivi["HinhAnh"].ToString();
                string Tivi_Gia = render_Tivi["Gia"].ToString();
                string Tivi_GiaKhuyenMai = render_Tivi["GiaKhuyenMai"].ToString();
                string Tivi_Url = render_Tivi["Url"].ToString();

                Tivi += "<div class='grid_1_of_4 images_1_of_4'>";
                Tivi += "<a href='" + Tivi_Url + '/' + Tivi_DinhDanh + "'>";
                Tivi += "<img src='" + Tivi_HinhAnh + "' width='212px' height='212px'/></a>";
                Tivi += "<h2>" + Tivi_TenSanPham + "</h2>";
                Tivi += "<div class='price-details'>";
                Tivi += "<div class='price-number'>";
                Tivi += "<p>";
                Tivi += "<span class='rupees'>" + Tivi_Gia + "đ</span>";
                if (Tivi_GiaKhuyenMai != "")
                {
                    Tivi += "<span class='sale'>" + Tivi_GiaKhuyenMai + " đ</span>";
                }
                Tivi += "</p>";
                Tivi += "</div>";
                Tivi += "<div class='add-cart'>";
                Tivi += "<a href='http:/google.com'>Thêm vào giỏ</a>";
                Tivi += "</div>";
                Tivi += "<div class='clear'></div>";
                Tivi += "</div>";
                Tivi += "</div>";
            }
            LtProductCategpryTiVi.Text = Tivi;
            Conn.Close();
        }
    }
}