<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HomeShoppe._Default" %>

<%@ Register Src="/Generic/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="/Generic/HeaderCart.ascx" TagPrefix="uc1" TagName="HeaderCart" %>
<%@ Register Src="/Generic/FollowSocialNetwork.ascx" TagPrefix="uc1" TagName="FollowSocialNetwork" %>
<%@ Register Src="/Generic/TabSearch.ascx" TagPrefix="uc1" TagName="TabSearch" %>
<%@ Register Src="/Generic/LogoShop.ascx" TagPrefix="uc1" TagName="LogoShop" %>
<%@ Register Src="~/Generic/PhoneShop.ascx" TagPrefix="uc1" TagName="PhoneShop" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Chủ</title>
    <link rel="stylesheet" href="/assets/Client/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/fontawesome.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/brands.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/regular.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/solid.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/svg-with-js.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/v4-shims.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/js/fontawesome.js">
    <link rel="stylesheet" href="/assets/Client/css/home.css">
    <link rel="stylesheet" href="/assets/Client/css/slider.css">
    <script src="assets/Client/Lib/toastr-master/toastr.js"></script>
</head>
<body>
    <form id="HomePage" runat="server">
        <!--Start Tag Wrap--->
        <div class="Wrap_Header_Content">
            <!--Start Tag Header-->
            <div class="Header">
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
                        <uc1:LogoShop runat="server" ID="LogoShop" />
                    </div>
                    <!--End img Logo-->
                    <!--Start tag HeaderTopcart -->
                    <div class="HeaderTopcart">
                        <p>
                            <span class="welcome">Chào bạn đến với Home Shoppe</span>
                            <br />
                            <a href="/gio-hang"><span class="gio_hang"><i class="fas fa-shopping-cart">Giỏ hàng </i></span></a>
                            
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
                            <asp:Literal ID="LtMenuPage" runat="server"></asp:Literal>
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
                <!-- Start Header Slide and category -->

                <div class="Header_slide_category">
                    <!--Start Heder Category-->
                    <div class="Header_category">
                        <div class="categories">
                            <ul>
                                <h4>Danh mục sản phẩm</h4>
                                <asp:Literal ID="LtProductCategory" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </div>
                    <!--End Heder Category-->
                    <!--Start Heder Slide-->
                    <div class="Header_slide">
                        <div class="slider">
                            <div id="slider">
                                <div id="mover">
                                    <asp:Literal ID="LtSlide" runat="server"></asp:Literal>
                                </div>
                            </div>
                        </div>
                        <!--End Heder Slide-->
                    </div>
                    <!-- End Header Slide and category -->
                    <!--Start Tag Main-->
                    <div class="Main">
                        <div class="content">
                            <div class="content_top">
                                <div class="heading">
                                    <h3>Sản phẩm mới</h3>
                                </div>
                                <div class="see">
                                    <p><a href="san-pham-moi.aspx">Xem thêm sản phẩm</a></p>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="section_group">
                                <asp:Literal ID="LtNewProduct" runat="server"></asp:Literal>
                            </div>
                            <div class="content_bottom">
                                <div class="heading">
                                    <h3>Sản Phẩm Hot</h3>
                                </div>
                                <div class="see">
                                    <p><a href="san-pham-hot.aspx">Xem thêm sản phẩm</a></p>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="section_group">
                                <asp:Literal ID="LtProductHot" runat="server"></asp:Literal>
                            </div>
                            <div class="content_bottom">
                                <div class="heading">
                                    <h3>Sản Phẩm giảm giá</h3>
                                </div>
                                <div class="see">
                                    <p><a href="san-pham-sale.aspx">Xem thêm sản phẩm</a></p>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="section_group">
                                <asp:Literal ID="LtProductSale" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <!--End Tag Main-->
                </div>
                <!--End Tag Wrap--->
            </div>
        </div>
        <!--Start Tag Footer-->
        <uc1:Footer runat="server" ID="Footer" />
        <!--End Tag Footer-->
    </form>
</body>
</html>
<script src="/assets/Client/JQuery/jquery-1.7.2.min.js"></script>
<script src="/assets/Client/bootstrap/js/bootstrap2.2.2.min.js"></script>
<script src="/assets/Client/js/startstop-slider.js"></script>
