namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DatHang")]
    public partial class DatHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DatHang()
        {
            ChiTietDatHangs = new HashSet<ChiTietDatHang>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string HoTenKhachHang { get; set; }

        [Required]
        [StringLength(256)]
        public string DiaChiKhachHang { get; set; }

        [Required]
        [StringLength(256)]
        public string EmailKhachHang { get; set; }

        [Required]
        [StringLength(50)]
        public string SDTKhachHang { get; set; }

        [StringLength(256)]
        public string LoiNhanKhachHang { get; set; }

        [StringLength(256)]
        public string PhuongThucThanhToan { get; set; }

        public DateTime? NgayTao { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietDatHang> ChiTietDatHangs { get; set; }
    }
}
