<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gio-hang.aspx.cs" Inherits="HomeShoppe.gio_hang" %>

<%@ Register Src="~/Generic/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Generic/PhoneShop.ascx" TagPrefix="uc1" TagName="PhoneShop" %>
<%@ Register Src="~/Generic/MenuPage.ascx" TagPrefix="uc1" TagName="MenuPage" %>
<%@ Register Src="~/Generic/TabSearch.ascx" TagPrefix="uc1" TagName="TabSearch" %>
<%@ Register Src="~/Generic/FollowSocialNetwork.ascx" TagPrefix="uc1" TagName="FollowSocialNetwork" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giỏ Hàng</title>
    <link rel="stylesheet" href="/assets/client/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/fontawesome.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/brands.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/regular.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/solid.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/svg-with-js.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/v4-shims.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/js/fontawesome.js">
    <link rel="stylesheet" href="/assets/client/css/home.css">
    <script src="/assets/client/JQuery/jquery-1.7.2.min.js"></script>
    <script src="/assets/client/bootstrap/js/bootstrap2.2.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!--Start Tag Wrap--->
        <div class="Wrap_Header_Content_Cart">
            <!--Start Tag Topbar-->
            <div class="TopBar">
                <!--Start tag hotline-->
                <div class="hotline">
                    <p>
                        <span class="fas fa-phone-volume">Cần giúp đỡ?</span> -
                    <span class="number">Hotline:
                        <uc1:PhoneShop runat="server" ID="PhoneShop" />
                    </span>
                    </p>
                </div>
                <!--End tag hotline-->
                <!--Start tag menutop-->
                <div class="menu_top">
                    <div class="menu_top_left">
                        <ul class="ul_menu_top_left">
                            <asp:PlaceHolder ID="ChuaDangNhap" runat="server">
                                <li class="li_menu_top_left"><a href="/dang-ky"><i class="fas fa-pencil-alt">Đăng ký</i></a></li>
                                <li class="li_menu_top_left"><a href="/dang-nhap"><i class="fas fa-lock">Đăng nhập</i></a></li>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="DaDangNhap" runat="server">
                                <asp:Literal ID="LtDaDangNhap" runat="server"></asp:Literal>
                            </asp:PlaceHolder>

                        </ul>
                    </div>

                    <div class="menu_top_right">
                        <ul class="ul_menu_top_right">
                            <uc1:FollowSocialNetwork runat="server" ID="FollowSocialNetwork" />
                        </ul>
                    </div>

                </div>
                <!--Start tag menutop-->
            </div>
            <hr />
            <!--End Tag Topbar-->

            <!--Start Tag HeaderTop-->
            <div class="HeaderTop">
                <!--Start img Logo-->
                <div class="HeaderTopLogo">
                    <img src="/assets/client/images/logo.png" />
                </div>
                <!--End img Logo-->
                <!--Start tag HeaderTopcart -->
                <div class="HeaderTopcart">
                    <p>
                        <span class="welcome">Chào bạn đến với Home Shoppe</span>
                        <br />
                        <p>
                             <asp:PlaceHolder ID="ChuaCoHang" runat="server">'
                             <a href="/gio-hang"><span class="gio_hang"><i class="fas fa-shopping-cart">Giỏ hàng </i></span></a>
                    
                        </asp:PlaceHolder>
                        <asp:PlaceHolder ID="CoHang" runat="server">
                             <asp:Literal ID="LTCoHang" runat="server"></asp:Literal>
                        </asp:PlaceHolder>
                        </p>
                </div>
                <!--End tag HeaderTopcart -->
            </div>
            <!--End Tag HeaderTop-->
            <!--Start Tag Header Bottom-->
            <div class="HeaderBottom">
                <!--Start Tag MenuPage-->
                <div class="MenuPage">
                    <ul class="ul_MenuPage">
                        <uc1:MenuPage runat="server" ID="MenuPage" />
                    </ul>
                </div>
                <!--End Tag MenuPage-->
                <!--Start Tag Search-->
                <div class="Search">
                    <uc1:TabSearch runat="server" ID="TabSearch" />
                </div>
                <!--End Tag Search-->
            </div>
            <!--End Tag Header Bottom-->
            <!--Start Tag Main-->
            <!--Start Tag LinkDetailProduct-->
            <div class="LinkDetailProduct">
                <ul class="cankhoi">
                    <li><a href="/"><i class="fas fa-home"></i>Trang Chủ</a></li>
                    <li><a href="gio-hang.aspx"><i class="fas fa-angle-double-right"></i>Giỏ Hàng</a></li>
                </ul>
            </div>
            <!--End Tag LinkDetailProduct-->
            <div class="MainContactCart">
                <!--Start pageheader_Cart-->
                <div class="pageheader_Cart">
                    <p>
                        <span class="HeaderCart">Giỏ Hàng</span>
                        <br>
                        <span class="step_giohang">Giỏ Hàng <i class="fas fa-shopping-cart step_giohang"></i></span>
                        >> <span>Xác nhận đơn hàng <i class="fas fa-check-circle"></i></span>
                        >> <span>Thanh Toán <i class="fas fa-money-check-alt"></i></span>
                    </p>
                </div>
                <!--End pageheader_Cart-->
                <!--Start Tag TittleCart-->
                <div class="TittleCart">
                    <div class="row">
                        <p class="col-md-4 text-center cancart">Sản Phẩm</p>
                        <p class="col-md-2 cancart text-center">Giá</p>
                        <p class="col-md-2 cancart text-center">Số Lượng</p>
                        <p class="col-md-2 cancart text-center">Tổng cộng</p>
                        <p class="col-md-2 cancart text-center">Chức năng</p>
                    </div>
                </div>
                <!--End Tag TittleCart-->

                <asp:Literal ID="LTGioHang" runat="server"></asp:Literal>                                   

                <asp:Literal ID="LtTongTien" runat="server"></asp:Literal>
               
                <!--Chuyen Xác nhận đơn hàng -->
                <a href="xac-nhan-don-hang.aspx" class="btn btn-success btnchuyenxacnhanhang">Xác nhận đơn hàng</a>
            </div>
            <!--End Tag Main-->
        </div>
        <!--End Tag Wrap--->

        <uc1:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>



