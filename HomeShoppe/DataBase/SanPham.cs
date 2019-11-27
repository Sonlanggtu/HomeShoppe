namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietDatHangs = new HashSet<ChiTietDatHang>();
            ChucNangNguoiDungs = new HashSet<ChucNangNguoiDung>();
            Tags = new HashSet<Tag>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string TenSanPham { get; set; }

        [Required]
        [StringLength(256)]
        public string DinhDanh { get; set; }

        public int IDDanhMucSanPham { get; set; }

        [Required]
        [StringLength(256)]
        public string HinhAnh { get; set; }

        [Column(TypeName = "xml")]
        public string NhieuAnhHon { get; set; }

        public decimal Gia { get; set; }

        public decimal? GiaKhuyenMai { get; set; }

        public int BaoHanh { get; set; }

        [Required]
        [StringLength(4000)]
        public string MoTa { get; set; }

        [Required]
        public string NoiDung { get; set; }

        public bool? TrangChu { get; set; }

        public int? DemLuotXem { get; set; }

        public DateTime NgayTao { get; set; }

        [StringLength(256)]
        public string NguoiTao { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        [StringLength(256)]
        public string NguoiCapNhat { get; set; }

        [StringLength(256)]
        public string TheTuKhoa { get; set; }

        [StringLength(256)]
        public string TheMoTa { get; set; }

        public bool TrangThai { get; set; }

        [StringLength(500)]
        public string LinkYoutubeProduct { get; set; }

        public int? DoiTra { get; set; }

        public int SoLuongHang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDatHang> ChiTietDatHangs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChucNangNguoiDung> ChucNangNguoiDungs { get; set; }

        public virtual DanhMucSanPham DanhMucSanPham { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tag> Tags { get; set; }
    }
}
