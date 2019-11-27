namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Page
    {
        public int ID { get; set; }

        [Required]
        [StringLength(256)]
        public string TenTrang { get; set; }

        [Required]
        [StringLength(256)]
        public string DinhDang { get; set; }

        public string NoiDung { get; set; }

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
    }
}
