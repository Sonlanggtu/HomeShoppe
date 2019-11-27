using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class them_san_pham : System.Web.UI.Page
    {
        private int IDSuaSP = 0;
        public void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                // sua sp
                IDSuaSP = Convert.ToInt32(Request.QueryString["idsuasp"]);
                if (IDSuaSP != 0)
                {
                    #region
                    ConnectString ConnectionString1 = new ConnectString();
                    SqlConnection Conn1 = new SqlConnection(ConnectionString1.ConnectionString());
                    Conn1.Open();
                    string get_Product = @"
                select TenSanPham, DinhDanh, IDDanhMucSanPham, HinhAnh, Gia, GiaKhuyenMai, 
                BaoHanh, MoTa, NoiDung, NgayTao, LinkYoutubeProduct, DoiTra, SoLuongHang, TrangThai from SanPham
                 where ID = " + IDSuaSP + "";
                    SqlCommand Read_Product = new SqlCommand(get_Product, Conn1);
                    SqlDataReader reader_Product = Read_Product.ExecuteReader();
                    string stringRender_Product = "";
                    while (reader_Product.Read())
                    {
                        string TenSanPham1 = reader_Product["TenSanPham"].ToString();
                        string dinhdanh1 = reader_Product["dinhdanh"].ToString();
                        int DanhMucSanPham1 = Convert.ToInt32(reader_Product["IDDanhMucSanPham"]);
                        string HinhAnh1 = reader_Product["HinhAnh"].ToString();
                        decimal Gia1 = Convert.ToDecimal(reader_Product["Gia"]);
                        decimal? GiaKhuyenMai1 = null;
                        if (reader_Product["GiaKhuyenMai"] is DBNull)
                        {
                            GiaKhuyenMai1 = null;
                        }
                        else
                        {
                            GiaKhuyenMai1 = Convert.ToDecimal(reader_Product["GiaKhuyenMai"]);
                        }

                        int BaoHanh1 = Convert.ToInt32(reader_Product["BaoHanh"]);
                        string mota1 = reader_Product["MoTa"].ToString();
                        string NoiDung1 = reader_Product["NoiDung"].ToString();
                        string LinkVideoDemo1 = reader_Product["LinkYoutubeProduct"].ToString();
                        int? DoiTra1 = null;
                        if (reader_Product["DoiTra"] is DBNull)
                        {
                            DoiTra1 = null;
                        }
                        else
                        {
                            DoiTra1 = Convert.ToInt32(reader_Product["DoiTra"]); ;
                        }

                        int SPTon1 = Convert.ToInt32(reader_Product["SoLuongHang"]);
                        string TrangThai1 = reader_Product["TrangThai"].ToString();


                        stringRender_Product += " <div class='row'>";
                        stringRender_Product += " <h3 style='text-align: center'><b>Cập nhật Sản Phẩm </b></h3>";
                        stringRender_Product += "<div class='col-lg-5' style='margin-left: 400px'>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "<label>Tên Sản Phẩm</label>";
                        stringRender_Product += " <input type='text' class='form-control' id='txtTenSanPham' name='TenSanPham' value='" + TenSanPham1 + "' placeholder='vd: Laptop y520, cpu core i7 7750K ...'>";
                        stringRender_Product += " </div> ";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "    <label>Định Danh</label>";
                        stringRender_Product += "   <input type='text' class='form-control' id='txtdinhdanh' name='dinhdanh' value='" + dinhdanh1 + "' placeholder='đường dẫn sản phẩm vd /samsung-49-inch-G2 ,....'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>ID Danh Mục SP</label>";
                        stringRender_Product += "  <input type='number' id='nbDanhMucSanPham' name='DanhMucSanPham' value=" + DanhMucSanPham1 + " class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Hình Ảnh</label>";
                        stringRender_Product += "<img src=" + HinhAnh1 + " width='150px'/>";
                        stringRender_Product += "  <input type='text' id='txthinhanh' value=  '" + HinhAnh1 + "' name='HinhAnh' class='form-control-file'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += " <label>Giá</label>";
                        stringRender_Product += "<input type='number' id='nbGia' name='Gia' value=" + Gia1 + " class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Giá khuyến mãi</label>";
                        stringRender_Product += "  <input type='number' id='nbGiaKhuyenMai' name='GiaKhuyenMai' value=" + GiaKhuyenMai1 + " class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Bảo Hành</label>";
                        stringRender_Product += "  <input type='number' id='nbBaoHanh' name='BaoHanh' value=" + BaoHanh1 + " class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Mô Tả</label>";
                        stringRender_Product += " <textarea rows='4' cols='50' id='txtMoTa' name='MoTa' class='form-control ckeditor' placeholder='vd: Sản Phẩm y520 có cấu hình core i5 720HQ ......'>'" + mota1 + "' </textarea>";
                        stringRender_Product += " </div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "    <label>Nội Dung</label>";
                        stringRender_Product += "   <textarea rows='4' cols='50' id='txtNoiDung' name='NoiDung' class='form-control ckeditor' placeholder='vd: y520 là dòng gamming, có thiết kế hiện đại, ....'>'" + NoiDung1 + "' </textarea>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Link Video Demo</label>";
                        stringRender_Product += "  <input type='text' id='txtLinkVideoDemo' name='LinkVideoDemo' value='" + LinkVideoDemo1 + "' class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "  <label>Đổi Trả</label>";
                        stringRender_Product += " <input type='number' id='nbDoiTra' name='DoiTra' value=" + DoiTra1 + " class='form-control'>";
                        stringRender_Product += " </div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += " <label>Số lượng SP Tồn</label>";
                        stringRender_Product += "<input type='number' id='nbSPTon' name='SPTon' value=" + SPTon1 + " class='form-control'>";
                        stringRender_Product += "  </div>";
                        stringRender_Product += "<div class='form-check'>";
                        stringRender_Product += " <input type='checkbox' class='form-check-input' " + TrangThai1 + " name='TrangThai' id='TrangThai'>";
                        stringRender_Product += "  <input type = 'text' value = '" + IDSuaSP + "' class='an_the_input' id='layidsuaSP' />";
                        stringRender_Product += "  <label class='form-check-label'>Trạng thái Sản Phẩm</label>";
                        stringRender_Product += "    </div>";
                        stringRender_Product += "  <button type='button' class='btn btn-success btnEditProduct'>Cập nhật</button>";
                        stringRender_Product += "    </div>";
                        stringRender_Product += " </div>";

                    }
                    LtSanPham.Text = stringRender_Product;
                    Conn1.Close();
                    Response.Write(@"1");
                    #endregion
                }
                else
                {
                    #region
                    string TenSanPham = Request.Form["TenSanPham"];
                    string dinhdanh = Request.Form["dinhdanh"];
                    string DanhMucSanPham = Request.Form["DanhMucSanPham"];
                    string HinhAnh = Request.Form["HinhAnh"];
                    decimal Gia = Convert.ToDecimal(Request.Form["Gia"]);
                    decimal? GiaKhuyenMai = Convert.ToDecimal(Request.Form["GiaKhuyenMai"]);
                    int BaoHanh = Convert.ToInt32(Request.Form["BaoHanh"]);
                    string mota = Request.Form["MoTa"];
                    string NoiDung = Request.Form["NoiDung"];
                    string LinkVideoDemo = Request.Form["LinkVideoDemo"];
                    int DoiTra = Convert.ToInt32(Request.Form["DoiTra"]);
                    int SPTon = Convert.ToInt32(Request.Form["SPTon"]);
                    DateTime NgayTao = DateTime.Now;
                    string TrangThai = Request.Form["TrangThai"];
                    int Checkbox = 3;
                    if (TrangThai == "true")
                    {
                        Checkbox = 0;
                    }
                    else
                    {
                        Checkbox = 1;
                    }
                    if (TenSanPham != null)
                    {
                        ConnectString ConnectionString = new ConnectString();
                        SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                        Conn.Open();
                        string insert_Product = "insert into SanPham(TenSanPham, DinhDanh, IDDanhMucSanPham, HinhAnh,Gia, GiaKhuyenMai," +
                            " BaoHanh, MoTa, NoiDung, NgayTao, LinkYoutubeProduct, DoiTra, SoLuongHang, TrangThai ) " +
                            "VALUES('" + TenSanPham + "', '" + dinhdanh + "', " + DanhMucSanPham + " ,N'" + HinhAnh + "', " + Gia + ", " + GiaKhuyenMai + ", " + BaoHanh + ", 'N" + mota + "', N'" + NoiDung + "', '" + NgayTao + "', '" + LinkVideoDemo + "', " + DoiTra + ", " + SPTon + ", " + Checkbox + ")";
                        SqlCommand cmd_insert_Product = new SqlCommand(insert_Product, Conn);
                        cmd_insert_Product.ExecuteNonQuery();
                        Conn.Close();
                        Response.Write(@"Them moi thanh cong");
                    }

                    if (TenSanPham == null)
                    {
                        string stringRender_Product = "";
                        stringRender_Product += " <div class='row'>";
                        stringRender_Product += " <h3 style='text-align: center'><b>Thêm mới Sản Phẩm </b></h3>";
                        stringRender_Product += "<div class='col-lg-5' style='margin-left: 400px'>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "<label>Tên Sản Phẩm</label>";
                        stringRender_Product += " <input type='text' class='form-control' id='txtTenSanPham' name='TenSanPham' placeholder='vd: Laptop y520, cpu core i7 7750K ...'>";
                        stringRender_Product += " </div> ";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "<label>Định Danh</label>";
                        stringRender_Product += "<input type='text' class='form-control' id='txtdinhdanh' name='dinhdanh' placeholder='đường dẫn sản phẩm vd /samsung-49-inch-G2 ,....'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "<label>ID Danh Mục SP</label>";
                        stringRender_Product += "<input type='number' id='nbDanhMucSanPham' name='DanhMucSanPham' class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "<label>Hình Ảnh</label>";
                        stringRender_Product += "<input type='text' id='txthinhanh' name='HinhAnh' class='form-control-file'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += " <label>Giá</label>";
                        stringRender_Product += "<input type='number' id='nbGia' name='Gia' class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Giá khuyến mãi</label>";
                        stringRender_Product += "  <input type='number' id='nbGiaKhuyenMai' name='GiaKhuyenMai' class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Bảo Hành</label>";
                        stringRender_Product += "  <input type='number' id='nbBaoHanh' name='BaoHanh' class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Mô Tả</label>";
                        stringRender_Product += " <textarea rows='4' cols='50' id='txtMoTa' name='MoTa' class='form-control ckeditor' placeholder='vd: Sản Phẩm y520 có cấu hình core i5 720HQ ......'> </textarea>";
                        stringRender_Product += " </div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "    <label>Nội Dung</label>";
                        stringRender_Product += "   <textarea rows='4' cols='50' id='txtNoiDung' name='NoiDung' class='form-control ckeditor' placeholder='vd: y520 là dòng gamming, có thiết kế hiện đại, ....'> </textarea>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "   <label>Link Video Demo</label>";
                        stringRender_Product += "  <input type='text' id='txtLinkVideoDemo' name='LinkVideoDemo' class='form-control'>";
                        stringRender_Product += "</div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += "  <label>Đổi Trả</label>";
                        stringRender_Product += " <input type='number' id='nbDoiTra' name='DoiTra' class='form-control'>";
                        stringRender_Product += " </div>";
                        stringRender_Product += "<div class='form-group'>";
                        stringRender_Product += " <label>Số lượng SP Tồn</label>";
                        stringRender_Product += "<input type='number' id='nbSPTon' name='SPTon' class='form-control'>";
                        stringRender_Product += "  </div>";
                        stringRender_Product += "<div class='form-check'>";
                        stringRender_Product += " <input type='checkbox' class='form-check-input' name='TrangThai' id='TrangThai'>";
                        stringRender_Product += "  <label class='form-check-label'>Trạng thái Sản Phẩm</label>";
                        stringRender_Product += "     </div>";
                        stringRender_Product += "  <button id='btnAddProduct' type='button' class='btn btn-success'>Thêm mới</button>";
                        stringRender_Product += "    </div>";
                        stringRender_Product += " </div>";
                        LtSanPham.Text = stringRender_Product;

                    }
                    #endregion


                }
            }
           


        }


    }


}
