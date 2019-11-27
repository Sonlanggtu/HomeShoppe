using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class them_moi_danh_muc_san_pham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                int Trangthai = 0, getIDmodify_PCategory = 0;
                getIDmodify_PCategory = Convert.ToInt32(Request.QueryString["suadanhmucsp"]);
                // truyen gia tri khi an sua danh muc o xoa-sua-danh-muc sang de chinh sua
                if (getIDmodify_PCategory != 0)
                {
                    #region
                    ConnectString ConnectionString1 = new ConnectString();
                    SqlConnection Conn1 = new SqlConnection(ConnectionString1.ConnectionString());
                    Conn1.Open();
                    string stringRead_PCategory = @"select ID, TheLoaiSP, Url, TheTuKhoa, TheMoTa, MoTa, TrangThaiDM from DanhMucSanPham where ID = " + getIDmodify_PCategory + "";
                    SqlCommand Read_PCategory = new SqlCommand(stringRead_PCategory, Conn1);
                    SqlDataReader reader_PCID = Read_PCategory.ExecuteReader();
                    string ProductCategory = "";
                    while (reader_PCID.Read())
                    {
                        int ID = Convert.ToInt32(reader_PCID["id"]);
                        string TheLoaiSP1 = reader_PCID["TheLoaiSP"].ToString();
                        string Url1 = reader_PCID["Url"].ToString();
                        string TheTuKhoa1 = reader_PCID["TheTuKhoa"].ToString();
                        string TheMoTa1 = reader_PCID["TheMoTa"].ToString();
                        string MoTa1 = reader_PCID["MoTa"].ToString();
                        string TrangThai1 = reader_PCID["TrangThaiDM"].ToString();
                        // de render ra value cua checkbox
                        if (TrangThai1 == "true")
                        {
                            TrangThai1 = "checked";
                        }
                        // render cac thong tin vua sua lai
                        #region
                        ProductCategory += "<div class='row'>";
                        ProductCategory += " <h3 style = 'text-align: center' ><b> Sửa Danh Mục Sản Phẩm </b ></h3>";
                        ProductCategory += "<div class='col-lg-5' style='margin-left: 400px'>";
                        ProductCategory += "<div class='form-group'>";
                        ProductCategory += "  <label>Thể Loại Sản Phẩm</label>";
                        ProductCategory += " <input type = 'text' class='form-control' id='txtTheLoaiSP' value='" + TheLoaiSP1 + "' name='TheLoaiSP' placeholder='vd: Laptop, pc, phần mềm ...'>";
                        ProductCategory += " </div>";
                        ProductCategory += "<div class='form-group'>";
                        ProductCategory += "  <label>URl</label>";
                        ProductCategory += "   <input type = 'text' class='form-control' id='txturl' name='url' value='" + Url1 + "' placeholder='đường dẫn sản phẩm vd /PC'>";
                        ProductCategory += "  </div>";
                        ProductCategory += " <div class='form-group'>";
                        ProductCategory += "    <label>Thẻ từ khóa</label>";
                        ProductCategory += "  <input type = 'text' id='txtTheTuKhoa' name='TheTuKhoa' value='" + TheTuKhoa1 + "' class='form-control'>";
                        ProductCategory += " </div>";
                        ProductCategory += "<div class='form-group'>";
                        ProductCategory += "   <label>Thẻ mô tả</label>";
                        ProductCategory += "  <input type = 'text' id='txtTheMoTa' name='TheMoTa' value='" + TheMoTa1 + "' class='form-control'>";
                        ProductCategory += "</div>";
                        ProductCategory += "<div class='form-group'>";
                        ProductCategory += "<label>Mô tả danh mục</label>";
                        ProductCategory += "<textarea rows = '4' cols= '50' id= 'txtMoTaDanhMuc' name= 'MoTaDanhMuc' class='form-control' placeholder='vd: Cửa hàng chuyên bán các dùng laptop từ văn phòng đến gamming....'> " + MoTa1 + "</textarea>";
                        ProductCategory += "  </div>";
                        ProductCategory += "  <div class='form-check'>";
                        ProductCategory += "<input type = 'checkbox' class='form-check-input' " + TrangThai1 + " name='TrangThai' id='TrangThai'>";
                        ProductCategory += "<label class='form-check-label'>Trạng thái danh mục</label>";
                        ProductCategory += " </div>";
                        ProductCategory += " <button class='btn btn-success btnEditProductCategory' type='button' />Sửa</button>";
                        ProductCategory += "</div>";
                        ProductCategory += "</div>";
                        ProductCategory += "<input type='text' value='" + getIDmodify_PCategory + "' class='an_the_input' id='id_sua_productcategory' />";
                        #endregion

                    }
                    LtAddProductCategory.Text = ProductCategory;
                    Conn1.Close();
                    #endregion
                }

                // them danh muc san pham
                else
                {
                    #region
                    string TheLoaiSP = Request.Form["TheLoaiSP"];
                    string url = Request.Form["url"];
                    string TheTuKhoa = Request.Form["TheTuKhoa"];
                    string TheMoTa = Request.Form["TheMoTa"];
                    string MoTaDanhMuc = Request.Form["MoTaDanhMuc"];
                    string CkStatus = Request.Form["TrangThai"];

                    if (CkStatus == "true")
                    {
                        Trangthai = 1;
                    }
                    if (url != null && TheLoaiSP != null && IsPostBack == true)
                    {
                        ConnectString ConnectionString = new ConnectString();
                        SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                        Conn.Open();
                        string stringAddProductCategory = @"insert into DanhMucSanPham (TheLoaiSP, MoTa, TheTuKhoa, Url, TheMoTa, TrangThaiDM) values('" + TheLoaiSP + "','" + TheMoTa + "','" + TheTuKhoa + "','" + url + "','" + TheMoTa + "'," + Trangthai + ")";
                        SqlCommand insertProductCategory = new SqlCommand(stringAddProductCategory, Conn);
                        insertProductCategory.ExecuteNonQuery();
                        Conn.Close();
                    }
                    // Chi la read ra thoi
                    #region
                    string ProductCategory = "";
                    ProductCategory += "<div class='row'>";
                    ProductCategory += " <h3 style = 'text-align: center' ><b> Thêm mới Danh Mục Sản Phẩm </b ></h3>";
                    ProductCategory += "<div class='col-lg-5' style='margin-left: 400px'>";
                    ProductCategory += "<div class='form-group'>";
                    ProductCategory += "  <label>Thể Loại Sản Phẩm</label>";
                    ProductCategory += " <input type = 'text' class='form-control' id='txtTheLoaiSP' name='TheLoaiSP' placeholder='vd: Laptop, pc, phần mềm ...'>";
                    ProductCategory += " </div>";
                    ProductCategory += "<div class='form-group'>";
                    ProductCategory += "  <label>URl</label>";
                    ProductCategory += "   <input type = 'text' class='form-control' id='txturl' name='url' placeholder='đường dẫn sản phẩm vd /PC'>";
                    ProductCategory += "  </div>";
                    ProductCategory += " <div class='form-group'>";
                    ProductCategory += "    <label>Thẻ từ khóa</label>";
                    ProductCategory += "  <input type = 'text' id='txtTheTuKhoa' name='TheTuKhoa' class='form-control'>";
                    ProductCategory += " </div>";
                    ProductCategory += "<div class='form-group'>";
                    ProductCategory += "   <label>Thẻ mô tả</label>";
                    ProductCategory += "  <input type = 'text' id='txtTheMoTa' name='TheMoTa' class='form-control'>";
                    ProductCategory += "</div>";
                    ProductCategory += "<div class='form-group'>";
                    ProductCategory += "<label>Mô tả danh mục</label>";
                    ProductCategory += "<textarea rows = '4' cols= '50' id= 'txtMoTaDanhMuc' name= 'MoTaDanhMuc' class='form-control' placeholder='vd: Cửa hàng chuyên bán các dùng laptop từ văn phòng đến gamming....'> </textarea>";
                    ProductCategory += "  </div>";
                    ProductCategory += "  <div class='form-check'>";
                    ProductCategory += "<input type = 'checkbox' class='form-check-input'  name='TrangThai' id='TrangThai'>";
                    ProductCategory += "<label class='form-check-label'>Trạng thái danh mục</label>";
                    ProductCategory += " </div>";
                    ProductCategory += " <button id = 'btnAddProductCageroy' class='btn btn-success'>Thêm mới</button>";
                    ProductCategory += "</div>";
                    ProductCategory += "</div>";
                    LtAddProductCategory.Text = ProductCategory;
                    #endregion
                    #endregion
                }
            }

           
        }
    }
}