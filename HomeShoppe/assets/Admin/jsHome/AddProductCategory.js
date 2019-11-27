<script>
    $(document).ready(function () {
        $('#btnEditProductCageroy').off('click').on('click', function () {
            xhttp = new XMLHttpRequest();
            window.location.replace("/Admin/xoa-sua-danh-muc-san-pham?idproductcategory=41");
        });
    $('#btnAddProductCageroy').off('click').on('click', function () {
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
                    success: function () {

    }
    })
});


            //  $('#btnEditProductCageroy').off('click').on('click', function () {
        //    window.location.href('/Admin/xoa-sua-danh-muc-san-pham?idproductcategory=' + 42);
        //    var TheLoaiSP = $('#txtTheLoaiSP').val();
        //    var url = $('#txturl').val();
        //    var TheTuKhoa = $('#txtTheTuKhoa').val();
        //    var TheMoTa = $('#txtTheMoTa').val();
        //    var MoTaDanhMuc = $('#txtMoTaDanhMuc').val();
        //    var TrangThai = $('#TrangThai').prop('checked');
        //    var idproductcategory = $('#id_sua_productcategory').val();
        //    var xhttp;
        //    xhttp = new XMLHttpRequest();
        //    window.location.replace("/Admin/xoa-sua-danh-muc-san-pham");
        //})
    })
</script>
