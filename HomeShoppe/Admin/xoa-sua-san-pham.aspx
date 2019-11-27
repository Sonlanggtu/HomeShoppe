<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" ValidateRequest="false" AutoEventWireup="true"  CodeBehind="xoa-sua-san-pham.aspx.cs" Inherits="HomeShoppe.Admin.xoa_sua_san_pham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-lg-12">
            <div class="white-box">
                <h3 class="box-title">Quản lí Sản Phẩm</h3>
                <a href="/Admin/them-san-pham" class="btn btn-success">Thêm mới</a>
            </div>
            <table class="col-lg-12">
                <thead class="thead-dark">
                    <tr class="box-title">
                        <th class="col-lg-2" style="text-align: center">Tên SP</th>
                        <th class="col-lg-1" style="text-align: center">Định Danh</th>
                        <th class="col-lg-1" style="text-align: center">ID DanhMucSP</th>
                        <th class="col-lg-2" style="text-align: center">Hình Ảnh</th>
                        <th class="col-lg-1" style="text-align: center;">Giá</th>
                        <th class="col-lg-1" style="text-align: center;">Giá KM</th>
                        <th class="col-lg-1" style="text-align: center;">Bảo Hành</th>
                        <th class="col-lg-3" style="text-align: center;">Mô Tả</th>
                        <th class="col-lg-3" style="text-align: center;">Nội dung</th>
                        <th class="col-lg-1" style="text-align: center;">Đếm lượt xem</th>         
                        <th class="col-lg-1" style="text-align: center;">Ngày Tạo</th>                  
                        <th class="col-lg-1" style="text-align: center;">Trạng Thái</th>
                        <th class="col-lg-2" style="text-align: center;">Link DemoSP</th>
                        <th class="col-lg-1" style="text-align: center;">Đổi trả</th>
                        <th class="col-lg-1" style="text-align: center;">SL Tồn</th>
                        <th class="col-lg-1" style="text-align: center;" colspan="2">#</th>   
                    </tr>
                </thead>
                <tbody>
                    <asp:Literal ID="LtDocSanPham" runat="server"></asp:Literal>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script>
        $(document).ready(function () {
            $('.xoa_sp').off('click').on('click', function () {
                var idsp = $(this).data('id');   
                  window.location.href = '/admin/xoa-sua-san-pham?idxoasp='+idsp               
                })
       $('.sua_sp').off('click').on('click', function () {
                var idsuasp = $(this).data('id');   
                  window.location.href = '/admin/them-san-pham?idsuasp='+idsuasp               
                })
            })
    </script>
</asp:Content>
