namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongTinNguoiDung")]
    public partial class ThongTinNguoiDung
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string TenTaiKhoan { get; set; }

        public string SDT { get; set; }

        [StringLength(256)]
        public string Hoten { get; set; }

        [StringLength(256)]
        public string DiaChi { get; set; }

        public DateTime? NgaySinh { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
