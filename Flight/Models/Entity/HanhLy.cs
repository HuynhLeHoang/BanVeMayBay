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
            HanhKhaches = new HashSet<HanhKhach>();
        }

        [Key]
        [StringLength(3)]
        public string MaHanhLy { get; set; }

        public int? LoaiHanhLy { get; set; }

        public int? GiaTien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HanhKhach> HanhKhaches { get; set; }
    }
}
