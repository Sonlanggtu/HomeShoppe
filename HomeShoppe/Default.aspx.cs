using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe
{
    public partial class _Default : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());

            //doc ra menuPage

            Conn.Open();
            string menuPage = null;
            string query_menuPage = @"select TenTrang, URL from Menus where GroupID = 1";
            SqlCommand exec_menuPage = new SqlCommand(query_menuPage, Conn);
            SqlDataReader render_menuPage = exec_menuPage.ExecuteReader();
            while (render_menuPage.Read())
            {
                string MenuPage_TenTrang = render_menuPage["TenTrang"].ToString();
                string MenuPage_Url = render_menuPage["URL"].ToString();
                menuPage += "<li class='li_MenuPage'><a href='" + MenuPage_Url + "'>" + MenuPage_TenTrang + "</a></li>";
            }
            LtMenuPage.Text = menuPage;
            Conn.Close();

            // doc ra ProducCategory
            Conn.Open();
            string ProductCategory = null;
            string query_ProductCategory = @"select TheLoaiSP,Url from DanhMucSanPham where TrangThaiDM = 1";
            SqlCommand exec_ProductCategory = new SqlCommand(query_ProductCategory, Conn);
            SqlDataReader render_ProductCategory = exec_ProductCategory.ExecuteReader();
            while (render_ProductCategory.Read())
            {
                string ProductCategory_TenTrang = render_ProductCategory["TheLoaiSP"].ToString();
                string ProductCategory_Url = render_ProductCategory["URL"].ToString();
                ProductCategory += "<li><a href='/productcategory?productcategory=" + ProductCategory_Url + "'>" + ProductCategory_TenTrang + "</a></li>";
            }
            LtProductCategory.Text = ProductCategory;
            Conn.Close();

            // doc ra slide
            Conn.Open();
            string querySlide = @"select IDSanPham, TenSanPham, MoTa, HinhAnh, Url, ThuTuHienThi, TieuDe1, TieuDe2, TieuDe3,TrangThai from Slides
                order by ThuTuHienThi desc";

            SqlCommand cmd = new SqlCommand(querySlide, Conn);
            SqlDataReader render = cmd.ExecuteReader();
            string str = null;

            while (render.Read())
            {
                int ProductSlie_IDSanPham = Convert.ToInt32(render["IDSanPham"]);
                string SlideTenSanPham = render["TenSanPham"].ToString();
                string SlideMoTa = render["MoTa"].ToString();
                string SlideHinhAnh = render["HinhAnh"].ToString();
                string SlideUrl = render["Url"].ToString();
                string SlideTieuDe1 = render["TieuDe1"].ToString();
                string SlideTieuDe2 = render["TieuDe2"].ToString();
                string SlideTieuDe3 = render["TieuDe3"].ToString();
                str += "<div id='slide-1' class='slide'>";
                str += "<div class='slider-img'>";
                str += "<a href = '" + SlideUrl + "' ><img src='" + SlideHinhAnh + "' width='350px'/></a>";
                str += "</div>";
                str += "<div class='slider-text'>";
                str += "<h1>";
                str += "<img src='" + SlideTieuDe1 + "' width='320px'> <br />";
                str += "<br><span>" + SlideTieuDe2 + "</span></h1>";
                str += "<h2>" + SlideTieuDe3 + "</h2>";
                str += "<div class='features_list'>";
                str += "<h4>" + SlideMoTa + "</h4>";
                str += "</div>";
                str += "<a href = '/gio-hang?productID=" + ProductSlie_IDSanPham + "&quantity=" + 1 + "' class='button_shopnow'>Mua ngay</a>";
                str += "</div>";
                str += "<div class='clear'></div>";
                str += "</div>";
            }
            LtSlide.Text = str;
            Conn.Close();

            // doc ra ProductCategory

            // doc ra New Product
            Conn.Open();
            string ProductNew = null;
            string query_ProductNew = @"select top 4 SanPham.ID as IDSanPham, TenSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, Gia,
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
            LtNewProduct.Text = ProductNew;
            Conn.Close();

            // doc du lieu ProductSale
            Conn.Open();
            string ProductSale = null;
            string query_ProductSale = @"select top 4 TenSanPham, SanPham.ID as IDSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, Gia, GiaKhuyenMai , Url
                                         from SanPham , DanhMucSanPham
                                         where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                                        and ( GiaKhuyenMai  IS NOT NULL ) and (TrangThai = 1) ";
            SqlCommand exec_ProductSale = new SqlCommand(query_ProductSale, Conn);
            SqlDataReader render_ProductSale = exec_ProductSale.ExecuteReader();
            while (render_ProductSale.Read())
            {
                string ProductSale_TenSanPham = render_ProductSale["TenSanPham"].ToString();
                string ProductSale_DinhDanh = render_ProductSale["DinhDanhSP"].ToString();
                string ProductSale_HinhAnh = render_ProductSale["HinhAnh"].ToString();
                string ProductSale_Gia = render_ProductSale["Gia"].ToString();
                string ProductSale_GiaKhuyenMai = render_ProductSale["GiaKhuyenMai"].ToString();
                string ProductSale_Url = render_ProductSale["Url"].ToString();
                int ProductSale_IDSanPham = Convert.ToInt32(render_ProductSale["IDSanPham"]);

                ProductSale += "<div class='grid_1_of_4 images_1_of_4'>";
                ProductSale += "<a href='/productdetail?productcategory=" + ProductSale_Url + "&product=" + ProductSale_DinhDanh + "'>";
                ProductSale += "<img src='" + ProductSale_HinhAnh + "' width='212px' height='212px'/></a>";
                ProductSale += "<h2>" + ProductSale_TenSanPham + "</h2>";
                ProductSale += "<div class='price-details'>";
                ProductSale += "<div class='price-number'>";
                ProductSale += "<p>";
                if (ProductSale_GiaKhuyenMai != "")
                {
                    ProductSale += "<span class='rupees'>" + ProductSale_GiaKhuyenMai + "đ</span>";
                    ProductSale += "<span class='sale'>" + ProductSale_Gia + " đ</span>";
                }
                else
                {
                    ProductSale += "<span class='rupees'>" + ProductSale_Gia + "đ</span>";
                }

                ProductSale += "</p>";
                ProductSale += "</div>";
                ProductSale += "<div class='add-cart'>";
                ProductSale += "<a href='/gio-hang?productID=" + ProductSale_IDSanPham + "&quantity=" + 1 + "'>Thêm vào giỏ</a>";
                ProductSale += "</div>";
                ProductSale += "<div class='clear'></div>";
                ProductSale += "</div>";
                ProductSale += "</div>";
            }
            LtProductSale.Text = ProductSale;
            Conn.Close();

            // doc du lieu HotProduct
            Conn.Open();
            string ProductHot = null;
            string query_ProductHot = @"select Top 4 SanPham.ID as IDSanPham, TenSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, Gia, DemLuotXem
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
                ProductHot += "<a href='/gio-hang?productID=" + ProductHot_IDSanPham + "&quantity=" + 1 + "'>Thêm vào giỏ</a>";
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