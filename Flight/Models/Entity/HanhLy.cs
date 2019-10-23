namespace Flight.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HanhLy")]
    public partial class HanhLy
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HanhLy()
        {
            KhachHang_ChuyenBay = new HashSet<KhachHang_ChuyenBay>();
        }

        [Key]
        [StringLength(10)]
        public string MaHanhLy { get; set; }

        public int? LoaiHanhLy { get; set; }

        public int? GiaTien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhachHang_ChuyenBay> KhachHang_ChuyenBay { get; set; }
    }
}
