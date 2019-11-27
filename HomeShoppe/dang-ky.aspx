<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dang-ky.aspx.cs" Inherits="HomeShoppe.dang_ky" %>

<%@ Register Src="~/Generic/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>
<%@ Register Src="~/Generic/Header_Login_Register.ascx" TagPrefix="uc1" TagName="Header_Login_Register" %>
<%@ Register Src="~/Generic/FollowSocialNetwork.ascx" TagPrefix="uc1" TagName="FollowSocialNetwork" %>
<%@ Register Src="~/Generic/PhoneShop.ascx" TagPrefix="uc1" TagName="PhoneShop" %>
<%@ Register Src="~/Generic/LogoShop.ascx" TagPrefix="uc1" TagName="LogoShop" %>
<%@ Register Src="~/Generic/HeaderCart.ascx" TagPrefix="uc1" TagName="HeaderCart" %>
<%@ Register Src="~/Generic/MenuPage.ascx" TagPrefix="uc1" TagName="MenuPage" %>
<%@ Register Src="~/Generic/TabSearch.ascx" TagPrefix="uc1" TagName="TabSearch" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="/assets/client/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/fontawesome.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/brands.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/regular.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/solid.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/svg-with-js.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/css/v4-shims.css">
    <link rel="stylesheet" href="/assets/client/font-awesome/fontawesome-free-5.7.2-web/js/fontawesome.js">
    <link href="assets/Client/Lib/toastr-master/build/toastr.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/assets/client/css/home.css">

    <script src="/assets/Client/JQuery/jquery-1.7.2.min.js"></script>
    <script src="/assets/Client/bootstrap/js/bootstrap2.2.2.min.js"></script>
    <script src="/assets/Client/JQuery/jquery-validation-1.19.0/dist/jquery.validate.min.js"></script>
    <script src="/assets/Client/Lib/toastr-master/toastr.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!--Start Tag Wrap--->
        <div class="Wrap_Header_Content_Register">
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
                            <uc1:Header_Login_Register runat="server" ID="Header_Login_Register" />

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
            <div class="MainRigister">
                <!--Start Tag LinkDetailProduct-->
                <div class="LinkDetailProduct">
                    <ul>
                        <li><a href="/"><i class="fas fa-home"></i>Trang Chủ</a></li>
                        <li><a href="dang-ky.aspx"><i class="fas fa-angle-double-right"></i>Đăngký</a></li>
                    </ul>
                </div>
                <hr />
                <!--End Tag LinkDetailProduct-->
                <div class="contentRigister">
                    <!--Start pageheader_Register-->
                    <div class="pageheader_Register">
                        <p class="Thamgia_dangky">Tham gia ngay với chúng tôi</p>
                    </div>
                    <!--End pageheader_Register-->
                    <!--Start Tag FormRegister-->
                    <div class="FormRegister">
                        <div class="page-login-form">
                            <h3>Đăng ký</h3>
                            <div class="form-group">
                                <div class="form-control">
                                    <div class="input-icon">
                                        <i class="fas fa-user"></i>
                                        <input type="text" placeholder="Tên tài khoản" name="UserName" id="txtUsername">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-control">
                                    <div class="input-icon">
                                        <i class="fas fa-envelope"></i>
                                        <input type="email" placeholder="Tài khoản Email"  name="Email" id="txtEmail" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-control">
                                    <div class="input-icon">
                                        <i class="fas fa-key"></i>
                                        <input type="password" placeholder="Mật khẩu" name="password" id="txtPassword" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="form-control">
                                    <div class="input-icon">
                                        <i class="fas fa-key"></i>
                                        <input type="password" placeholder="Xác nhận mật khẩu" name="ConfirmPassword" id="txtConfirmPassword" />
                                    
                                    </div>
                                </div>
                            </div>
                            <div class="btnRegister">
                                <button class="btn btn-success BtnDangKy" >Đăng ký</button>                                                          
                            </div>
                        </div>
                        <asp:Label ID="LbThongBao" runat="server" ForeColor="Red" style="font-style: italic"></asp:Label>
                    </div>
                    <!--End Tag FormRegister-->
                </div>
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

<script>
    $(document).ready(function () {
        $('#form1').validate({
            rules: {
                UserName: {
                    required: true,
                    minlength: 5             
                },
                password: {
                    required: true,
                    minlength: 7
                },
                Email: "required",
                ConfirmPassword: {
                    required : true,
                    minlength: 7,    
                  //  equalTo:"#UserName"
                }
            },
            messages: {
                UserName: {
                    required: "Bạn chưa tạo tên đăng nhập :((",
                    minlength: "tài khoản tối thiểu 5 kí tự :)"
                },
                password: {
                    required: "Bạn chưa nhập mật khẩu -_-",
                     minlength: "tài khoản tối thiểu 7 kí tự"
                },
                Email: "Đây không phải là Email",
                ConfirmPassword: {
                    required: "Bạn phải nhập mật khẩu xác nhận chứ :)))",
                    minlength: "tài khoản tối thiểu 7 kí tự",
                //    equalTo: "mật khẩu không khớp"
                }
            }
        })

        $('.BtnDangKy').off('click').on('click', function () {
            if ($('#form1').valid()) {
            var Username = $('#txtUsername').val();
            var Email = $('#txtEmail').val();
            var Password = $('#txtPassword').val();
            var ConfirmPassword = $('#txtConfirmPassword').val();
               $.post("/dang-ky", {
                    Username: Username,
                    Email: Email,
                    Password: Password,
                    ConfirmPassword: ConfirmPassword,                   
                })
            }
           
            //$.ajax({
            //    url: '/dang-ky',
            //    Type: 'POST',
            //    dateType: 'JSON',
            //    data: {
            //        Username: Username,
            //        Email: Email,
            //        Password: Password,
            //        ConfirmPassword: ConfirmPassword
            //    },
            //    success: function (res) {
            //        console.log(1);
            //        alert(1);
            //    },
            //    error: function () {

            //    }
            //})
        })
    });

</script>




