namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongKeKhachTruyCap")]
    public partial class ThongKeKhachTruyCap
    {
        public Guid ID { get; set; }

        public DateTime NgayTruyCap { get; set; }

        [StringLength(50)]
        public string DiaChiIP { get; set; }
    }
}
