using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class xoa_sua_san_pham : System.Web.UI.Page
    {
        private int IDXoaSP = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                int idSP = Convert.ToInt32(Request.Form["idCapNhatSP"]);
                var TenSanPham_Update = Request.Form["TenSanPham"];
                var dinhdanh_Update = Request.Form["dinhdanh"];
                var DanhMucSanPham_Update = Request.Form["DanhMucSanPham"];
                var HinhAnh_Update = Request.Form["HinhAnh"];
                var Gia_Update = Request.Form["Gia"];
                var GiaKhuyenMai_Update = Request.Form["GiaKhuyenMai"];
                var BaoHanh_Update = Request.Form["BaoHanh"];
                var MoTa_Update = Request.Form["MoTa"];
                var NoiDung_Update = Request.Form["NoiDung"];
                var LinkVideoDemo_Update = Request.Form["LinkVideoDemo"];
                var DoiTra_Update = Request.Form["DoiTra"];
                var SPTon_Update = Request.Form["SPTon"];
                string TrangThai_Update = Request.Form["TrangThai"];
                int checkbox = 3;
                if (TrangThai_Update == "true")
                {
                    checkbox = 1;
                }
                else
                {
                    checkbox = 0;
                }
                if (idSP != 0)
                {
                    ConnectString ConnectionString2 = new ConnectString();
                    SqlConnection Conn2 = new SqlConnection(ConnectionString2.ConnectionString());
                    Conn2.Open();
                    string Update_Product = "update SanPham set TenSanPham = '" + TenSanPham_Update + "', DinhDanh = '" + dinhdanh_Update + "'," +
                        " IDDanhMucSanPham = " + DanhMucSanPham_Update + ", HinhAnh = '" + HinhAnh_Update + "', " +
                        "BaoHanh = " + BaoHanh_Update + ", MoTa = '" + MoTa_Update + "', NoiDung = '" + NoiDung_Update + "'," +
                        " LinkYoutubeProduct = '" + LinkVideoDemo_Update + "', DoiTra = " + DoiTra_Update + ", SoLuongHang = " + SPTon_Update + "," +
                        "TrangThai = " + checkbox + " where ID = " + idSP + "";
                    SqlCommand cmd_update_Product = new SqlCommand(Update_Product, Conn2);
                    cmd_update_Product.ExecuteNonQuery();
                    Conn2.Close();
                    Response.Write(@"Them moi thanh cong");
                }

                // xoa sp
                IDXoaSP = Convert.ToInt32(Request.QueryString["idxoasp"]);
                if (IDXoaSP != 0)
                {
                    ConnectString ConnectionString1 = new ConnectString();
                    SqlConnection Conn1 = new SqlConnection(ConnectionString1.ConnectionString());
                    Conn1.Open();
                    string del_SP = @"delete SanPham where id = " + IDXoaSP + "";
                    SqlCommand cmd_delSP = new SqlCommand(del_SP, Conn1);
                    cmd_delSP.ExecuteNonQuery();
                    Conn1.Close();
                    Response.Write("1");

                }
                // doc ra
                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                string get_SanPham = "select ID as IDSanPham , TenSanPham, DinhDanh, IDDanhMucSanPham, HinhAnh, Gia, GiaKhuyenMai, BaoHanh," +
                    " MoTa, NoiDung, DemLuotXem, NgayTao, LinkYoutubeProduct, DoiTra, SoLuongHang, TrangThai from SanPham";
                SqlCommand query_SanPham = new SqlCommand(get_SanPham, Conn);
                SqlDataReader render_SanPham = query_SanPham.ExecuteReader();
                string Read_SanPham = "";
                while (render_SanPham.Read())
                {
                    int IDSanPham = Convert.ToInt32(render_SanPham["IDSanPham"]);
                    string TenSanPham = render_SanPham["TenSanPham"].ToString();
                    string DinhDanh = render_SanPham["DinhDanh"].ToString();
                    int IDDanhMucSanPham = Convert.ToInt32(render_SanPham["IDDanhMucSanPham"]);
                    string HinhAnh = render_SanPham["HinhAnh"].ToString();
                    decimal Gia = Convert.ToDecimal(render_SanPham["Gia"]);
                    string GiaKhuyenMa = render_SanPham["GiaKhuyenMai"].ToString();
                    int BaoHanh = Convert.ToInt32(render_SanPham["BaoHanh"]);
                    string MoTa = render_SanPham["MoTa"].ToString();
                    string NoiDung = render_SanPham["NoiDung"].ToString();
                    int DemLuotXem = Convert.ToInt32(render_SanPham["DemLuotXem"]);
                    string NgayTao = render_SanPham["NgayTao"].ToString();
                    string LinkYoutubeProduct = render_SanPham["LinkYoutubeProduct"].ToString();
                    string DoiTra = render_SanPham["DoiTra"].ToString();
                    int SoLuongHang = Convert.ToInt32(render_SanPham["SoLuongHang"]);
                    bool TrangThai = Convert.ToBoolean(render_SanPham["TrangThai"]);

                    Read_SanPham += "<tr>";
                    Read_SanPham += "<td style='text-align: center'>" + TenSanPham + "</td>";
                    Read_SanPham += "<td style='text-align: center'>" + DinhDanh + "</td>";
                    Read_SanPham += "<td style='text-align: center'>" + IDDanhMucSanPham + "</td>";
                    Read_SanPham += "<td  style='text-align: center'><img src='" + HinhAnh + "' width='150px'/></td>";
                    Read_SanPham += "<td  style='text-align: center;'>" + Gia + "</td>";
                    Read_SanPham += "<td  style='text-align: center;'>" + GiaKhuyenMa + "</td>";
                    Read_SanPham += "<td  style='text-align: center;'>" + BaoHanh + "</td>";
                    Read_SanPham += "<td style='text-align: center;'>" + MoTa + "</td>";
                    Read_SanPham += "<td  style='text-align: center;'>" + NoiDung + "</td>";
                    Read_SanPham += "<td style='text-align: center;'>" + DemLuotXem + "</td>";
                    Read_SanPham += "<td style='text-align: center;'>" + NgayTao + "</td>";
                    Read_SanPham += "<td style='text-align: center;'>" + TrangThai + "</td>";
                    Read_SanPham += "<td style='text-align: center;'> " + LinkYoutubeProduct + " </td>";
                    Read_SanPham += "<td style='text-align: center;'>" + DoiTra + "</td>";
                    Read_SanPham += "<td style='text-align: center;'>" + SoLuongHang + "</td>";
                    Read_SanPham += "<td style='text-align: center;'><button type='button' class='btn btn-info sua_sp' data-id=" + IDSanPham + ">Sửa</button> ";
                    Read_SanPham += "<button type='button' class='btn btn-danger xoa_sp' data-id=" + IDSanPham + ">Xóa</button></td>";
                    Read_SanPham += "</tr>";
                }
                LtDocSanPham.Text = Read_SanPham;
                Conn.Close();
            }
            
        }
    }
}