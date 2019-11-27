namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongTinCuaHang")]
    public partial class ThongTinCuaHang
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [StringLength(50)]
        public string TenCuaHang { get; set; }

        [StringLength(20)]
        public string SDT { get; set; }

        [StringLength(100)]
        public string Logo { get; set; }

        [StringLength(50)]
        public string ViTri { get; set; }

        [StringLength(50)]
        public string ThoiGianLamViec { get; set; }

        [StringLength(50)]
        public string Email { get; set; }
    }
}
