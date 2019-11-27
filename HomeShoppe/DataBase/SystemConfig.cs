namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SystemConfig
    {
        public int ID { get; set; }

        [Required]
        [StringLength(50)]
        public string DoanMa { get; set; }

        [StringLength(50)]
        public string GiaTriString { get; set; }

        public int? GiaTriINT { get; set; }
    }
}
