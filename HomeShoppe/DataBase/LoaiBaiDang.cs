namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiBaiDang")]
    public partial class LoaiBaiDang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiBaiDang()
        {
            BaiDangs = new HashSet<BaiDang>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string TenTheLoai { get; set; }

        [Required]
        [StringLength(256)]
        public string DinhDanh { get; set; }

        [StringLength(500)]
        public string MoTa { get; set; }

        public int? ThuTuHienThi { get; set; }

        [StringLength(256)]
        public string HinhAnh { get; set; }

        public bool? TrangChu { get; set; }

        public DateTime? NgayTao { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BaiDang> BaiDangs { get; set; }
    }
}
