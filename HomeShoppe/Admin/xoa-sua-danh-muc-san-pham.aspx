<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="xoa-sua-danh-muc-san-pham.aspx.cs" Inherits="HomeShoppe.Admin.xoa_sua_danh_muc_san_pham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="white-box">
                <h3 class="box-title">Danh Mục Sản Phẩm</h3>
                <a href="/Admin/them-moi-danh-muc-san-pham" class="btn btn-success">Thêm mới</a>
            </div>
            <table class="col-lg-12">
                <thead class="thead-dark">
                    <tr class="box-title">
                        <th class="col-lg-1" style="text-align: center" scope="row">ID</th>
                        <th class="col-lg-1" style="text-align: center">Thể Loại Sản Phẩm</th>
                        <th class="col-lg-1" style="text-align: center">url</th>
                        <th class="col-lg-1" style="text-align: center">Thẻ Từ Khóa</th>
                        <th class="col-lg-2" style="text-align: center">Thẻ Mô Tả</th>
                        <th class="col-lg-3" style="text-align: center;">Mô Tả Danh Mục</th>
                        <th class="col-lg-1">Trạng Thái</th>
                        <th class="col-lg-1" colspan="2" style="text-align: center;">#</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="LtProductCategory" runat="server"></asp:Literal>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script src="/assets/Admin/jsHome/Edit_Del_ProductCategory.js"></script>
</asp:Content>
