namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Menu
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string TenTrang { get; set; }

        [Required]
        [StringLength(256)]
        public string URL { get; set; }

        public int? ThuTuHienThi { get; set; }

        public int GroupID { get; set; }

        public bool TrangThai { get; set; }

        public virtual MenuGroup MenuGroup { get; set; }
    }
}
