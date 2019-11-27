using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.ProductCategory
{
    public partial class Default : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/productcategory?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }


            string value_sapxep = Request.QueryString["sapxeptheo"];
            string GetProductCategory = Request.QueryString["productcategory"];
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra New Product
            Conn.Open();
            string NameProductCategory = "";
            string Product = "";
            string query = "";
             if (value_sapxep == "tangdan")
            {
                query = @"select  SanPham.ID as IDSanPham, TenSanPham,TheLoaiSP, SanPham.DinhDanh as DinhDanhSP,HinhAnh ,
                        Gia, GiaKhuyenMai, Url  from SanPham, DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                        and (Url = '" + GetProductCategory + "') and (TrangThai = 1) order by Gia asc";
                    
            }
            if (value_sapxep == "giamdan")
            {
                query = @"select  SanPham.ID as IDSanPham, TenSanPham,TheLoaiSP, SanPham.DinhDanh as DinhDanhSP,HinhAnh ,
                        Gia, GiaKhuyenMai, Url  from SanPham, DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                        and (Url = '" + GetProductCategory + "') and (TrangThai = 1) order by Gia desc";
                        
            }
            if (value_sapxep == "namnay")
            {
                query = @"select  SanPham.ID as IDSanPham, TenSanPham,TheLoaiSP, SanPham.DinhDanh as DinhDanhSP, NgayTao ,HinhAnh ,
                        Gia, GiaKhuyenMai, Url  from SanPham, DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                        and  (Url = '" + GetProductCategory + "') and (TrangThai = 1) and( year(NgayTao) = YEAR(GETDATE()))";
            }
            if (value_sapxep == "theo_ngay_ra")
            {
                query = @"select SanPham.ID as IDSanPham, TenSanPham,TheLoaiSP, SanPham.DinhDanh as DinhDanhSP,HinhAnh ,
                        Gia, GiaKhuyenMai, Url  from SanPham, DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                        and (Url = '" + GetProductCategory + "') and (TrangThai =1) order by NgayTao asc";
            }
                if (query == "")
                {
                query = @"select  SanPham.ID as IDSanPham, TenSanPham,TheLoaiSP, SanPham.DinhDanh as DinhDanhSP,HinhAnh ,
                      Gia, GiaKhuyenMai, Url  from SanPham, DanhMucSanPham
                     where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                    and (Url = '" + GetProductCategory + "') and (TrangThai =1)";
            }
                SqlCommand exec = new SqlCommand(query, Conn);
                SqlDataReader render = exec.ExecuteReader();
            string save_value = "<input class='productcategory' value='" + GetProductCategory + "' />";
            while (render.Read())
            {
                    string Product_TenSanPham = render["TenSanPham"].ToString();
                    string Product_DinhDanh = render["DinhDanhSP"].ToString();
                    string Product_HinhAnh = render["HinhAnh"].ToString();
                    string Product_Gia = render["Gia"].ToString();
                    string Product_GiaKhuyenMai = render["GiaKhuyenMai"].ToString();
                    string Product_Url = render["Url"].ToString();
                    int IDProduct = Convert.ToInt32(render["IDSanPham"]);
                    NameProductCategory = render["TheLoaiSP"].ToString();
                   
                    Product += "<div class='grid_1_of_4 images_1_of_4'>";
                    Product += "<a href='/productdetail?productcategory=" + Product_Url + "&product=" + Product_DinhDanh + "'>";
                    Product += "<img src='" + Product_HinhAnh + "' width='212px' height='212px'/></a>";
                    Product += "<h2>" + Product_TenSanPham + "</h2>";
                    Product += "<div class='price-details'>";
                    Product += "<div class='price-number'>";
                    Product += "<p>";
                    if (Product_GiaKhuyenMai != "")
                    {
                    Product += "<span class='rupees'>" + Product_GiaKhuyenMai + "đ</span>";
                    Product += "<span class='sale'>" + Product_Gia + " đ</span>";

                    }
                    else
                    {
                    Product += "<span class='rupees'>" + Product_Gia + "đ</span>";
                    }
                Product += "</p>";
                    Product += "</div>";
                    Product += "<div class='add-cart'>";
                    Product += "<a href='/gio-hang?productID=" + IDProduct + "&quantity=" + 1 + "'>Thêm vào giỏ</a>";
                    Product += "</div>";
                    Product += "<div class='clear'></div>";
                    Product += "</div>";
                    Product += "</div>";
                    
                }
                Product += save_value;
                LtProductCategpry.Text = Product;
                LtLinkPage.Text = "<li><a href='/'><i class='fas fa-home'></i>Trang Chủ</a></li> <li><a href='/productcategory?productcategory=" + GetProductCategory + "' ><i class='fas fa-angle-double-right'></i>" + NameProductCategory + "</a></li>";
                LtHeader.Text = "<h3>" + NameProductCategory + "</h3>";
                Conn.Close();
            

        }
    }
}