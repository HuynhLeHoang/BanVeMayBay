namespace Flight.Models.Entity
{
    using System;
    using System.Collections;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HanhKhach")]
    public partial class HanhKhach : IEnumerable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HanhKhach()
        {
            KhachHang_ChuyenBay = new HashSet<KhachHang_ChuyenBay>();
        }

        [Key]
        [StringLength(10)]
        public string MaHanhKhach { get; set; }

        [StringLength(3)]
        public string GioiTinh { get; set; }

        [StringLength(50)]
        public string HoTen { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        [StringLength(3)]
        public string MaHanhLy { get; set; }

        public virtual HanhLy HanhLy { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<KhachHang_ChuyenBay> KhachHang_ChuyenBay { get; set; }

        public IEnumerator GetEnumerator()
        {
            return ((IEnumerable)KhachHang_ChuyenBay).GetEnumerator();
        }
    }
}
