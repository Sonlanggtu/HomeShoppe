using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe.Page.Client.ProductCategoryHome
{
    public partial class PCNew : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/san-pham-moi?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra New Product
            Conn.Open();
            string ProductNew = null;
            string query_ProductNew = @"select SanPham.ID as IDSanPham, TenSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, Gia,
                        GiaKhuyenMai, Url, NgayTao from SanPham , DanhMucSanPham 
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID 
                        and ( year(NgayTao) = YEAR(GETDATE())) and (TrangThai = 1) ";
            SqlCommand exec_ProductNew = new SqlCommand(query_ProductNew, Conn);
            SqlDataReader render_ProductNew = exec_ProductNew.ExecuteReader();
            while (render_ProductNew.Read())
            {
                string ProductNew_TenSanPham = render_ProductNew["TenSanPham"].ToString();
                string ProductNew_DinhDanh = render_ProductNew["DinhDanhSP"].ToString();
                string ProductNew_HinhAnh = render_ProductNew["HinhAnh"].ToString();
                string ProductNew_Gia = render_ProductNew["Gia"].ToString();
                string ProductNew_GiaKhuyenMai = render_ProductNew["GiaKhuyenMai"].ToString();
                string ProductNew_Url = render_ProductNew["Url"].ToString();
                int ProductNew_IDSanPham = Convert.ToInt32(render_ProductNew["IDSanPham"]);

                ProductNew += "<div class='grid_1_of_4 images_1_of_4'>";
                ProductNew += "<a href='/productdetail?productcategory=" + ProductNew_Url + "&product=" + ProductNew_DinhDanh + "'>";
                ProductNew += "<img src='" + ProductNew_HinhAnh + "' width='212px' height='212px'/></a>";
                ProductNew += "<h2>" + ProductNew_TenSanPham + "</h2>";
                ProductNew += "<div class='price-details'>";
                ProductNew += "<div class='price-number'>";
                ProductNew += "<p>";
                if (ProductNew_GiaKhuyenMai != "")
                {
                    ProductNew += "<span class='rupees'>" + ProductNew_GiaKhuyenMai + "đ</span>";
                    ProductNew += "<span class='sale'>" + ProductNew_Gia + " đ</span>";

                }
                else
                {
                    ProductNew += "<span class='rupees'>" + ProductNew_Gia + "đ</span>";
                }
                ProductNew += "</p>";
                ProductNew += "</div>";
                ProductNew += "<div class='add-cart'>";
                ProductNew += "<a href='/gio-hang?productID=" + ProductNew_IDSanPham + "&quantity=" + 1 + "'>Thêm vào giỏ</a>";
                ProductNew += "</div>";
                ProductNew += "<div class='clear'></div>";
                ProductNew += "</div>";
                ProductNew += "</div>";
            }
            LtProductNew.Text = ProductNew;
            Conn.Close();

        }
    }
}