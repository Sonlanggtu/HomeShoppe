<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="them-moi-danh-muc-san-pham.aspx.cs" Inherits="HomeShoppe.Admin.them_moi_danh_muc_san_pham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal ID="LtAddProductCategory" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script>
        $('#form1').validate({
            rules: {
                TheLoaiSP: "required",
                url: "required",
                TheTuKhoa: "required",
                TheMoTa: "required",
                MoTaDanhMuc: "required",

            },
            messages: {
                TheLoaiSP: "Bạn chưa nhập tên thể loại danh mục",
                url: "Bạn chưa nhập đường dẫn url danh mục",
                TheTuKhoa: "Bạn chưa nhập thẻ từ khóa",
                TheMoTa: "Bạn chưa nhập thẻ mô tả",
                MoTaDanhMuc:"Bạn chưa nhập nội dung mô tả danh mục"
            }
        })
        $('.btnEditProductCategory').off('click').on('click', function () {
            if ($('#form1').valid()) {
                var TheLoaiSP = $('#txtTheLoaiSP').val();
            var url = $('#txturl').val();
            var TheTuKhoa = $('#txtTheTuKhoa').val();
            var TheMoTa = $('#txtTheMoTa').val();
            var MoTaDanhMuc = $('#txtMoTaDanhMuc').val();
            var TrangThai = $('#TrangThai').prop('checked');
            var idproductcategory = $('#id_sua_productcategory').val();
            var xhttp;
            xhttp = new XMLHttpRequest();
            window.location.replace("/Admin/xoa-sua-danh-muc-san-pham?idproductcategory=" + idproductcategory + "&TheLoaiSP=" + TheLoaiSP
                + "&url=" + url + "&TheTuKhoa=" + TheTuKhoa + "&TheMoTa=" + TheMoTa + "&MoTaDanhMuc=" + MoTaDanhMuc + "&TrangThai=" + TrangThai);
            }
            
        });
        $('#btnAddProductCageroy').off('click').on('click', function () {
            if ($('#form1').valid()) {
            var TheLoaiSP = $('#txtTheLoaiSP').val();
            var url = $('#txturl').val();
            var TheTuKhoa = $('#txtTheTuKhoa').val();
            var TheMoTa = $('#txtTheMoTa').val();
            var MoTaDanhMuc = $('#txtMoTaDanhMuc').val();
            var TrangThai = $('#TrangThai').prop('checked');
            $.ajax({
                url: '/Admin/them-moi-danh-muc-san-pham',
                type: 'POST',
                dataType: 'JSON',
                data: {
                    TheLoaiSP: TheLoaiSP,
                    url: url,
                    TheTuKhoa: TheTuKhoa,
                    TheMoTa: TheMoTa,
                    MoTaDanhMuc: MoTaDanhMuc,
                    TrangThai: TrangThai
                },
                success: function (data) {
                  //alert(1);
                    toastr.success('thêm mới thành công');
                }
            })
            }
             
        });

    </script>

</asp:Content>
