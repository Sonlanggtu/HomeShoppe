namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Header")]
    public partial class Header
    {
        [StringLength(50)]
        public string ID { get; set; }

        [Required]
        public string NoiDung { get; set; }
    }
}
