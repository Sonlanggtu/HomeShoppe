namespace HomeShoppe.DataBase
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Error
    {
        public int ID { get; set; }

        public string ThongBao { get; set; }

        public string StackTrace { get; set; }

        public DateTime NgayTao { get; set; }
    }
}
