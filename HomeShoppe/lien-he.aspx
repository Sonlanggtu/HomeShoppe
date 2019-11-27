<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lien-he.aspx.cs" Inherits="HomeShoppe.lien_he" %>

<%@ Register Src="~/Generic/PhoneShop.ascx" TagPrefix="uc1" TagName="PhoneShop" %>
<%@ Register Src="~/Generic/FollowSocialNetwork.ascx" TagPrefix="uc1" TagName="FollowSocialNetwork" %>
<%@ Register Src="~/Generic/LogoShop.ascx" TagPrefix="uc1" TagName="LogoShop" %>
<%@ Register Src="~/Generic/HeaderCart.ascx" TagPrefix="uc1" TagName="HeaderCart" %>
<%@ Register Src="~/Generic/MenuPage.ascx" TagPrefix="uc1" TagName="MenuPage" %>
<%@ Register Src="~/Generic/TabSearch.ascx" TagPrefix="uc1" TagName="TabSearch" %>
<%@ Register Src="~/Generic/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Generic/Location.ascx" TagPrefix="uc1" TagName="Location" %>
<%@ Register Src="~/Generic/Workingtime.ascx" TagPrefix="uc1" TagName="Workingtime" %>
<%@ Register Src="~/Generic/MailCompany.ascx" TagPrefix="uc1" TagName="MailCompany" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Liên Hệ</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/assets/client/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/fontawesome.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/brands.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/regular.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/solid.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/svg-with-js.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/v4-shims.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/js/fontawesome.js">
    <link rel="stylesheet" href="/assets/client/css/home.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="Wrap_Header_Content_Contact">
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
            <div class="MainContact">
                <!--Start Tag LinkDetailProduct-->
                <div class="LinkDetailProduct">
                    <ul>
                        <li><a href="/"><i class="fas fa-home"></i>Trang Chủ</a></li>
                        <li><a href="lien-he.aspx"><i class="fas fa-angle-double-right"></i>LiênHệ</a></li>
                    </ul>
                </div>
                <!--End Tag LinkDetailProduct-->
                <!--Start Tag SupportContact-->
                <div class="SupportContact">
                    <!--Start Phone Lien he-->
                    <div class="Col_SupportContact">
                        <div class="Col_phoneContact">
                            <h4>Điện thoại</h4>
                            <div class="ContentPhone">
                                <div class="icon-contentphone">
                                    <i class="fas fa-phone fa-2x"></i>
                                </div>
                                <div class="content-right-phone">
                                    <p>
                                        <span>
                                            <uc1:PhoneShop runat="server" ID="PhoneShop1" />
                                        </span>
                                        <br />
                                        <span>
                                            <uc1:Workingtime runat="server" ID="Workingtime" />
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Start Dinh vi-->
                    <div class="Col_SupportContact">
                        <div class="Col_phoneContact">
                            <h4>Địa chỉ</h4>
                            <div class="ContentPhone">
                                <div class="icon-contentphone">
                                    <i class="fas fa-location-arrow fa-2x"></i>
                                </div>
                                <div class="content-right-phone">
                                    <p>
                                        <span>Vị trí</span><br />
                                        <span>
                                            <uc1:Location runat="server" ID="Location" />
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Start Gui mail phan hoi-->
                    <div class="Col_SupportContact">
                        <div class="Col_phoneContact">
                            <h4>Liên hệ qua Mail</h4>
                            <div class="ContentPhone">
                                <div class="icon-contentphone">
                                    <i class="fas fa-envelope-square fa-2x"></i>
                                </div>
                                <div class="content-right-phone">
                                    <p>
                                        <span>Mail</span><br />
                                        <span>
                                            <uc1:MailCompany runat="server" ID="MailCompany" />
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!--End Tag SupportContact-->
                <!--Start TAG gui_tin_nhan-->
                <div class="gui_tin_nhan">
                    <h2>Gửi tin nhắn/ Phản hồi với chúng tôi</h2>

                    <div class="content_message_left">
                        <div class="form-group">
                            <input type="text" class="form-control" name="hovaten" id="txtHovaTen" placeholder="Họ tên người dùng .... ">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email ..." id="txtEmail">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="sdt" placeholder="Số điện thoại ..." id="txtSDT">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="tieude" placeholder="Tên tiêu đề" id="txtTieuDe">
                        </div>

                    </div>
                    <div class="content_message_right">
                        <div class="form-group">
                            <textarea class="form-control" cols="10" rows="12" name="noidung" placeholder="Nội dung ...." id="txtNoiDung"></textarea>
                        </div>
                    </div>
                    <asp:Label ID="LtThongBao"  ForeColor="Red" style="font-style: italic" runat="server"></asp:Label>
                    <button class="btn btn-success send_message" id="BtnSend">Gửi phản hồi</button>
                     
                </div>
                <!--End TAG gui_tin_nhan-->
               
            </div>
            <!--End Tag Main-->
        </div>
        <!--End Tag Wrap--->

        <!--Start Tag Footer-->
        <uc1:Footer runat="server" ID="Footer" />
        <!--End Tag Footer-->
    </form>
</body>
</html>
<script src="/assets/client/JQuery/jquery-1.7.2.min.js"></script>
<script src="assets/Client/JQuery/jquery-validation-1.19.0/dist/jquery.validate.min.js"></script>
<script src="/assets/client/bootstrap/js/bootstrap2.2.2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#form1').validate({
            rules: {
                hovaten: "required",
                email: "required",
                sdt: "required",
                tieude: "required",
                noidung: "required"
            },
            messages: {
                hovaten: "bạn chưa nhập họ tên",
                email: "đây không phải là Email",
                sdt: "Bạn chưa nhập số điện thoại",
                tieude: "bạn chưa nhập tiêu đề",
                noidung: "bạn chưa nhập nội dung"
            }
        });

        $('#').off('click').on('click', function () {
            if ($('#form1').valid()) {
                var HovaTen = $('#txtHovaTen').val();
                var Email = $('#txtEmail').val();
                var SDT = $('#txtSDT').val();
                var TieuDe = $('#txtTieuDe').val();
                var NoiDung = $('#txtNoiDung').val();
                $.ajax({
                    url: '/lien-he',
                    type: 'POST',
                    dataType: 'JSON',
                    data: {
                        HovaTen: HovaTen,
                        Email: Email,
                        SDT: SDT,
                        TieuDe: TieuDe,
                        NoiDung: NoiDung
                    },
                    success: function (res) {
                       alert('success: ' + res); 
                    }
                })
            }

        })
    })
</script>
