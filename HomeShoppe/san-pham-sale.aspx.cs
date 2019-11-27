using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Page.Client.ProductCategoryHome
{
    public partial class PCSale : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/san-pham-sale?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra Sale Product
            Conn.Open();
            string ProductSale = null;
            string query_ProductSale = @"select TenSanPham,SanPham.ID as IDSanPham, SanPham.DinhDanh as DinhDanhSP, 
                                            HinhAnh, Gia, GiaKhuyenMai , Url
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
        }
    }
}