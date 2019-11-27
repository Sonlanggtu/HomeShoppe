namespace HomeShoppe.DataBase
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ConnectionDBContext : DbContext
    {
        public ConnectionDBContext()
            : base("name=ConnectionDBContext")
        {
        }

        public virtual DbSet<BaiDang> BaiDangs { get; set; }
        public virtual DbSet<ChiTietDatHang> ChiTietDatHangs { get; set; }
        public virtual DbSet<ChucNangNguoiDung> ChucNangNguoiDungs { get; set; }
        public virtual DbSet<DanhMucSanPham> DanhMucSanPhams { get; set; }
        public virtual DbSet<DatHang> DatHangs { get; set; }
        public virtual DbSet<Error> Errors { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<Header> Headers { get; set; }
        public virtual DbSet<HoTroOnline> HoTroOnlines { get; set; }
        public virtual DbSet<LoaiBaiDang> LoaiBaiDangs { get; set; }
        public virtual DbSet<MenuGroup> MenuGroups { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<SystemConfig> SystemConfigs { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThongKeKhachTruyCap> ThongKeKhachTruyCaps { get; set; }
        public virtual DbSet<ThongTinCuaHang> ThongTinCuaHangs { get; set; }
        public virtual DbSet<ThongTinNguoiDung> ThongTinNguoiDungs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BaiDang>()
                .Property(e => e.DinhDanh)
                .IsUnicode(false);

            modelBuilder.Entity<BaiDang>()
                .HasMany(e => e.Tags)
                .WithMany(e => e.BaiDangs)
                .Map(m => m.ToTable("TagBaiDang").MapLeftKey("IDBaiDang").MapRightKey("TagID"));

            modelBuilder.Entity<ChiTietDatHang>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChucNangNguoiDung>()
                .Property(e => e.TenTaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<DanhMucSanPham>()
                .HasMany(e => e.SanPhams)
                .WithRequired(e => e.DanhMucSanPham)
                .HasForeignKey(e => e.IDDanhMucSanPham);

            modelBuilder.Entity<DatHang>()
                .HasMany(e => e.ChiTietDatHangs)
                .WithRequired(e => e.DatHang)
                .HasForeignKey(e => e.IDDatHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LoaiBaiDang>()
                .Property(e => e.DinhDanh)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiBaiDang>()
                .HasMany(e => e.BaiDangs)
                .WithRequired(e => e.LoaiBaiDang)
                .HasForeignKey(e => e.IDLoaiBaiDang);

            modelBuilder.Entity<MenuGroup>()
                .HasMany(e => e.Menus)
                .WithRequired(e => e.MenuGroup)
                .HasForeignKey(e => e.GroupID);

            modelBuilder.Entity<Page>()
                .Property(e => e.DinhDang)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaKhuyenMai)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.LinkYoutubeProduct)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietDatHangs)
                .WithRequired(e => e.SanPham)
                .HasForeignKey(e => e.IDSanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChucNangNguoiDungs)
                .WithRequired(e => e.SanPham)
                .HasForeignKey(e => e.IDSanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.Tags)
                .WithMany(e => e.SanPhams)
                .Map(m => m.ToTable("TagsSanPham").MapLeftKey("IDSanPham").MapRightKey("TagID"));

            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.DoanMa)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TenTaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.PasswordMaHoa)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.ChucVu)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.ThongTinNguoiDungs)
                .WithRequired(e => e.TaiKhoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThongTinCuaHang>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinCuaHang>()
                .Property(e => e.Logo)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinCuaHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinNguoiDung>()
                .Property(e => e.TenTaiKhoan)
                .IsUnicode(false);
        }
    }
}
