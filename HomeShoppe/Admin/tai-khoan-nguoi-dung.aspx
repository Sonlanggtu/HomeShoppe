<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="tai-khoan-nguoi-dung.aspx.cs" Inherits="HomeShoppe.Admin.tai_khoan_nguoi_dung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="white-box">
                <h3 class="box-title">Quản lí tài khoản người dùng</h3>
            </div>
            <table class="col-lg-12">
                <thead class="thead-dark">
                    <tr class="box-title">
                        <th class="col-lg-2" style="text-align: center" scope="row">Tên Tài Khoản</th>
                        <th class="col-lg-3" style="text-align: center">Email</th>
                        <td class="col-lg-1" style="text-align: center">Số lần đăng nhập sai</td>
                        <td class="col-lg-2" style="text-align: center">Ngày hết hạn tài khoản</td>
                        <td class="col-lg-1" style="text-align: center">Khóa Tài Khoản</td>
                        <th class="col-lg-1" style="text-align: center;">Chức vụ</th>
                        <th class="col-lg-1" style="text-align: center;">#</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="LtTaiKhoanNguoiDung" runat="server"></asp:Literal>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script>

        $(document).ready(function () {

            $('.lock_account_client').off('click').on('click', function () {
                var username = $(this).data('username');
                var xhttp;
                xhttp = new XMLHttpRequest();
                window.location.replace("/Admin/tai-khoan-nguoi-dung/?username=" + username);
                //$.ajax({
                //    url: '/Admin/tai-khoan-nguoi-dung',
                //    type: 'GET',
                //    dataTpye: 'JSON',
                //    data: {
                //        username: username
                //    },

                //})


            })
        })
    </script>
</asp:Content>
