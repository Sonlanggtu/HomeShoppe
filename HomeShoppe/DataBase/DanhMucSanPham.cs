namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMucSanPham")]
    public partial class DanhMucSanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DanhMucSanPham()
        {
            SanPhams = new HashSet<SanPham>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string TheLoaiSP { get; set; }

        [StringLength(500)]
        public string MoTa { get; set; }

        [StringLength(256)]
        public string TheTuKhoa { get; set; }

        [StringLength(256)]
        public string Url { get; set; }

        [StringLength(256)]
        public string TheMoTa { get; set; }

        public bool? TrangThaiDM { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}
