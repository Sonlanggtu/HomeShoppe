using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe
{
    public partial class ProductDetail : System.Web.UI.Page
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
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/productdetail?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            string GetProductCategory = Request.QueryString["productcategory"];
            string getproduct = Request.QueryString["product"];
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra New Product
            Conn.Open();
            string TiviProduct = null;        
            string query_TiviProduct = @"select TheLoaiSP, SanPham.ID as IDSanPham, TenSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, NhieuAnhHon, Gia,
                                         GiaKhuyenMai, BaoHanh, SanPham.MoTa as MoTaSP, NoiDung, DemLuotXem,LinkYoutubeProduct,
                                        DoiTra, Url,SoLuongHang from SanPham, DanhMucSanPham
                                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                                        and (TrangThai = 1) and (Url='" + GetProductCategory + "') and(SanPham.DinhDanh = '"+ getproduct + "')";
            SqlCommand exec_TiviProduct = new SqlCommand(query_TiviProduct, Conn);
            SqlDataReader render_TiviProduct = exec_TiviProduct.ExecuteReader();
            while (render_TiviProduct.Read())
            {
                string TiviProduct_TenSanPham = render_TiviProduct["TenSanPham"].ToString();
                string TiviProduct_DinhDanh = render_TiviProduct["DinhDanhSP"].ToString();
                string TiviProduct_HinhAnh = render_TiviProduct["HinhAnh"].ToString();
                string TiviProduct_NhieuAnhHon = render_TiviProduct["NhieuAnhHon"].ToString();
                string TiviProduct_Gia = render_TiviProduct["Gia"].ToString();
                string TiviProduct_GiaKhuyenMai = render_TiviProduct["GiaKhuyenMai"].ToString();
                string TiviProduct_BaoHanh = render_TiviProduct["BaoHanh"].ToString();
                string TiviProduct_MoTaSP = render_TiviProduct["MoTaSP"].ToString();
                string TiviProduct_NoiDung = render_TiviProduct["NoiDung"].ToString();
                string TiviProduct_DemLuotXem = render_TiviProduct["DemLuotXem"].ToString();
                string TiviProduct_LinkYoutubeProduct = render_TiviProduct["LinkYoutubeProduct"].ToString();
                string TiviProduct_DoiTra = render_TiviProduct["DoiTra"].ToString();
                string TiviProduct_Url = render_TiviProduct["Url"].ToString();
                string TiviProduct_TheLoaiSP = render_TiviProduct["TheLoaiSP"].ToString();
                int? TiviProduct_SoLuongHang = Convert.ToInt32 (render_TiviProduct["SoLuongHang"]);
                int Tivi_IDSanPham = Convert.ToInt32(render_TiviProduct["IDSanPham"]);

                TiviProduct += "<div class='LinkDetailProduct'>";
                TiviProduct += "<ul>";
                TiviProduct += "<li><a href = '/'><i class='fas fa-home'></i>Trang Chủ</a></li>";
                TiviProduct += "<li><a href = '/productcategory?productcategory="+ TiviProduct_Url + "'><i class='fas fa-angle-double-right'></i>" + TiviProduct_TheLoaiSP + "</a></li>";
                TiviProduct += "<li style = 'padding-left:0px;width:250px' ><a href='/productdetail?productcategory="+ TiviProduct_Url + "&product="+ TiviProduct_DinhDanh + "'><i class='fas fa-angle-double-right'></i>" + TiviProduct_TenSanPham + "</a></li>";
                TiviProduct += "</ul>";
                TiviProduct += "</div>";
                TiviProduct += "<hr />";
                TiviProduct += "<div class='NameProductDetail'>";
                TiviProduct += "<h1>" + TiviProduct_TenSanPham + "</h1>";
                TiviProduct += "</div>";
                TiviProduct += "<hr />";
                TiviProduct += "<div class='Picture_left_Detail'>";
                TiviProduct += " <div class='Video_introduce'>";
                TiviProduct += "<iframe width = '400px' height='216px' src='" + TiviProduct_LinkYoutubeProduct + "' frameborder='0'allow ='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture'allowfullscreen></iframe>";
                TiviProduct += "</div>";
                TiviProduct += "<hr />";
                TiviProduct += "<div class='Picture_detail'>";
                TiviProduct += "<img src = '" + TiviProduct_HinhAnh + "' width='360px' height='270px' style='border-radius:15px'/>";
                TiviProduct += "</div>";
                TiviProduct += "</div>";
                TiviProduct += "<div class='Price_between_Detail'>";
                TiviProduct += "<div class='Price_Detail'>";
                
                if (TiviProduct_GiaKhuyenMai != "")
                {
                    TiviProduct += "<h4>Giá ban đầu : <span class='giabandau'>" + TiviProduct_Gia + " đ</span></h4><br />";
                    TiviProduct += "   <h4>Giá sản phẩm : <span> " + TiviProduct_GiaKhuyenMai + " ₫ </span></h4>";
                }
                else
                {
                    TiviProduct += "   <h4>Giá sản phẩm : <span> " + TiviProduct_Gia + " ₫ </span></h4>";
                }
                if (TiviProduct_SoLuongHang != null && TiviProduct_SoLuongHang != 0)
                {
                    TiviProduct += "<h5>Còn Hàng</h5>";
                }
                else
                {
                    TiviProduct += "<h5 style='color:red'>Hết Hàng</h5>";
                }
                TiviProduct += "</div>";
                TiviProduct += "<div class='Tuy_chon_san_pham'>";
                TiviProduct += "Tùy chọn sản phẩm: ";
                TiviProduct += "<ul>";
                TiviProduct += "<li>Màu sắc:";
                TiviProduct += "<select>";
                TiviProduct += "<option value = 'red' > Đỏ </option>";
                TiviProduct += "<option value='green'>Xanh</option>";
                TiviProduct += "<option value ='pink' > Hồng </option>";
                TiviProduct += "<option value='orange'>Cam</option>";
                TiviProduct += "<option value ='black'> Đen</option>";
                TiviProduct += "</select>";
                TiviProduct += "</li>";
                TiviProduct += "<li> Số Lượng:";
                TiviProduct += "<select>";
                TiviProduct += "<option value = '1' > 1 </option>";
                TiviProduct += "<option value='2'>2</option>";
                TiviProduct += "<option value = '3' > 3 </option>";
                TiviProduct += "<option value='4'>4</option>";
                TiviProduct += "<option value = '5' > 5 </ option>";
                TiviProduct += "  </select>";
                TiviProduct += "  </li>";
                TiviProduct += " </ul>";
                TiviProduct += "<a href = '/gio-hang?productID=" + Tivi_IDSanPham + "&quantity=" + 1 + "' class='button_shopnow' style='margin-left:150px'>Mua ngay</a>";
                TiviProduct += "</div>";
                TiviProduct += "<div class='DacdiemNoiBat'>";
                TiviProduct += "<h4>Đặc điểm nổi bật:</h4>";
                TiviProduct += "<p> " + TiviProduct_NoiDung + "</p>";
                TiviProduct += "</div>";
                TiviProduct += "</div>";
                TiviProduct += "<div class='ChinhsachBaoHanh_right'>";
                TiviProduct += "<div class='NoiDungBaoHanh'>";
                TiviProduct += "<div class='HeaderNoiDungBaoHanh'>";
                TiviProduct += "YÊN TÂM MUA HÀNG TẠI";
                TiviProduct += "<p> HOME SHOPPE</p>";
                TiviProduct += "</div>";
                TiviProduct += "<div class='section_NDBaoHanh'>";
                TiviProduct += "<div class='icon-HeaderNoiDungBaoHanh'>";
                TiviProduct += "<img src = '/assets/Client/images/settings.PNG' />";
                TiviProduct += "</div >";
                TiviProduct += "<div class='iconNoiDung-BaoHanh'>";
                TiviProduct += "<span>Miễn phí</span> công lắp đặt";
                TiviProduct += "</div>";
                TiviProduct += "  </div>";
                TiviProduct += " <div class='section_NDBaoHanh'>";
                TiviProduct += "   <div class='icon-HeaderNoiDungBaoHanh'>";
                TiviProduct += "      <img src = '/assets/Client/images/change_item.PNG' />";
                TiviProduct += "    </div>";
                TiviProduct += "  <div class='iconNoiDung-BaoHanh'>";
                TiviProduct += "<span>1 đổi 1</span> trong " + TiviProduct_DoiTra + " tháng";
                TiviProduct += " </div>";
                TiviProduct += "</div>";
                TiviProduct += "   <div class='section_NDBaoHanh'>";
                TiviProduct += "     <div class='icon-HeaderNoiDungBaoHanh'>";
                TiviProduct += "       <img src = '/assets/Client/images/baohanh.PNG' />";
                TiviProduct += "    </div>";
                TiviProduct += "   <div class='iconNoiDung-BaoHanh'>";
                TiviProduct += "  <span>Bảo hành</span> " + TiviProduct_BaoHanh + " tháng";
                TiviProduct += "  </div>";
                TiviProduct += " </div>";
                TiviProduct += "       <div class='section_NDBaoHanh'>";
                TiviProduct += "     <div class='icon-HeaderNoiDungBaoHanh'>";
                TiviProduct += "        <img src = '/assets/Client/images/tich.PNG' />";
                TiviProduct += "   </div>";
                TiviProduct += "   <div class='iconNoiDung-BaoHanh'>";
                TiviProduct += "       <span>Được</span> tư vấn tận tình!";
                TiviProduct += "   </div>";
                TiviProduct += "  </div>";
                TiviProduct += " <div class='section_NDBaoHanh'>";
                TiviProduct += " <div class='icon-HeaderNoiDungBaoHanh'>";
                TiviProduct += "<img src = '/assets/Client/images/tich.PNG' />";
                TiviProduct += "</div>";
                TiviProduct += "  <div class='iconNoiDung-BaoHanh'>";
                TiviProduct += "<span>Được</span> nhận quà kèm theo!";
                TiviProduct += "     </div>";
                TiviProduct += "</div>";
                TiviProduct += "</div>";
                TiviProduct += "  </div>";
                TiviProduct += " <div class='MotaSanPham'>";
                TiviProduct += " <h4>Mô tả chi tiết sản phẩm</h4>";
                TiviProduct += " <p>" + TiviProduct_MoTaSP + "</p>";
                TiviProduct += " </div>";
                TiviProduct += " <hr/>";
                TiviProduct += " </div>";
            }
            LTProductDetail.Text = TiviProduct;
            Conn.Close();
        
            Conn.Open();
            string Related_Products = null;
            string query_Related_Products = @"select top 4 SanPham.ID as IDSanPham, TenSanPham, SanPham.DinhDanh as DinhDanhSP, HinhAnh, Gia,
                        GiaKhuyenMai, Url from SanPham , DanhMucSanPham
                        where SanPham.IDDanhMucSanPham = DanhMucSanPham.ID
                        and ( url = '" + GetProductCategory+"' ) and (TrangThai = 1)";
            SqlCommand exec_Related_Products = new SqlCommand(query_Related_Products, Conn);
            SqlDataReader render_Related_Products = exec_Related_Products.ExecuteReader();
            while (render_Related_Products.Read())
            {
                string Related_Products_TenSanPham = render_Related_Products["TenSanPham"].ToString();
                string Related_Products_DinhDanh = render_Related_Products["DinhDanhSP"].ToString();
                string Related_Products_HinhAnh = render_Related_Products["HinhAnh"].ToString();
                string Related_Products_Gia = render_Related_Products["Gia"].ToString();
                string Related_Products_GiaKhuyenMai = render_Related_Products["GiaKhuyenMai"].ToString();
                string Related_Products_Url = render_Related_Products["Url"].ToString();


                Related_Products += "<div class='grid_1_of_4 images_1_of_4'>";
                Related_Products += "<a href='/productdetail?productcategory=" + Related_Products_Url + "&product=" + Related_Products_DinhDanh + "'>";
                Related_Products += "<img src='" + Related_Products_HinhAnh + "' width='212px' height='212px'/></a>";
                Related_Products += "<h2>" + Related_Products_TenSanPham + "</h2>";
                Related_Products += "<div class='price-details'>";
                Related_Products += "<div class='price-number'>";
                Related_Products += "<p>";
                Related_Products += "<span class='rupees'>" + Related_Products_Gia + "đ</span>";
                if (Related_Products_GiaKhuyenMai != "")
                {
                    Related_Products += "<span class='sale'>" + Related_Products_GiaKhuyenMai + " đ</span>";
                }
                Related_Products += "</p>";
                Related_Products += "</div>";
                Related_Products += "<div class='add-cart'>";
                Related_Products += "<a href='/gio-hang?productID=" + Convert.ToInt32(render_Related_Products["IDSanPham"]) + "&quantity=" + 1 + "' id='them_hang'>Thêm vào giỏ</a>";
                Related_Products += "</div>";
                Related_Products += "<div class='clear'></div>";
                Related_Products += "</div>";
                Related_Products += "</div>";
            }
            LtRelatedProducts.Text = Related_Products;
            LtLinkSPcungloai.Text= "<p><a href='/productcategory?productcategory=" + GetProductCategory + "'>Xem thêm sản phẩm</a></p>";
            Conn.Close();
        }
    }
}