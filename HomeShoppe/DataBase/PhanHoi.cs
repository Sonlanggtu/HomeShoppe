namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoi")]
    public partial class PhanHoi
    {
        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string HoTenKhachHang { get; set; }

        [Required]
        [StringLength(256)]
        public string EmailKhachHang { get; set; }

        [Required]
        [StringLength(50)]
        public string SDTKhachHang { get; set; }

        [Required]
        [StringLength(256)]
        public string LoiNhanKhachHang { get; set; }

        [Required]
        [StringLength(200)]
        public string Tieude { get; set; }

        public DateTime NgayTao { get; set; }
    }
}
