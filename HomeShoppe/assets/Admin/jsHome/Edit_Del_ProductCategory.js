
    $('.modify_PCategory').off('click').on('click', function () {
            var guiID = $(this).data('id');
    var xhttp;
    xhttp = new XMLHttpRequest();
    window.location.replace("/Admin/them-moi-danh-muc-san-pham?suadanhmucsp=" + guiID);
});
$('.Delete_PCategory').off('click').on('click', function () {
    var guiID = $(this).data('id');
    var xhttp;
    xhttp = new XMLHttpRequest();
    window.location.replace("/Admin/xoa-sua-danh-muc-san-pham/Del_ProductCategory?xoadanhmucsp=" + guiID);
});
