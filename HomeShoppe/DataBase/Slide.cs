namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Slide
    {
        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string TenSanPham { get; set; }

        [StringLength(256)]
        public string MoTa { get; set; }

        [StringLength(256)]
        public string HinhAnh { get; set; }

        [StringLength(256)]
        public string Url { get; set; }

        public int? ThuTuHienThi { get; set; }

        public string TieuDe1 { get; set; }

        public string TieuDe3 { get; set; }

        public string TieuDe2 { get; set; }

        public bool TrangThai { get; set; }

        public int IDSanPham { get; set; }
    }
}
