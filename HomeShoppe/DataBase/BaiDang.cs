namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BaiDang")]
    public partial class BaiDang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BaiDang()
        {
            Tags = new HashSet<Tag>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string TenBaiViet { get; set; }

        [Required]
        [StringLength(256)]
        public string DinhDanh { get; set; }

        public int IDLoaiBaiDang { get; set; }

        [StringLength(256)]
        public string HinhAnh { get; set; }

        [StringLength(500)]
        public string MoTa { get; set; }

        public string NoiDung { get; set; }

        public bool? TrangChu { get; set; }

        public int? DemLuotXem { get; set; }

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

        public virtual LoaiBaiDang LoaiBaiDang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tag> Tags { get; set; }
    }
}
