namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TaiKhoan()
        {
            ThongTinNguoiDungs = new HashSet<ThongTinNguoiDung>();
        }

        [Key]
        [StringLength(50)]
        public string TenTaiKhoan { get; set; }

        [Required]
        [StringLength(30)]
        public string Email { get; set; }

        [Required]
        [StringLength(50)]
        public string PasswordMaHoa { get; set; }

        public int SoLanDangNhapSai { get; set; }

        public bool KhoaTaiKhoan { get; set; }

        public DateTime? NgayTaiKhoanHetHan { get; set; }

        [Required]
        [StringLength(20)]
        public string ChucVu { get; set; }

        public bool XacDinhQuanTri { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ThongTinNguoiDung> ThongTinNguoiDungs { get; set; }
    }
}
