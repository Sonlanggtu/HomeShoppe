<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="chi-tiet-giao-hang.aspx.cs" Inherits="HomeShoppe.Admin.chi_tiet_giao_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="white-box">
                <h3 class="box-title">Static</h3>
            </div>
            <table class="col-lg-12">
                <thead class="thead-dark">
                    <tr class="box-title">
                        <th class="col-lg-1" style="text-align: center" scope="row">ID Đặt Hàng</th>
                        <th class="col-lg-2" style="text-align: center">Họ và Tên</th>
                        <td class="col-lg-3" style="text-align: center">Địa Chỉ</td>
                        <td class="col-lg-2" style="text-align: center">Email</td>
                        <td class="col-lg-2" style="text-align: center">Số Điện Thoại</td>
                        <th class="col-lg-2" style="text-align: center;">Ngày Tạo</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="LtChiTietGiaoHang" runat="server"></asp:Literal>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
