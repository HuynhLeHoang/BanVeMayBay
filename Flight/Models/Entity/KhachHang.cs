namespace Flight.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {
            KhachHang_ChuyenBay = new HashSet<KhachHang_ChuyenBay>();
        }

        [Key]
        [StringLength(10)]
        public string MaKhachHang { get; set; }

        [StringLength(100)]
        public string HoTenKhachHang { get; set; }

        [StringLength(50)]
        public string KhuVuc { get; set; }

        [StringLength(10)]
        public string DienThoai { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string Diachi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhachHang_ChuyenBay> KhachHang_ChuyenBay { get; set; }
    }
}
