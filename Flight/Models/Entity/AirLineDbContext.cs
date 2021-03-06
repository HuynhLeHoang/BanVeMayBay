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
        public virtual DbSet<Role> Roles { set; get; }
        public virtual DbSet<Credential> Credentials { set; get; }
        public virtual DbSet<UserGroup> UserGroups { set; get; }
        public virtual DbSet<ThanhToan> ThanhToans { set; get; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Admin>()
                .Property(e => e.GroupID)
                .IsUnicode(false);

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
                .Property(e => e.MaHanhLy)
                .IsUnicode(false);

            modelBuilder.Entity<HanhKhach>()
                .HasMany(e => e.KhachHang_ChuyenBay)
                .WithOptional(e => e.HanhKhach)
                .HasForeignKey(e => e.MaKhachHang);

            modelBuilder.Entity<HanhLy>()
                .Property(e => e.MaHanhLy)
                .IsUnicode(false);

            modelBuilder.Entity<HanhLy>()
                .Property(e => e.TenHanhLy)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.DienThoai)
                .IsFixedLength();

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Email)
                .IsFixedLength();

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
