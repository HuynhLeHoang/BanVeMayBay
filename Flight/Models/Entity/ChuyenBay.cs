namespace Flight.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChuyenBay")]
    public partial class ChuyenBay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChuyenBay()
        {
            KhachHang_ChuyenBay = new HashSet<KhachHang_ChuyenBay>();
        }

        [StringLength(50)]
        public string Title { get; set; }

        [Column(TypeName = "text")]
        public string UrlAnh { get; set; }

        [Key]
        [StringLength(10)]
        public string MaChuyenBay { get; set; }

        [StringLength(100)]
        public string DiemDi { get; set; }

        [StringLength(100)]
        public string DiemDen { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Ngay { get; set; }

        [Column("ChuyenBay")]
        [StringLength(50)]
        public string ChuyenBay1 { get; set; }

        [StringLength(10)]
        public string KhoiHanh { get; set; }

        [StringLength(10)]
        public string Den { get; set; }

        public int? Gia { get; set; }

        public int? Thue { get; set; }

        public int? GiaTreEm { get; set; }

        public int? ThueTreEm { get; set; }

        public int? GiaVeTreSoSinh { get; set; }

        public int? SoChoConTrong { get; set; }

        [StringLength(10)]
        public string PlaneID { get; set; }

        [StringLength(10)]
        public string PilotID1 { get; set; }

        [StringLength(10)]
        public string PilotID2 { get; set; }

        public virtual MayBay MayBay { get; set; }

        public virtual PhiCong PhiCong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhachHang_ChuyenBay> KhachHang_ChuyenBay { get; set; }
    }
}
