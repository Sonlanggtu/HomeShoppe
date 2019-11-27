using HomeShoppe.Cart;
using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace HomeShoppe
{
    public partial class xac_nhan_don_hang : System.Web.UI.Page
    {
        private const string CartSession = "CartSession";

        protected void Page_Load(object sender, EventArgs e)
        {
            string HovaTen = Request.Form["HovaTen"];
            string SDT = Request.Form["SDT"];
            string Email = Request.Form["Email"];
            string DiaChiNhan = Request.Form["DiaChiNhan"];

            decimal? TongTienKhiDocRa = 0;
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }

            // read tu du lieu tu list
            string stringGioHang = "";
            for (int i = 0; i < list.Count; i++)
            {
                stringGioHang += "<div class='CacSanPhamMua'>";
                stringGioHang += "<div class='row'>";
                stringGioHang += "<div class='col-md-4'>";
                stringGioHang += "<div class='img-itemcart'>";
                stringGioHang += "<img src ='" + list[i].Product.HinhAnh + "' width='100px' height='60' />";
                stringGioHang += "</div>";
                stringGioHang += "<div class='noidungcart'>";
                stringGioHang += "<p>" + list[i].Product.TenSanPham + "</p>";
                stringGioHang += "</div>";
                stringGioHang += "</div>";
                stringGioHang += "<div class='col-md-2 canduoi'>";
                if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
                {
                    stringGioHang += "<p class='textmoney'>" + list[i].Product.Gia + " đ</p>";
                }
                else
                {
                    stringGioHang += "<p class='textmoney'>" + list[i].Product.GiaKhuyenMai + " đ</p>";
                }
                stringGioHang += "</div>";
                stringGioHang += "<div class='col-md-1 cangiua_soluong'>";
                stringGioHang += "<p class='text-center'>" + list[i].Quantity + "</p>";
                stringGioHang += "</div>";
                stringGioHang += " <div class='col-md-2 cangiua_tongcong'>";
                if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
                {
                    stringGioHang += "<p class='textmoney'>" + (list[i].Product.Gia * list[i].Quantity) + " đ</p>";
                    TongTienKhiDocRa += (list[i].Product.Gia * list[i].Quantity);
                }
                else
                {
                    stringGioHang += "<p class='textmoney'>" + (list[i].Product.GiaKhuyenMai * list[i].Quantity) + " đ</p>";
                    TongTienKhiDocRa += (list[i].Product.GiaKhuyenMai * list[i].Quantity);
                }
                stringGioHang += "</div>";
                stringGioHang += "<div class='col-md-1 cangiua_chucnang'>";
                stringGioHang += "</div>";
                stringGioHang += "</div>";
                stringGioHang += "</div>";
            }
            LTGioHang.Text = stringGioHang;

            string stringTongTien = "";
            stringTongTien += "<div class='ThanhTien'>";
            stringTongTien += "<h4>Thành Tiền : <span class='textmoney'>" + TongTienKhiDocRa + " đ</span></h4>";
            stringTongTien += "</div>";
            LtTongTien.Text = stringTongTien;

            // ghi vao database
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());

            if (IsPostBack == true && HovaTen != null && HovaTen != "")
            {
                // ghi vao bang dat hang
                Conn.Open();
                int kiemtra = 0;
                SqlCommand insertAccount = new SqlCommand("ComfirmCart", Conn);
                insertAccount.CommandType = CommandType.StoredProcedure;
                insertAccount.Parameters.Add(new SqlParameter("@HoTenKhachHang", HovaTen));
                insertAccount.Parameters.Add(new SqlParameter("@EmailKhachHang", SDT));
                insertAccount.Parameters.Add(new SqlParameter("@SDTKhachHang", Email));
                insertAccount.Parameters.Add(new SqlParameter("@DiaChiKhachHang", DiaChiNhan));
                insertAccount.Parameters.Add(new SqlParameter("@NgayTao", DateTime.Now));
                insertAccount.ExecuteNonQuery();
                kiemtra++;
                Conn.Close();
                string stringIDDatHang = @"select max(ID) as IDSanPham from DatHang";
                int IDDatHang = 0;
                SqlCommand exec_IDDatHang = new SqlCommand(stringIDDatHang, Conn);
                Conn.Open();
                SqlDataReader render = exec_IDDatHang.ExecuteReader();
                while (render.Read())
                {
                    IDDatHang = Convert.ToInt32(render["IDSanPham"]);
                }
                kiemtra++;
                Conn.Close();

                // ghi vao chi tiet dat hang
                bool kt = false;
                var Cart = (List<CartItem>)Session[CartSession];
                foreach (var item in Cart)
                {
                    var IDSanPham = item.Product.ID;
                    var Soluong = item.Quantity;
                    decimal? Gia = 0;
                    if (item.Product.GiaKhuyenMai == 0 || item.Product.GiaKhuyenMai == null)
                    {
                        Gia = item.Product.Gia;
                    }
                    else
                    {
                        Gia = item.Product.GiaKhuyenMai;
                    }
                    string ghivaodatabase = "insert into ChiTietDatHang(IDDatHang, IDSanPham, SoLuong, Gia) values(" + IDDatHang + ", " + IDSanPham + ", " + Soluong + ", " + Gia + ")";
                    Conn.Open();
                    SqlCommand insert_CTDatHang = new SqlCommand(ghivaodatabase, Conn);
                    insert_CTDatHang.ExecuteNonQuery();
                    kt = true;
                    Conn.Close();
                }
                if (kt == true)
                {
                    kiemtra++;
                }
                if(kiemtra == 3)
                {
                    LtThongBao.InnerText = "Đã xác nhận thông tin, yêu cầu quí khách chuyển qua bước thanh toán"
;                }
            }
        }
    }
}