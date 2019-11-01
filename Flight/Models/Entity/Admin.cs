namespace Flight.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Admin")]
    public partial class Admin
    {
        [Key]
        [StringLength(10)]
        public string MaThanhVien { get; set; }

        [StringLength(50)]
        public string TenThanhVien { get; set; }

        [StringLength(50)]
        public string Lop { get; set; }

        [StringLength(20)]
        public string UserName { get; set; }

        [StringLength(20)]
        public string Password { get; set; }
        [StringLength(20)]
        public string Role { get; set; }
    }
}
