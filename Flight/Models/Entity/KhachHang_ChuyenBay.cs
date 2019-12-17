namespace Flight.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class KhachHang_ChuyenBay
    {
        [StringLength(10)]
        public string MaKhachHang { get; set; }

        [StringLength(10)]
        public string MaChuyenBay { get; set; }

        [Key]
        [StringLength(10)]
        public string MaCode { get; set; }

        public int? TongTien { get; set; }
        public DateTime NgayDatVe { get; set; }
        public DateTime NgayBay { set; get; }
        public virtual ChuyenBay ChuyenBay { get; set; }

        public virtual HanhKhach HanhKhach { get; set; }
    }
}
