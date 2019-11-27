namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChucNangNguoiDung")]
    public partial class ChucNangNguoiDung
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string TenTaiKhoan { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDSanPham { get; set; }

        [StringLength(500)]
        public string BinhLuan { get; set; }

        public bool? Camxuc { get; set; }

        public bool? GioHangYeuThich { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
