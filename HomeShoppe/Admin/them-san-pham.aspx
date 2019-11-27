<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="them-san-pham.aspx.cs" Inherits="HomeShoppe.Admin.them_san_pham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/ckeditor/styles.js"></script>
    <script src="/ckeditor/ckfinder/ckfinder.js " charset="utf-8"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal ID="LtSanPham" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script>
        $(document).ready(function () {
            $('#form1').validate({
                rules: {
                    TenSanPham: "required",
                    dinhdanh: "required",
                    DanhMucSanPham: {
                        required: true,
                        number:true
                    },
                    HinhAnh: "required",
                    Gia: {
                        required: true,
                        number:true
                    },
                    BaoHanh: {
                        required: true,
                        number:true
                    },
                    MoTa: "required",
                    NoiDung: "required",
                    DoiTra: {
                        required: true,
                        number: true
                    },
                    SPTon: {
                        required: true,
                        number: true
                    }
                },
                messages: {
                    TenSanPham: "Bạn chưa nhập tên sản phẩm",
                    dinhdanh: "bạn chưa nhập định danh sản phẩm",
                    DanhMucSanPham: {
                        required: "bạn chưa nhập danh mục của sản phẩm này",
                        number: "Bạn phải nhập số "
                    },
                    HinhAnh: "bạn chưa chọn ảnh cho sản phẩm",
                    Gia: {
                        required: "Bạn chưa nhập giá cho sản phẩm này",
                        number:"Bạn phải nhập số"
                    },
                    BaoHanh: {
                        required: "Bạn chưa nhập bảo hành cho sản phẩm này",
                        number:"Bạn phải nhập số"
                    },
                    MoTa: "Bạn chưa nhập mô tả cho sản phẩm này",
                    NoiDung: "Bạn chưa nhập nội dung cho sản phẩm này",
                    DoiTra: {
                        required: "Bạn chưa nhập số tháng đổi trả cho sản phẩm này",
                        number:"Bạn phải nhập số"
                    },
                    SPTon: {
                        required: "Bạn chưa nhập số lượng tồn cho sản phẩm",
                        number:"Bạn phải nhập số"
                    }
                }
            })
            $('.btnEditProduct').off('click').on('click', function () {
                if ($('#form1').valid()) {
                    var idCapNhatSP = $('#layidsuaSP').val();
                    var TenSanPham = $('#txtTenSanPham').val();
                    var dinhdanh = $('#txtdinhdanh').val();
                    var DanhMucSanPham = $('#nbDanhMucSanPham').val();
                    var HinhAnh = $('#txthinhanh').val();
                    var Gia = $('#nbGia').val();
                    var GiaKhuyenMai = $('#nbGiaKhuyenMai').val();
                    var BaoHanh = $('#nbBaoHanh').val();
                    var MoTa = CKEDITOR.instances.txtMoTa.getData();
                    var NoiDung = CKEDITOR.instances.txtNoiDung.getData();
                    var LinkVideoDemo = $('#txtLinkVideoDemo').val();
                    var DoiTra = $('#nbDoiTra').val();
                    var SPTon = $('#nbSPTon').val();
                    var TrangThai = $('#TrangThai').prop('checked');
                    $.post("/admin/xoa-sua-san-pham", {
                        idCapNhatSP: idCapNhatSP,
                        TenSanPham: TenSanPham,
                        dinhdanh: dinhdanh,
                        DanhMucSanPham: DanhMucSanPham,
                        HinhAnh: HinhAnh,
                        Gia: Gia,
                        GiaKhuyenMai: GiaKhuyenMai,
                        BaoHanh: BaoHanh,
                        MoTa: MoTa,
                        NoiDung: NoiDung,
                        LinkVideoDemo: LinkVideoDemo,
                        DoiTra: DoiTra,
                        SPTon: SPTon,
                        TrangThai: TrangThai
                    }).done(function (data) {
                        //alert(data);
                        TenSanPham = "";
                        dinhdanh = "";
                        DanhMucSanPham = "";
                        HinhAnh = "";
                        Gia = "";
                        GiaKhuyenMai = "";
                        BaoHanh = "";
                        MoTa = "";
                        NoiDung = "";
                        LinkVideoDemo = "";
                        DoiTra = "";
                        SPTon = "";
                        TrangThai = "";
                        toastr.success('Cập nhất Sản Phẩm thành công!');
                    });
                }
            })



            $('#btnAddProduct').off('click').on('click', function () {
                if ($('#form1').valid()) {
                var TenSanPham = $('#txtTenSanPham').val();
                var dinhdanh = $('#txtdinhdanh').val();
                var DanhMucSanPham = $('#nbDanhMucSanPham').val();
                var HinhAnh = $('#txthinhanh').val();
                var Gia = $('#nbGia').val();
                var GiaKhuyenMai = $('#nbGiaKhuyenMai').val();
                var BaoHanh = $('#nbBaoHanh').val();
                var MoTa = CKEDITOR.instances.txtMoTa.getData();
                var NoiDung = CKEDITOR.instances.txtNoiDung.getData();
                var LinkVideoDemo = $('#txtLinkVideoDemo').val();
                var DoiTra = $('#nbDoiTra').val();
                var SPTon = $('#nbSPTon').val();
                var TrangThai = $('#TrangThai').prop('checked');    
                     $.post("/Admin/them-san-pham", {
                    TenSanPham: TenSanPham,
                    dinhdanh: dinhdanh,
                    DanhMucSanPham: DanhMucSanPham,
                    HinhAnh: HinhAnh,
                    Gia: Gia,
                    GiaKhuyenMai: GiaKhuyenMai,
                    BaoHanh: BaoHanh,
                    MoTa: MoTa,
                    NoiDung: NoiDung,
                    LinkVideoDemo: LinkVideoDemo,
                    DoiTra: DoiTra,
                    SPTon: SPTon,
                    TrangThai: TrangThai

                }).done(function (data) {
                    //alert(data);
                    TenSanPham = "";
                    dinhdanh = "";
                    DanhMucSanPham = "";
                    HinhAnh = "";
                    Gia = "";
                    GiaKhuyenMai = "";
                    BaoHanh = "";
                    MoTa = "";
                    NoiDung = "";
                    LinkVideoDemo = "";
                    DoiTra = "";
                    SPTon = "";
                    TrangThai = "";
                    toastr.success('thêm mới thành công!');
                });
                }
                       
            })
        })
    </script>
</asp:Content>
