﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tin-tuc-moi.aspx.cs" Inherits="HomeShoppe.tintucmoi" %>

<%@ Register Src="~/Generic/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Generic/PhoneShop.ascx" TagPrefix="uc1" TagName="PhoneShop" %>
<%@ Register Src="~/Generic/FollowSocialNetwork.ascx" TagPrefix="uc1" TagName="FollowSocialNetwork" %>
<%@ Register Src="~/Generic/LogoShop.ascx" TagPrefix="uc1" TagName="LogoShop" %>
<%@ Register Src="~/Generic/HeaderCart.ascx" TagPrefix="uc1" TagName="HeaderCart" %>
<%@ Register Src="~/Generic/MenuPage.ascx" TagPrefix="uc1" TagName="MenuPage" %>
<%@ Register Src="~/Generic/TabSearch.ascx" TagPrefix="uc1" TagName="TabSearch" %>

<!DOCTYPE html>
<head runat="server">
    <title>Tin Tức Mới</title>
    <link rel="stylesheet" href="/assets/Client/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/fontawesome.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/brands.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/regular.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/solid.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/svg-with-js.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/css/v4-shims.css">
    <link rel="stylesheet" href="/assets/Client/font-awesome/fontawesome-free-5.7.2-web/js/fontawesome.js">
    <link rel="stylesheet" href="/assets/Client/css/home.css">
</head>
<body>
    <form id="form1" runat="server">
        <!--Start Tag Wrap--->
        <div class="Wrap_Header_Content_News">
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
                        <uc1:HeaderCart runat="server" ID="HeaderCart" />
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
            <div class="MainNews">
                <!--Start Tag LinkDetailProduct-->
                <div class="LinkDetailProduct">
                    <ul>
                        <li><a href="/"><i class="fas fa-home"></i>Trang Chủ</a></li>
                        <li><a href="tin-tuc-moi.aspx"><i class="fas fa-angle-double-right"></i>TinTứcMới</a></li>
                    </ul>
                </div>
                <!--End Tag LinkDetailProduct-->
                <!--Start Tag NewSection-->
               <asp:Literal ID="LtPostCategories" runat="server"></asp:Literal>
                <!--End Tag NewSection-->
            </div>
            <!--End Tag Main-->
        </div>
        <!--End Tag Wrap--->
        <!--Start Tag Footer-->
        <uc1:Footer runat="server" ID="Footer" />
        <!--End Tag Footer-->
    </form>
</body>
</>
<script src="/assets/Client/JQuery/jquery-1.7.2.min.js"></script>
<script src="/assets/Client/bootstrap/js/bootstrap2.2.2.min.js"></script>
