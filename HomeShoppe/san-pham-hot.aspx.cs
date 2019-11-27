using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client.ProductCategoryHome
{
    public partial class PCHot : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/san-pham-hot?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc du lieu HotProduct
            Conn.Open();
            string ProductHot = null;
            // 12 sp co luot xem nhieu nhat
            string query_ProductHot = @"select Top 12 SanPham.ID as IDSanPham, TenSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, Gia, DemLuotXem
                        ,GiaKhuyenMai, Url from SanPham , DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                         and (TrangThai = 1) order by DemLuotXem desc";
            SqlCommand exec_ProductHot = new SqlCommand(query_ProductHot, Conn);
            SqlDataReader render_ProductHot = exec_ProductHot.ExecuteReader();
            while (render_ProductHot.Read())
            {
                string ProductHot_TenSanPham = render_ProductHot["TenSanPham"].ToString();
                string ProductHot_DinhDanh = render_ProductHot["DinhDanhSP"].ToString();
                string ProductHot_HinhAnh = render_ProductHot["HinhAnh"].ToString();
                string ProductHot_Gia = render_ProductHot["Gia"].ToString();
                string ProductHot_GiaKhuyenMai = render_ProductHot["GiaKhuyenMai"].ToString();
                string ProductHot_Url = render_ProductHot["Url"].ToString();
                int ProductHot_IDSanPham = Convert.ToInt32(render_ProductHot["IDSanPham"]);

                ProductHot += "<div class='grid_1_of_4 images_1_of_4'>";
                ProductHot += "<a href='/productdetail?productcategory=" + ProductHot_Url + "&product=" + ProductHot_DinhDanh + "'>";
                ProductHot += "<img src='" + ProductHot_HinhAnh + "' width='212px' height='212px'/></a>";
                ProductHot += "<h2>" + ProductHot_TenSanPham + "</h2>";
                ProductHot += "<div class='price-details'>";
                ProductHot += "<div class='price-number'>";
                ProductHot += "<p>";
                if (ProductHot_GiaKhuyenMai != "")
                {
                    ProductHot += "<span class='rupees'>" + ProductHot_GiaKhuyenMai + "đ</span>";
                    ProductHot += "<span class='sale'>" + ProductHot_Gia + " đ</span>";
                }
                else
                {
                    ProductHot += "<span class='rupees'>" + ProductHot_Gia + "đ</span>";
                }
                ProductHot += "</p>";
                ProductHot += "</div>";
                ProductHot += "<div class='add-cart'>";
                ProductHot += "<a href='/gio-hang?productID=" + ProductHot_IDSanPham + "&quantity=" + 1 + "' id='them_hang'>Thêm vào giỏ</a>";
                ProductHot += "</div>";
                ProductHot += "<div class='clear'></div>";
                ProductHot += "</div>";
                ProductHot += "</div>";
            }
            LtProductHot.Text = ProductHot;
            Conn.Close();
        }
    }
}