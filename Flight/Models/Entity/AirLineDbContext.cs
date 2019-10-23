namespace Flight.Models.Entity
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class AirLineDbContext : DbContext
    {
        public AirLineDbContext()
            : base("name=AirLineDbContext")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<ChuyenBay> ChuyenBays { get; set; }
        public virtual DbSet<HanhKhach> HanhKhaches { get; set; }
        public virtual DbSet<HanhLy> HanhLies { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<MayBay> MayBays { get; set; }
        public virtual DbSet<PhiCong> PhiCongs { get; set; }
        public virtual DbSet<KhachHang_ChuyenBay> KhachHang_ChuyenBay { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChuyenBay>()
                .Property(e => e.UrlAnh)
                .IsUnicode(false);

            modelBuilder.Entity<ChuyenBay>()
                .Property(e => e.PlaneID)
                .IsUnicode(false);

            modelBuilder.Entity<ChuyenBay>()
                .Property(e => e.PilotID1)
                .IsUnicode(false);

            modelBuilder.Entity<ChuyenBay>()
                .Property(e => e.PilotID2)
                .IsUnicode(false);

            modelBuilder.Entity<HanhKhach>()
                .HasMany(e => e.KhachHang_ChuyenBay)
                .WithOptional(e => e.HanhKhach)
                .HasForeignKey(e => e.MaKhachHang);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.DienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<MayBay>()
                .Property(e => e.PlaneID)
                .IsUnicode(false);

            modelBuilder.Entity<PhiCong>()
                .Property(e => e.PilotID)
                .IsUnicode(false);

            modelBuilder.Entity<PhiCong>()
                .HasMany(e => e.ChuyenBays)
                .WithOptional(e => e.PhiCong)
                .HasForeignKey(e => e.PilotID1);
        }
    }
}
