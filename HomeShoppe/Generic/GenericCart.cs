//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

//namespace HomeShoppe.Generic
//{
    
//    public class GenericCart
//    {
//        const string CartSession = "CartSession";
//        public void GenericCartShop(int productID, int quantity)
//        {
            
//        decimal? TongTien = 0;
//        productID = Convert.ToInt32(Request.QueryString["productID"]);
//            quantity = Convert.ToInt32(Request.QueryString["quantity"]);

//            if((productID != 0) || (quantity != 0))
//            {
//                var product = new ProductDAO().ViewDetail(productID);
//        var cart = Session[CartSession]; //            if (cart != null) //            { //                var list = (List<CartItem>)cart; //                if (list.Exists(x => x.Product.ID == productID)) //                {                      //                    foreach (var item in list) //                    { //                        if (item.Product.ID == productID) //                        { //                            item.Quantity += quantity; //                        }
//} //                } //                else //                { //                    // tạo mới đối tượng cart Item //                    var item = new CartItem();
//                        item.Product = product; //                    item.Quantity = quantity; //                    list.Add(item); //                } //                // Gán vào Session //                Session[CartSession] = list; //                string stringGioHang = ""; //                for (int i=0; i<list.Count; i++)
//                {                  
//                    stringGioHang += "<div class='CacSanPhamMua'>";
//                    stringGioHang += "<div class='row'>";
//                    stringGioHang += "<div class='col-md-4'>";
//                    stringGioHang += "<div class='img-itemcart'>";
//                    stringGioHang += "<img src ='"+list[i].Product.HinhAnh+"' width='100px' height='60' />";
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='noidungcart'>";
//                    stringGioHang += "<p>"+list[i].Product.TenSanPham+"</p>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='col-md-2 canduoi'>";
//                        if(list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
//                        {
//                            stringGioHang += "<p class='textmoney'>" + list[i].Product.Gia + " đ</p>";
//                        }
//                        else
//                        {
//                            stringGioHang += "<p class='textmoney'>" + list[i].Product.GiaKhuyenMai + " đ</p>";
//                        }                    
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='col-md-1 cangiua_soluong'>";
//                    stringGioHang += "<p class='text-center'>"+list[i].Quantity+"</p>";
//                    stringGioHang += "</div>";
//                    stringGioHang += " <div class='col-md-2 cangiua_tongcong'>";
//                        if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
//                        {
//                            stringGioHang += "<p class='textmoney'>" + (list[i].Product.Gia* list[i].Quantity) + " đ</p>";
//                            TongTien += (list[i].Product.Gia* list[i].Quantity);
//                        }
//                        else
//                        {
//                            stringGioHang += "<p class='textmoney'>" + (list[i].Product.GiaKhuyenMai* list[i].Quantity) + " đ</p>";
//                            TongTien += (list[i].Product.GiaKhuyenMai* list[i].Quantity);
//                        }
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='col-md-1 cangiua_chucnang'>";
//                    stringGioHang += "<button class='btn btn-danger'>Xóa</button>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "</div>";
//                } //                LTGioHang.Text = stringGioHang;

//                    string stringTongTien = "";
//stringTongTien+= "<div class='ThanhTien'>";
//                    stringTongTien += "<h4>Thành Tiền : <span class='textmoney'>"+TongTien+" đ</span></h4>";
//                    stringTongTien += "</div>"; //                    LtTongTien.Text = stringTongTien; //            } //            else //            { //                // Tạo mới đối tượng Cart Item //                var item = new CartItem();
//item.Product = product; //                item.Quantity = quantity; //                var list = new List<CartItem>();
//list.Add(item);  //                // Gán vào Session //                Session[CartSession] = list;
//                    string stringGioHang = "";
//                    for (int i = 0; i<list.Count; i++)
//                    {
//                        stringGioHang += "<div class='CacSanPhamMua'>";
//                        stringGioHang += "<div class='row'>";
//                        stringGioHang += "<div class='col-md-4'>";
//                        stringGioHang += "<div class='img-itemcart'>";
//                        stringGioHang += "<img src ='" + list[i].Product.HinhAnh + "' width='100px' height='60' />";
//                        stringGioHang += "</div>";
//                        stringGioHang += "<div class='noidungcart'>";
//                        stringGioHang += "<p>" + list[i].Product.TenSanPham + "</p>";
//                        stringGioHang += "</div>";
//                        stringGioHang += "</div>";
//                        stringGioHang += "<div class='col-md-2 canduoi'>";
//                        if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
//                        {
//                            stringGioHang += "<p class='textmoney'>" + list[i].Product.Gia + " đ</p>";
//                        }
//                        else
//                        {
//                            stringGioHang += "<p class='textmoney'>" + list[i].Product.GiaKhuyenMai + " đ</p>";
//                        }
//                        stringGioHang += "</div>";
//                        stringGioHang += "<div class='col-md-1 cangiua_soluong'>";
//                        stringGioHang += "<p class='text-center'>" + list[i].Quantity + "</p>";
//                        stringGioHang += "</div>";
//                        stringGioHang += " <div class='col-md-2 cangiua_tongcong'>";
//                        if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
//                        {
//                            stringGioHang += "<p class='textmoney'>" + (list[i].Product.Gia* list[i].Quantity) + " đ</p>";
//                            TongTien += (list[i].Product.Gia* list[i].Quantity);
//                        }
//                        else
//                        {
//                            stringGioHang += "<p class='textmoney'>" + (list[i].Product.GiaKhuyenMai* list[i].Quantity) + " đ</p>";
//                            TongTien += (list[i].Product.GiaKhuyenMai* list[i].Quantity);
//                        }
//                        stringGioHang += "</div>";
//                        stringGioHang += "<div class='col-md-1 cangiua_chucnang'>";
//                        stringGioHang += "<button class='btn btn-danger'>Xóa</button>";
//                        stringGioHang += "</div>";
//                        stringGioHang += "</div>";
//                        stringGioHang += "</div>";
//                    }
//                    LTGioHang.Text = stringGioHang;

//                    string stringTongTien = "";
//                    stringTongTien += "<div class='ThanhTien'>";
//                    stringTongTien += "<h4>Thành Tiền : <span class='textmoney'>" + TongTien + " đ</span></h4>";
//                    stringTongTien += "</div>"; //                    LtTongTien.Text = stringTongTien;
//                }
                
//            }
//            if((productID == 0) ||(quantity ==0))
//            {
//                decimal? TongTienKhiDocRa = 0;
//                var cart = Session[CartSession];
//                var list = new List<CartItem>();
//                if (cart != null)
//                {
//                    list = (List<CartItem>) cart;
//                }
//                string stringGioHang = ""; //                for (int i = 0; i<list.Count; i++)
//                {
//                    stringGioHang += "<div class='CacSanPhamMua'>";
//                    stringGioHang += "<div class='row'>";
//                    stringGioHang += "<div class='col-md-4'>";
//                    stringGioHang += "<div class='img-itemcart'>";
//                    stringGioHang += "<img src ='" + list[i].Product.HinhAnh + "' width='100px' height='60' />";
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='noidungcart'>";
//                    stringGioHang += "<p>" + list[i].Product.TenSanPham + "</p>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='col-md-2 canduoi'>";
//                    if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
//                    {
//                        stringGioHang += "<p class='textmoney'>" + list[i].Product.Gia + " đ</p>";
//                    }
//                    else
//                    {
//                        stringGioHang += "<p class='textmoney'>" + list[i].Product.GiaKhuyenMai + " đ</p>";
//                    }
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='col-md-1 cangiua_soluong'>";
//                    stringGioHang += "<p class='text-center'>" + list[i].Quantity + "</p>";
//                    stringGioHang += "</div>";
//                    stringGioHang += " <div class='col-md-2 cangiua_tongcong'>";
//                    if (list[i].Product.GiaKhuyenMai == 0 || list[i].Product.GiaKhuyenMai == null)
//                    {
//                        stringGioHang += "<p class='textmoney'>" + (list[i].Product.Gia* list[i].Quantity) + " đ</p>";
//                        TongTienKhiDocRa += (list[i].Product.Gia* list[i].Quantity);
//                    }
//                    else
//                    {
//                        stringGioHang += "<p class='textmoney'>" + (list[i].Product.GiaKhuyenMai* list[i].Quantity) + " đ</p>";
//                        TongTienKhiDocRa += (list[i].Product.GiaKhuyenMai* list[i].Quantity);
//                    }
//                    stringGioHang += "</div>";
//                    stringGioHang += "<div class='col-md-1 cangiua_chucnang'>";
//                    stringGioHang += "<button class='btn btn-danger'>Xóa</button>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "</div>";
//                    stringGioHang += "</div>";
//                } //                LTGioHang.Text = stringGioHang;

//                string stringTongTien = "";
//                stringTongTien += "<div class='ThanhTien'>";
//                stringTongTien += "<h4>Thành Tiền : <span class='textmoney'>" + TongTienKhiDocRa + " đ</span></h4>";
//                stringTongTien += "</div>";
//                LtTongTien.Text = stringTongTien; //            }
//        }   

//        }

            
        
//    }