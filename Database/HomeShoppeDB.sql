USE [master]
GO
/****** Object:  Database [HomeShoppe]    Script Date: 11/27/2019 6:14:59 PM ******/
CREATE DATABASE [HomeShoppe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebbanLaptop', FILENAME = N'F:\Setup\SQL Server\Root directory\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebbanLaptop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebbanLaptop_log', FILENAME = N'F:\Setup\SQL Server\Root directory\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebbanLaptop_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HomeShoppe] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeShoppe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeShoppe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeShoppe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeShoppe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeShoppe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeShoppe] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeShoppe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeShoppe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeShoppe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeShoppe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeShoppe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeShoppe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeShoppe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeShoppe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeShoppe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeShoppe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HomeShoppe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeShoppe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeShoppe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeShoppe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeShoppe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeShoppe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeShoppe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeShoppe] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeShoppe] SET  MULTI_USER 
GO
ALTER DATABASE [HomeShoppe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeShoppe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeShoppe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeShoppe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomeShoppe] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HomeShoppe', N'ON'
GO
ALTER DATABASE [HomeShoppe] SET QUERY_STORE = OFF
GO
USE [HomeShoppe]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [HomeShoppe]
GO
/****** Object:  User [DamNgocSon]    Script Date: 11/27/2019 6:15:00 PM ******/
CREATE USER [DamNgocSon] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[BaiDang]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiDang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiViet] [nvarchar](256) NOT NULL,
	[DinhDanh] [varchar](256) NOT NULL,
	[IDLoaiBaiDang] [int] NOT NULL,
	[HinhAnh] [nvarchar](256) NULL,
	[MoTa] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[TrangChu] [bit] NULL,
	[DemLuotXem] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](256) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](256) NULL,
	[TheTuKhoa] [nvarchar](256) NULL,
	[TheMoTa] [nvarchar](256) NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDatHang]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDatHang](
	[Gia] [decimal](18, 0) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[IDDatHang] [int] NOT NULL,
	[IDSanPham] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDatHang] PRIMARY KEY CLUSTERED 
(
	[IDDatHang] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucNangNguoiDung]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNangNguoiDung](
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[IDSanPham] [int] NOT NULL,
	[BinhLuan] [nvarchar](500) NULL,
	[Camxuc] [bit] NULL,
	[GioHangYeuThich] [bit] NULL,
 CONSTRAINT [PK_ChucNangNguoiDung_1] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TheLoaiSP] [nvarchar](256) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
	[TheTuKhoa] [nvarchar](256) NULL,
	[Url] [nvarchar](256) NULL,
	[TheMoTa] [nvarchar](256) NULL,
	[TrangThaiDM] [bit] NULL,
 CONSTRAINT [PK_dbo.ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKhachHang] [nvarchar](256) NOT NULL,
	[DiaChiKhachHang] [nvarchar](256) NOT NULL,
	[EmailKhachHang] [nvarchar](256) NOT NULL,
	[SDTKhachHang] [nvarchar](50) NOT NULL,
	[LoiNhanKhachHang] [nvarchar](256) NULL,
	[PhuongThucThanhToan] [nvarchar](256) NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errors]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThongBao] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[NgayTao] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Errors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footers]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footers](
	[ID] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Footers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Header]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Header](
	[ID] [nvarchar](50) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Header] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoTroOnline]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoTroOnline](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[BoPhanHoTro] [nvarchar](50) NULL,
	[Skype] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Facebook] [nvarchar](50) NULL,
	[TrangThai] [bit] NOT NULL,
	[ThuTuHienThi] [int] NULL,
 CONSTRAINT [PK_dbo.SupportOnlines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiBaiDang]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBaiDang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](256) NOT NULL,
	[DinhDanh] [varchar](256) NOT NULL,
	[MoTa] [nvarchar](500) NULL,
	[ThuTuHienThi] [int] NULL,
	[HinhAnh] [nvarchar](256) NULL,
	[TrangChu] [bit] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](256) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](256) NULL,
	[TheTuKhoa] [nvarchar](256) NULL,
	[TheMoTa] [nvarchar](256) NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.PostCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuGroups]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhomTrang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.MenuGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NOT NULL,
	[URL] [nvarchar](256) NOT NULL,
	[ThuTuHienThi] [int] NULL,
	[GroupID] [int] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](256) NOT NULL,
	[DinhDang] [varchar](256) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](256) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](256) NULL,
	[TheTuKhoa] [nvarchar](256) NULL,
	[TheMoTa] [nvarchar](256) NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Pages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKhachHang] [nvarchar](256) NOT NULL,
	[EmailKhachHang] [nvarchar](256) NOT NULL,
	[SDTKhachHang] [nvarchar](50) NOT NULL,
	[LoiNhanKhachHang] [nvarchar](256) NOT NULL,
	[Tieude] [nvarchar](200) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](256) NOT NULL,
	[DinhDanh] [nvarchar](256) NOT NULL,
	[IDDanhMucSanPham] [int] NOT NULL,
	[HinhAnh] [nvarchar](256) NULL,
	[NhieuAnhHon] [xml] NULL,
	[Gia] [decimal](18, 0) NOT NULL,
	[GiaKhuyenMai] [decimal](18, 0) NULL,
	[BaoHanh] [int] NULL,
	[MoTa] [nvarchar](4000) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[TrangChu] [bit] NULL,
	[DemLuotXem] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](256) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NguoiCapNhat] [nvarchar](256) NULL,
	[TheTuKhoa] [nvarchar](256) NULL,
	[TheMoTa] [nvarchar](256) NULL,
	[TrangThai] [bit] NOT NULL,
	[LinkYoutubeProduct] [varchar](500) NULL,
	[DoiTra] [int] NULL,
	[SoLuongHang] [int] NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](256) NOT NULL,
	[MoTa] [nvarchar](256) NULL,
	[HinhAnh] [nvarchar](256) NULL,
	[Url] [nvarchar](256) NULL,
	[ThuTuHienThi] [int] NULL,
	[TieuDe1] [nvarchar](max) NULL,
	[TieuDe3] [nvarchar](max) NULL,
	[TieuDe2] [nvarchar](max) NULL,
	[TrangThai] [bit] NOT NULL,
	[IDSanPham] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Slides] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfigs]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfigs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DoanMa] [varchar](50) NOT NULL,
	[GiaTriString] [nvarchar](50) NULL,
	[GiaTriINT] [int] NULL,
 CONSTRAINT [PK_dbo.SystemConfigs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagBaiDang]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagBaiDang](
	[IDBaiDang] [int] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.PostTags] PRIMARY KEY CLUSTERED 
(
	[IDBaiDang] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [varchar](50) NOT NULL,
	[TenTag] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsSanPham]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsSanPham](
	[IDSanPham] [int] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.ProductTags] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[PasswordMaHoa] [varchar](50) NOT NULL,
	[SoLanDangNhapSai] [int] NOT NULL,
	[KhoaTaiKhoan] [bit] NOT NULL,
	[NgayTaiKhoanHetHan] [datetime] NULL,
	[ChucVu] [varchar](20) NOT NULL,
	[XacDinhQuanTri] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan_1] PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongKeKhachTruyCap]    Script Date: 11/27/2019 6:15:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKeKhachTruyCap](
	[ID] [uniqueidentifier] NOT NULL,
	[NgayTruyCap] [datetime] NOT NULL,
	[DiaChiIP] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.VisitorStatistics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinCuaHang]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinCuaHang](
	[ID] [int] NOT NULL,
	[TenCuaHang] [nvarchar](50) NULL,
	[SDT] [varchar](20) NULL,
	[Logo] [varchar](100) NULL,
	[ViTri] [nvarchar](50) NULL,
	[ThoiGianLamViec] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_ThongTinCuaHang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinNguoiDung]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinNguoiDung](
	[ID] [int] NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[SDT] [nvarchar](max) NULL,
	[Hoten] [nvarchar](256) NULL,
	[DiaChi] [nvarchar](256) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_ThongTinNguoiDung] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiDang] ON 

INSERT [dbo].[BaiDang] ([ID], [TenBaiViet], [DinhDanh], [IDLoaiBaiDang], [HinhAnh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (1, N'“Asus ROG Strix SCAR II” hiệu năng cực đỉnh với phiên bản card đồ họa RTX', N'asus-rog-strix-scar-ii-hieu-nang-cuc-tot-voi-phien-ban-card-do-hoa-rtx', 1, N'/assets/Client/images/Asus_ROG_Strix_SCAR_II\1.jpeg', N'Laptop gaming Asus ROG Strix SCAR II chắc hẳn không còn quá xa lạ gì đối với các anh em game thủ, được thừa hưởng toàn bộ những đặc điểm nổi bật cùng các công nghệ mới nhất đến từ Asus năm nay Asus đã quyết định nâng cấp sản phẩm ROG Strix SCAR II của mình lên một tầm cao mới, qua đó về ngoại hình', NULL, NULL, 240, CAST(N'2019-03-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'asus gaming', NULL, 1)
INSERT [dbo].[BaiDang] ([ID], [TenBaiViet], [DinhDanh], [IDLoaiBaiDang], [HinhAnh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (2, N'Top 7 Tivi 49 inch bán chạy nhất Điện máy XANH tháng 02-2019', N'top-7-tivi-49k-ban-chay-nhat-dien-may-xanh-thang-0', 2, N'/assets/Client/images/top-7-tivi-49k-ban-chay-nhat-dien-may-xanh-thang-0/top7tivi49inch.jpeg', N'Bạn muốn mua cho gia đình chiếc tivi màn hình khủng nhưng vẫn chưa biết chọn loại nào. Vậy hãy tham khảo qua top 7 Tivi 49 inch bán chạy nhất Điện máy XANH tháng 02 - 2019 dưới đây để có lựa chọn tốt nhất nhé!', NULL, NULL, 114, CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'Minh', NULL, NULL, N'top tivi 2019', NULL, 1)
INSERT [dbo].[BaiDang] ([ID], [TenBaiViet], [DinhDanh], [IDLoaiBaiDang], [HinhAnh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (3, N'Cận cảnh Xiaomi Black Shark 2  Siêu phẩm gaming phone đẹp khó cưỡng Sforum', N'can-canh-xiaomi-black-shark-2--sieu-pham-gaming-phone-dep-kho-cuong', 3, N'/assets/Client/images/can-canh-xiaomi-black-shark-2--sieu-pham-gaming-phone-dep-kho-cuong/BlackShark2-2.jpeg', N'Xiaomi hôm qua vừa chính thức trình làng siêu phẩm chơi game tiếp theo của hãng, có tên gọi là Black Shark 2. Điện thoại này không chỉ có cấu hình thuộc loại mạnh nhất thế giới Android mà còn sở hữu thiết kế vô cùng ấn tượng, đậm chất gaming và đi kèm giá bán vô cùng hấp dẫn, hứa hẹn sẽ là một đối thủ đáng gờm với bất kỳ mẫu smartphone cao cấp nào trên thị trường hiện nay.', NULL, NULL, 189, CAST(N'2019-03-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'Xiaomi Black Shark', NULL, 1)
SET IDENTITY_INSERT [dbo].[BaiDang] OFF
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 10, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(15000000 AS Decimal(18, 0)), 1, 10, 11)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(15000000 AS Decimal(18, 0)), 1, 11, 11)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(19500000 AS Decimal(18, 0)), 1, 11, 34)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(8200000 AS Decimal(18, 0)), 1, 11, 48)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 13, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 14, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 15, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 16, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 17, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(10000000 AS Decimal(18, 0)), 1, 18, 6)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(15000000 AS Decimal(18, 0)), 1, 19, 11)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(15000000 AS Decimal(18, 0)), 1, 20, 11)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(15000000 AS Decimal(18, 0)), 1, 21, 11)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(6999999 AS Decimal(18, 0)), 1, 22, 1)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(15000000 AS Decimal(18, 0)), 1, 22, 11)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(6200000 AS Decimal(18, 0)), 1, 22, 30)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(19500000 AS Decimal(18, 0)), 1, 22, 34)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(8200000 AS Decimal(18, 0)), 1, 22, 48)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(6999999 AS Decimal(18, 0)), 1, 23, 1)
INSERT [dbo].[ChiTietDatHang] ([Gia], [SoLuong], [IDDatHang], [IDSanPham]) VALUES (CAST(26000000 AS Decimal(18, 0)), 1, 23, 43)
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] ON 

INSERT [dbo].[DanhMucSanPham] ([ID], [TheLoaiSP], [MoTa], [TheTuKhoa], [Url], [TheMoTa], [TrangThaiDM]) VALUES (1, N'PC', N'   s?n ph?m d? công ngh? cao', N'May-tinh', N'pc', N'Các s?n ph?m công ngh?', 1)
INSERT [dbo].[DanhMucSanPham] ([ID], [TheLoaiSP], [MoTa], [TheTuKhoa], [Url], [TheMoTa], [TrangThaiDM]) VALUES (2, N'LAPTOP', N'Chuyên về các sản phẩm công nghệ', N'laptop', N'laptop', N'Các sản phẩm công nghệ', 1)
INSERT [dbo].[DanhMucSanPham] ([ID], [TheLoaiSP], [MoTa], [TheTuKhoa], [Url], [TheMoTa], [TrangThaiDM]) VALUES (4, N'TI VI', N'chuyên v? các s?n ph?m d? m? ngh?', N'ti-vi', N'ti-vi', N'Ð? M? Ngh?', 1)
INSERT [dbo].[DanhMucSanPham] ([ID], [TheLoaiSP], [MoTa], [TheTuKhoa], [Url], [TheMoTa], [TrangThaiDM]) VALUES (7, N'MÁY ẢNH', N'chuyên v? các s?n ph?m d? m? ngh?', N'may-anh', N'may-anh', N'Ð? M? Ngh?', 1)
INSERT [dbo].[DanhMucSanPham] ([ID], [TheLoaiSP], [MoTa], [TheTuKhoa], [Url], [TheMoTa], [TrangThaiDM]) VALUES (16, N'LOA', N'loa', NULL, N'loa', NULL, 1)
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] OFF
SET IDENTITY_INSERT [dbo].[DatHang] ON 

INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (4, N'Nguyen Van Khue', N'Hung Yen', N'NguyenA@gmail.com', N'0953262662', N'Dat Hang', NULL, CAST(N'2012-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (5, N'Nguyen Van Khue', N'Hung Yen', N'NguyenA@gmail.com', N'0953262662', N'Dat Hang', NULL, CAST(N'2012-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (6, N'Nguyen Van Khue', N'Hung Yen', N'NguyenA@gmail.com', N'0953262662', N'Dat Hang', NULL, CAST(N'2012-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (7, N'Nguyen Van Khue', N'Hung Yen', N'NguyenA@gmail.com', N'0953262662', N'Dat Hang', NULL, CAST(N'2012-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (9, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T08:59:36.593' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (10, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T09:03:26.587' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (11, N'DuyNguyen', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T09:05:58.123' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (12, N'', N'', N'', N'', NULL, NULL, CAST(N'2019-03-25T11:28:50.723' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (13, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T12:53:33.700' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (14, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T12:55:29.833' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (15, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T12:55:38.850' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (16, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T12:55:45.930' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (17, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T12:56:15.970' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (18, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T12:56:36.173' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (19, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T13:34:40.550' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (20, N'SonDam', N'Hưng Yên', N'094578899', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-25T13:34:50.660' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (21, N'fds', N'21412', N'fds', N'abcde@gmail.com', NULL, NULL, CAST(N'2019-03-26T17:30:10.477' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (22, N'Dam Ngoc Son', N'Hung Yen', N'1235453465', N'Son@gmail.com', NULL, NULL, CAST(N'2019-11-27T02:15:58.830' AS DateTime))
INSERT [dbo].[DatHang] ([ID], [HoTenKhachHang], [DiaChiKhachHang], [EmailKhachHang], [SDTKhachHang], [LoiNhanKhachHang], [PhuongThucThanhToan], [NgayTao]) VALUES (23, N'Dam Ngoc Son', N'Hưng yên', N'1235453465', N'Son@gmail.com', NULL, NULL, CAST(N'2019-11-27T12:51:22.483' AS DateTime))
SET IDENTITY_INSERT [dbo].[DatHang] OFF
INSERT [dbo].[Footers] ([ID], [NoiDung]) VALUES (N'f1', N'
    <!--Start Tag Footer-->
    <footer>
        <div class="container">
            <div class="row">

                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-widget contact-widget">
                        <h4>
                            <a href="#"><img src="assets/images/Logocover.PNG" width="230px" alt="Footer Logo" /></a>
                        </h4>
                        <p>
                            Home Shoppe - nơi bạn đặt niềm tin !
                        </p>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-widget">
                        <h4>
                            Liên hệ với chúng tôi
                        </h4>
                        <ul class="address">
                            <li>
                                <a href="#"><i class="fas fa-map-marker-alt"> 235 Hoàng Quốc Việt, Cổ Nhuế, hà
                                        Nội</i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fas fa-phone-volume"> 0987654321</i> </a>
                            </li>
                            <li>
                                <a href="#"><i class="fas fa-envelope"> Sonlanggtu@company.com</i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fax"> fax:(123) 123-4567</i></a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-widget">
                        <h4>
                            Về công ty
                        </h4>
                        <div class="footer-nav">
                            <ul>
                                <li><a href="#"> Chính sách&điều khoản</i></a></li>
                                <li><a href="#"> Đội ngũ</i></a></li>
                                <li><a href="#"> Việc làm</i></a></li>
                                <li><a href="#"> Cộng sự & đối tác</i></a></li>
                                <li><a href="#"> Hệ thống cửa hàng</i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="footer-widget">
                        <h4>
                            Theo dõi chúng tôi
                        </h4>
                        <div class="mang_xa_hoi">
                            <ul>
                                <li><a href="#"><i class="fab fa-facebook-f"> Facebook</i></a></li>
                                <li><a href="#"><i class="fab fa-youtube"> Youtube</i></a></li>
                                <li><a href="#"><i class="fab fa-twitter"> Twitter</i></a></li>
                                <li><a href="#"><i class="fab fa-google-plus-g"> Google+</i></a></li>
                                <li><a href="#"><i class="fab fa-instagram"> instagram</i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </footer>


    <div id="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="info-design">
                        <p>&copy; Thiết kế năm 2019 - Thiết kế bởi <a href="#">Sơn Lãng tử</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--End Tag Footer-->')
INSERT [dbo].[Footers] ([ID], [NoiDung]) VALUES (N'f2', N'
        <footer>
            <div class="container">
                <div class="row">

                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="footer-widget contact-widget">
                            <h4>
                                <a href="#"><img src="/assets/Client/images/Sammi/SammiShop.PNG" width="230px" alt="Footer Logo" /></a>
                            </h4>
                            <p>
                                SammiShop - nơi bạn đặt niềm tin !
                            </p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="footer-widget">
                            <h4>Liên hệ với chúng tôi
                            </h4>
                            <ul class="address">
                                <li>
                                    <a href="#"><i class="fas fa-map-marker-alt">112 Hoàng Quốc Việt, Cổ Nhuế, hà
                                        Nội</i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fas fa-phone-volume"> 0976264789</i> </a>
                                </li>
                                <li>
                                    <a href="#"><i class="fas fa-envelope">SammiShop@company.com</i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-fax">fax:(123) 123-4567</i></a>
                                </li>
                            </ul>
                        </div>
                    </div>


                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="footer-widget">
                            <h4>Về công ty
                            </h4>                           
                            <div class="footer-nav">
                                <ul>
                                    <li><a href="#">Chính sách&điều khoản</i></a></li>
                                    <li><a href="#">Đội ngũ</i></a></li>
                                    <li><a href="#">Việc làm</i></a></li>
                                    <li><a href="#">Cộng sự & đối tác</i></a></li>
                                    <li><a href="#">Hệ thống cửa hàng</i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-3 col-sm-6 col-xs-12">
                        <div class="footer-widget">
                            <h4>Theo dõi chúng tôi
                            </h4>
                            <div class="mang_xa_hoi">
                                <ul>
                                    <li><a href="https://www.facebook.com"><i class="fab fa-facebook-f">Facebook</i></a></li>
                                    <li><a href="https://www.youtube.com"><i class="fab fa-youtube">Youtube</i></a></li>
                                    <li><a href="https://twitter.com/?lang=vi"><i class="fab fa-twitter">Twitter</i></a></li>
                                    <li><a href="https://plus.google.com"><i class="fab fa-google-plus-g">Google+</i></a></li>
                                    <li><a href="https://www.instagram.com/"><i class="fab fa-instagram">instagram</i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <div id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="info-design">
                            <p>&copy; Thiết kế năm 2019 - Thiết kế bởi <a href="#">Sammi Shop</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>')
SET IDENTITY_INSERT [dbo].[LoaiBaiDang] ON 

INSERT [dbo].[LoaiBaiDang] ([ID], [TenTheLoai], [DinhDanh], [MoTa], [ThuTuHienThi], [HinhAnh], [TrangChu], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (1, N'Máy Tính', N'may-tinh', NULL, 1, NULL, 1, CAST(N'2018-12-17T00:00:00.000' AS DateTime), N'Sơn', NULL, NULL, N'may-tinh', NULL, 1)
INSERT [dbo].[LoaiBaiDang] ([ID], [TenTheLoai], [DinhDanh], [MoTa], [ThuTuHienThi], [HinhAnh], [TrangChu], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (2, N'Ti Vi', N'ti-vi', NULL, 2, NULL, 1, CAST(N'2109-02-02T00:00:00.000' AS DateTime), N'Minh', NULL, NULL, N'ti-vi', NULL, 1)
INSERT [dbo].[LoaiBaiDang] ([ID], [TenTheLoai], [DinhDanh], [MoTa], [ThuTuHienThi], [HinhAnh], [TrangChu], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (3, N'Điện Thoại', N'dien-thoai', NULL, 3, NULL, 1, CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'Ngọc', NULL, NULL, N'dien-thoai', NULL, 1)
SET IDENTITY_INSERT [dbo].[LoaiBaiDang] OFF
SET IDENTITY_INSERT [dbo].[MenuGroups] ON 

INSERT [dbo].[MenuGroups] ([ID], [TenNhomTrang]) VALUES (1, N'MenuPage')
INSERT [dbo].[MenuGroups] ([ID], [TenNhomTrang]) VALUES (2, N'MenuTop')
INSERT [dbo].[MenuGroups] ([ID], [TenNhomTrang]) VALUES (3, N'ProductCategory')
INSERT [dbo].[MenuGroups] ([ID], [TenNhomTrang]) VALUES (4, N'ProductCategoryHome')
INSERT [dbo].[MenuGroups] ([ID], [TenNhomTrang]) VALUES (5, N'ThanhToan')
SET IDENTITY_INSERT [dbo].[MenuGroups] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (1, N'Đăng ký', N'/dang-ky', 1, 2, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (4, N'Trang chủ', N'/', 1, 1, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (5, N'Đăng nhập', N'/dang-nhap', 2, 2, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (6, N'Tin tức mới', N'/tin-tuc-moi', 2, 1, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (7, N'Liên hệ', N'/lien-he', 3, 1, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (8, N'Giới thiệu công ty', N'/gioi-thieu-cong-ty', 4, 1, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (17, N'Sản Phẩm Mới', N'/san-pham-moi', 1, 4, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (18, N'Sản Phẩm Hot', N'/san-pham-hot', 2, 4, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (19, N'Sản Phẩm Giảm Giá', N'/san-pham-giam-gia', 3, 4, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (20, N'Thanh toán', N'/thanh-toan', 1, 5, 1)
INSERT [dbo].[Menus] ([ID], [TenTrang], [URL], [ThuTuHienThi], [GroupID], [TrangThai]) VALUES (21, N'Xác nhận thanh toán', N'/xac-nhan-thanh-toan', 2, 5, 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([ID], [TenTrang], [DinhDang], [NoiDung], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai]) VALUES (2, N'VeChungToi', N'VeChungToi', N'  <!--Start tag whoweare-->
            <div class="headercontentAbout">
                <h3>HOMESHOPPE</h3>
                <img src="/assets/Client/images/about_img.jpg" width="300px" /> <br />
                <p>
                    <br/>
                    
                   <p> HOMESHOPPE là mô hình đại siêu thị điện tử </p>
                    <p> HOMESHOPPE chuyên cung cấp các đồ điện tử , công nghệ với số lượng, chất lượng vượt trội</p>       
               

            </div>
            <!--End tag whoweare-->
            <!--Start tag OurHistory-->
            <div class="headercontentAbout">
                <h3>Quá trình phát triển</h3>
                <div class="baodong_Deverlop_content_history">
                    <div class="Deverlop_history ColorDeverlop_history">
                        <p class="">    1998 -</p>
                    </div>
                    <div class="content_history">
                        <p class="cangiuacontentabout">Là công ty kinh doanh đồ thức ăn, yếu phẩm hàng ngày.</p>
                    </div>
                </div>

                <div class="baodong_Deverlop_content_history">
                    <div class="Deverlop_history ColorDeverlop_history">
                        <p class="">2001 -</p>
                    </div>
                    <div class="content_history">
                        <p class="cangiuacontentabout">Là công ty chuyên bán các đồ điện tử</p>
                    </div>
                </div>

                <div class="baodong_Deverlop_content_history">
                    <div class="Deverlop_history ColorDeverlop_history">
                        <p class="">2009 -</p>
                    </div>
                    <div class="content_history">
                        <p class="cangiuacontentabout">Là công ty đi đầu trong lĩnh vược bán các đồ điện tử, đồ công nghệ </p>
                    </div>
                </div>

                <div class="baodong_Deverlop_content_history">
                    <div class="Deverlop_history ColorDeverlop_history">
                        <p class="">2017 -</p>
                    </div>
                    <div class="content_history">
                        <p class="cangiuacontentabout">Có hệ thống phân phối trải rộng khắp cả nước.</p>
                    </div>
                </div>
            </div>
            <!--End tag Our History-->
            <!--Start tag Our Opportunities-->
            <div class="headercontentAbout">
                <h3>Tầm nhìn</h3>
                <p>Homeshoppe ra đời với hoài bão tạo nên một bước đột phá lớn trong lĩnh vực thương mại điện tử ở Việt
                    Nam,
                    góp phần thể hiện khát vọng luôn tiên phong, đi đầu của thương mại điện tử .</p>
                <p>HomeShoppe đặt mục tiêu trở thành hệ thống bán lẻ các đồ điện tử, đồ công nghệ .. số một tại Việt Nam,
                    tiến đến vươn ra thị trường khu vực và thế giới.</p>
            </div>
            <!--End tag Our Opportunities-->', NULL, NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (1, N'Tivi Samsung 49 inch G2 ', N'samsung-49-inch-G2 ', 4, N'/assets/client/images/ti-vi2.png', NULL, CAST(7999999 AS Decimal(18, 0)), CAST(6999999 AS Decimal(18, 0)), 5, N'Loại tivi: Smart Tivi, 49 inch
Độ phân giải:Full HD
Hệ điều hành:Tizen OS
Ứng dụng sẵn có:Youtube, Netflix, Trình duyệt web, Kho ứng dụng
Ứng dụng có thể tải thêm:FPT Play, Fim+, Benthanh Karaoke, Nhaccuatui, Spotify, MyTV, ClipTV, Zing TV
Remote thông minh:Không dùng được
Điều khiển TV bằng điện thoại:Bằng ứng dụng SmartThings
Kết nối internet:Cổng LAN, Wifi
Cổng HDMI:3 cổng
Cổng USB:2 cổng
Năm ra mắt:2018
Hãng:Samsung. Xem thông tin hãng
Kết nối không dây với điện thoại, máy tính bảng:Chiếu màn hình Screen Mirroring
Kết nối Bàn phím, chuột:Có thể kết nối (sử dụng tốt nhất trong trình duyệt web)
Công nghệ hình ảnh:Mega Contrast, Micro Dimming Pro, Hyper Real Engine, PurColor, HDR
Tần số quét thực:50 Hz
Công nghệ âm thanh:Dolby Digital Plus', N'
Smart Tivi Samsung 4K 43 inch hỗ trợ HDR cho cảm giác thật đến từng phút giây!
', NULL, 230, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'Sơn', NULL, NULL, N'ti-vi', NULL, 1, N'https://www.youtube.com/embed/PvGj2LCweYU', 1, 0)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (6, N'Samsung 49 inch UA43NU7100', N'smart-tivi-samsung-4k-49-inch-ua43nu7100', 4, N'/assets/Client/images/UA43NU7100.png', NULL, CAST(12000000 AS Decimal(18, 0)), CAST(10000000 AS Decimal(18, 0)), 12, N'Loại tivi: Smart Tivi, 49 inch
Độ phân giải:Full HD
Hệ điều hành:Tizen OS
Ứng dụng sẵn có:Youtube, Netflix, Trình duyệt web, Kho ứng dụng
Ứng dụng có thể tải thêm:FPT Play, Fim+, Benthanh Karaoke, Nhaccuatui, Spotify, MyTV, ClipTV, Zing TV
Remote thông minh:Không dùng được
Điều khiển TV bằng điện thoại:Bằng ứng dụng SmartThings
Kết nối internet:Cổng LAN, Wifi
Cổng HDMI:3 cổng
Cổng USB:2 cổng
Năm ra mắt:2018
Hãng:Samsung. Xem thông tin hãng
Kết nối không dây với điện thoại, máy tính bảng:Chiếu màn hình Screen Mirroring
Kết nối Bàn phím, chuột:Có thể kết nối (sử dụng tốt nhất trong trình duyệt web)
Công nghệ hình ảnh:Mega Contrast, Micro Dimming Pro, Hyper Real Engine, PurColor, HDR
Tần số quét thực:50 Hz
Công nghệ âm thanh:Dolby Digital Plus', N'    Độ phân giải 4K đi kèm công nghệ HDR mang đến hình ảnh sắc nét màu sắc trung thực.
    Công nghệ PurColor mang đến dải màu rộng cho ra màu sắc sống động, mạnh mẽ.
    Công nghệ UHD Dimming tối ưu cho hình ảnh sắc nét, màu sắc hiển thị chân thật hơn.
    Âm thanh vòm mạnh mẽ với công nghệ Dolby Digital Plus.
    Hệ điều hành Tizen dễ sử dụng, hỗ trợ nhiều ứng dụng quen thuộc phù hợp với nhiều thành viên trong gia đình.
    Hỗ trợ chiếu màn hình điện thoại lên tivi và điều khiển tivi bằng điện thoại qua ứng dụng SmartThings.', NULL, 500, CAST(N'2019-02-14T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'ti-vi', NULL, 1, N'https://www.youtube.com/embed/QmaUwIS0bpc', 2, 50)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (10, N'Máy Ảnh Sony DSC H300 ', N'may-anh-sony-dsc-h300 ', 7, N'/assets/client/images/new-pic1.jpg', NULL, CAST(13899990 AS Decimal(18, 0)), NULL, 12, N'- Cảm biến Exmor™ APS HD CMOS 24.3MP có bộ xử lý BIONZ X™
- Độ phân giải 24.3 MP
- Lấy nét tự động Fast Hybrid
- Khung ngắm điện tử 1,0 cm
- Màn hình 3 inch
- ISO 100-25600
- Tốc độ chụp 11 ảnh / giây
- Chia sẻ và kiểm soát đơn giản cùng Wi-Fi® và NFC một chạm', N'Chỉ một lần sạc đầy pin là bạn đã có thể chụp được hơn 600 tấm ảnh với máy ảnh Sony Alpha A6000. Và còn gì nữa? Đó là khả năng lấy nét cực nhanh ở 0.06s có thể khiến bạn phải kinh ngạc. ', NULL, 130, CAST(N'2018-05-05T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'may anh', NULL, 1, N'https://www.youtube.com/embed/PvGj2LCweYU', 3, 122)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (11, N' Loa MicroLab M590 4.1 ', N'-loa-microLab-M590-4-1 ', 16, N'/assets/client/images/new-pic3.jpg', NULL, CAST(15000000 AS Decimal(18, 0)), NULL, 5, N'
    Kiểu Loa: Passive (Không có công suất)
    Cấu tạo: 3 Loa, 2 đường tiếng
    Công suất RMS: 220W
    Công Suất Maximum: 500W
    Tần số đáp tuyến: 35Hz - 20kHz
    Độ nhạy (1w @ 1m): 91dB
    Trở kháng: 8 ohms
    Bass loa: Bass 25cm
', N'+ Thiết kế đẹp mắt
+ Củ loa bass 25cm, loa 2 đường tiếng, tái tạo âm thanh mạnh mẽ
+ Công suất 220W/500W, độ nhạy 91db cho chất âm sống động
+ Loa thể hiện trung thực, mượt mà
+ linh kiện, sử dụng những chất liệu hiện đại, cao cấp nhất. ', NULL, 203, CAST(N'2019-01-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'loa', NULL, 1, N'https://www.youtube.com/embed/PvGj2LCweYU', 4, 12)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (15, N'Tivi Samsung URTYG23', N'Samsung-uttyg23', 4, N'/assets/client/images/tivi1.png', NULL, CAST(11000000 AS Decimal(18, 0)), NULL, 7, N'Loại Tivi:Smart Tivi
Kích cỡ màn hình:43 inch
Độ phân giải:Ultra HD 4K
Kết nối
Kết nối Internet:Cổng LAN, Wifi
Cổng AV:Có cổng Composite và cổng Component
Cổng HDMI:3 cổng
Cổng xuất âm thanh:Cổng Optical (Digital Audio Out), HDMI ARC
USB:2 cổng
Tích hợp đầu thu kỹ thuật số:DVB-T2
Tính năng thông minh (Cập nhật 3/2019)
Hệ điều hành, giao diện:Tizen OS
Các ứng dụng sẵn có:Youtube, Netflix, Trình duyệt web, Kho ứng dụng
Các ứng dụng phổ biến có thể tải thêm:FPT Play, Fim+, Benthanh Karaoke, Nhaccuatui, Spotify, MyTV, ClipTV, Zing TV
Remote thông minh:Không dùng được
Điều khiển tivi bằng điện thoại:Bằng ứng dụng SmartThings
Kết nối không dây với điện thoại, máy tính bảng:Chiếu màn hình Screen Mirroring
Kết nối Bàn phím, chuột:Có thể kết nối (sử dụng tốt nhất trong trình duyệt web)
Công nghệ hình ảnh, âm thanh
Công nghệ hình ảnh:UHD Engine, UHD Dimming, PurColor, HDR
Tần số quét thực:100 Hz
Công nghệ âm thanh:Dolby Digital Plus
Tổng công suất loa:20 W (2 loa mỗi loa 10 W)
Thông tin chung
Công suất:115 W
Kích thước có chân, đặt bàn:Ngang 97.02 cm - Cao 63.63 cm - Dày 21.03 cm
Khối lượng có chân:9.8 kg
Kích thước không chân, treo tường:Ngang 97.02 cm - Cao 56.32 cm - Dày 5.88 cm
Khối lượng không chân:9.6 kg
Chất liệu:Viền nhựa, chân đế nhựa
Nơi sản xuất:Việt Nam
Năm ra mắt:2018', N'
    Độ phân giải 4K sắc nét gấp 4 lần Full HD cho hình ảnh cực nét.
    Công nghệ HDR nâng cao độ tương phản, cho hình ảnh rõ nét vượt trội.
    Công nghệ UHD Dimming tăng cường độ tương phản, cho hình ảnh chân thực đến từng chi tiết.
    Công nghệ PurColor với dải màu rộng cho màu sắc rực rỡ.
    Công nghệ âm thanh Dolby Digital Plus mang đến âm thanh đa chiều mạnh mẽ, sống động.
    Hệ điều hành Tizen dễ sử dụng cùng kho ứng dụng giải trí trực tuyến hấp dẫn.
    Hỗ trợ chiếu màn hình điện thoại lên tivi và điều khiển tivi bằng điện thoại qua ứng dụng Smart View.
', NULL, 467, CAST(N'2016-12-12T00:00:00.000' AS DateTime), NULL, NULL, NULL, N'ti vi', NULL, 1, N'https://www.youtube.com/embed/PvGj2LCweYU', NULL, 4)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (17, N'Loa Vi Tính AW200', N'loa-vi-tinh-AW200', 16, N'/assets/client/images/slide-1-image.png', NULL, CAST(1000000 AS Decimal(18, 0)), CAST(700000 AS Decimal(18, 0)), 3, N'
Tính năng sử dụng
Khuếch đại âm thanh cho laptop, PC, đầu đĩa....
Số kênh
2.1 kênh
Tần số đáp ứng
Loa trầm: 20Hz~200Hz, loa vệ tinh: 110Hz~20KHz
Cấu tạo
Gồm 1 loa trầm và 2 loa vệ tinh
Điện thế sử dụng
220V AC/ 50Hz
Công suất
80w
Jack kết nối
Input: jack 3.5mm, USB, SD card slot; Output: 2RCA
Thông tin khác
Nút điều chỉnh âm: volume, bass
Tính Năng Khác
Hỗ trợ USB/SD
Có hỗ trợ
Karaoke
Không hỗ trợ
FM
Không hỗ trợ
Điều khiển từ xa
Có hỗ trợ
', N' Hệ thống loa 2.1

Loa vi tính Soundmax AW200 sử dụng hệ thống 2.1, gồm 2 loa vệ tinh và 1 loa trầm với tổng công suất 80W, cho khả năng phát âm thanh đầy mạnh mẽ. Bạn sẽ được trãi nghiệm những âm thanh tuyệt vời khi nghe nhạc, xem phim hay chơi game.', NULL, 100, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'loa', NULL, 1, N'https://www.youtube.com/embed/l4TCoU3CUaY', 1, 100)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (20, N'LG 4K 43 inch 43UK6340PTF', N'LG-4K-43-inch-43UK6340PTF', 4, N'/assets/client/images/lg-43uk6340.png', NULL, CAST(11000000 AS Decimal(18, 0)), NULL, 6, N'Loại Tivi:Smart Tivi
Kích cỡ màn hình:43 inch
Độ phân giải:Ultra HD 4K
Kết nối
Bluetooth:Có (kết nối loa, bàn phím, chuột, tay game)
Kết nối Internet:Cổng LAN, Wifi
Cổng AV:Có cổng Composite và cổng Component
Cổng HDMI:3 cổng
Cổng xuất âm thanh:Cổng Optical (Digital Audio Out), HDMI ARC
USB:2 cổng
Tích hợp đầu thu kỹ thuật số:DVB-T2
Tính năng thông minh (Cập nhật 3/2019)
Hệ điều hành, giao diện:WebOS 4.0
Các ứng dụng sẵn có:Youtube, Netflix, Trình duyệt web, LG Content Store
Các ứng dụng phổ biến có thể tải thêm:FPT Play, ClipTV, Fim+, MyTV, Nhaccuatui, THVLi, HTV, Spotify, Zing TV
Remote thông minh:Có Magic Remote (tìm kiếm bằng giọng nói có hỗ trợ tiếng Việt)
Điều khiển tivi bằng điện thoại:Bằng ứng dụng LG TV Plus
Kết nối không dây với điện thoại, máy tính bảng:Chiếu màn hình Screen Mirroring
Kết nối Bàn phím, chuột:Có
Tính năng thông minh khác:Tìm kiếm bằng giọng nói (có hỗ trợ tiếng Việt)
Công nghệ hình ảnh, âm thanh
Công nghệ hình ảnh:Ultra Luminance PRO, True Color Accuracy, Wide Color Gamut, 4K Active HDR, 4K Upscaler, HDR Effect, Wide Viewing Angle, Local Dimming, Tấm nền IPS, Dynamic Color
Tần số quét thực:50 Hz
Công nghệ âm thanh:DTS Virtual:X
Tổng công suất loa:20 W
Thông tin chung
Công suất:95 W
Kích thước có chân, đặt bàn:Ngang 97.7 cm - Cao 63 cm - Dày 21.7 cm
Khối lượng có chân:9.3 kg
Kích thước không chân, treo tường:Ngang 97.7 cm - Cao 56.5 cm - Dày 8 cm
Khối lượng không chân:8.3 kg
Chất liệu:Viền nhựa, chân đế phủ kim loại
Nơi sản xuất:Indonesia
Năm ra mắt:2018', N'
    Độ phân giải 4K sắc nét gấp 4 lần tivi Full HD thông thường.
    Công nghệ Active HDR và HDR Effect cho hình ảnh chân thật từng chi tiết.
    Nâng cấp hình ảnh độ phân giải thấp lên gần bằng 4K với 4K Upscaler.
    Công nghệ âm thanh DTS Virtual:X mang đến âm thanh vòm sống động mạnh mẽ.
    Hệ điều hành WebOS 4.0 dễ sử dụng, đi kèm remote thông minh hỗ trợ tìm kiếm giọng nói bằng tiếng Việt cả 3 miền.
    Hỗ trợ chiếu màn hình điện thoại lên tivi và điều khiển tivi bằng điện thoại qua ứng dụng LG TV Plus.
', NULL, 100, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'ti0vi', NULL, 1, N'https://www.youtube.com/embed/zN8zIHN1Jbc', 3, 200)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (21, N'Sony 43 inch KDL-43W660F', N'Sony-43-inch-KDL-43W660F', 4, N'/assets/client/images/sony_1.png', NULL, CAST(7000000 AS Decimal(18, 0)), CAST(6800000 AS Decimal(18, 0)), 6, N'Loại Tivi:Smart tivi cơ bản
Kích cỡ màn hình:43 inch
Độ phân giải:Full HD
Kết nối
Kết nối Internet:Cổng LAN, Wifi
Cổng AV:Có cổng Composite
Cổng HDMI:2 cổng
Cổng xuất âm thanh:Jack loa 3.5 mm, Cổng Optical (Digital Audio Out), HDMI ARC
USB:2 cổng
Tích hợp đầu thu kỹ thuật số:DVB-T2
Tính năng thông minh (Cập nhật 3/2019)
Hệ điều hành, giao diện:Linux
Các ứng dụng sẵn có:Youtube, Netflix, Trình duyệt web, VEWD Store
Các ứng dụng phổ biến có thể tải thêm:FPT Play, Nhaccuatui, Zing TV, Zing Mp3, Fim+
Remote thông minh:Không dùng được
Kết nối không dây với điện thoại, máy tính bảng:Chiếu màn hình Screen Mirroring
Kết nối Bàn phím, chuột:Có thể kết nối (sử dụng tốt nhất trong trình duyệt web)
Công nghệ hình ảnh, âm thanh
Công nghệ hình ảnh:Hỗ trợ Youtube Low Bitrate, Live Colour™, X-Reality PRO, Dynamic Contrast Enhancer, HDR
Tần số quét thực:50 Hz
Công nghệ quét hình:Motionflow™ XR 200 Hz
Công nghệ âm thanh:S-Master Digital Amplifier, DTS Digital Surround, Clear Phase, Dolby Pulse, S-Force Front Surround, Digital Sound Enhancement Engine (DSEE), ClearAudio+, Dolby Digital, Dolby Digital Plus
Tổng công suất loa:10 W (2 loa mỗi loa 5 W)
Thông tin chung
Công suất:60 W
Kích thước có chân, đặt bàn:Ngang 97.4 cm - Cao 62 cm - Dày 26.8 cm
Khối lượng có chân:8.2 kg
Kích thước không chân, treo tường:Ngang 97.4 cm - Cao 56.2 cm - Dày 6.8 cm
Khối lượng không chân:7.8 kg
Chất liệu:Viền nhựa, chân đế nhựa
Nơi sản xuất:Malaysia
Năm ra mắt:2018
Hãng:Sony. Xem thông tin hãng', N'
    Độ phân giải Full HD sắc nét gấp 2 lần HD cùng công nghệ HDR cho hình ảnh chân thực đến không ngờ.
    Công nghệ X-Reality PRO tăng cường độ sáng, độ nét cho hình ảnh hoàn hảo.
    Công nghệ âm thanh ClearAudio+ âm thanh rõ ràng cho bạn cảm giác như đang hòa mình vào trong không gian thưởng thức.
    Hệ điều hành Linux trực quan dễ sử dụng đi kèm kho ứng dụng VEWD phong phú, đa dạng.
    Hỗ trợ chiếu màn hình điện thoại lên tivi Screen Mirroring (Miracast).
', NULL, 124, CAST(N'2018-12-16T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'ti-vi', NULL, 1, N'https://www.youtube.com/embed/K2uB34IoV2Y', 2, 180)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (22, N'Dell 42V245', N'Dell_42V245', 1, N'/assets/Client/images/ProductCategory/Product/PC/PC1.jpg', NULL, CAST(7000000 AS Decimal(18, 0)), CAST(6500000 AS Decimal(18, 0)), 6, N'Sản phẩm 	Máy tính để bàn
Tên Hãng 	Dell
Model 	Vostro 3670_42VT370024
Bộ VXL 	Bộ xử lý Intel® Core ™ i3-8100 thế hệ thứ 8 (Bộ nhớ cache 6MB, tối đa 3,6 GHz)
Chipset 	Intel H370
Cạc đồ họa 	VGA onboard
Bộ nhớ 	4Gb 2666Mhz DDR4 2 slot
Ổ cứng 	3.5" 1TB 7200 rpm Hard Drive
Kết nối mạng 	Dell Wireless 1707 Card (802.11bgn + Bluetooth 4.0, 1x1) / 10/100/1000 Gigabit Ethernet
Ổ quang 	Ổ đĩa DVD tải (Đọc và ghi vào đĩa DVD / CD)
Phụ kiện 	Chuột có dây Dell MS116 Đen
Bàn phím có dây của Dell KB216 Đen
Cổng giao tiếp 	Trước mặt
• 1 MCR 1: 1
• 1 Jack kết hợp âm thanh
• 2 USB 3.1 Gen 1 Loại A
Phía sau
• 1 cổng vào / ra và cổng micrô
• 1 VGA
• 1 cổng ra HDMI
• 4 USB 2.0
• 1 cổng mạng
• 2 PCIe x1 + 1 PCIe x16
Hệ điều hành 	Ubuntu Linux 16.04 
Kiểu dáng 	case đứng to
Kích thước 	373.7 x  160 x 294mm 
Khối lượng 	5.9 kg ( trọng lượng thay đổi tùy theo cấu hình máy )', N'Máy tính để bàn Dell Vostro 3670_42VT370024 có thiết kế hiện đại, mạnh mẽ nhưng cũng vô cùng nhỏ gọn tiết kiệm không gian làm việc một cách đáng kể. Vỏ máy được làm bằng chất liệu case, giúp cho máy có độ bền cao chịu được va chạm tốt cũng như hạn chế được bụi bẩn, trầy xước trong quá trình sử dụng. Sản phẩm có hệ thống lưới tản nhiệt tốt, giúp máy hoạt động trơn tru.', NULL, 120, CAST(N'2018-12-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'pc', NULL, 1, NULL, 2, 12)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (24, N'Lenovo V530S', N'Lenovo-V530S', 1, N'/assets/Client/images/ProductCategory/Product/PC/PC2.jpg', NULL, CAST(8500000 AS Decimal(18, 0)), NULL, 4, N'Sản phẩm 	Máy tính để bàn
Tên Hãng 	Lenovo
Model 	V530S-07ICB 10TXA004VA
Bộ VXL 	8100
Chipset 	Intel B360 Chipset
Cạc đồ họa 	VGA onboard, Intel HD Graphics 610
Bộ nhớ 	4Gb Tối đa 32 GB, UDIMM, DDR4-2666 *, hai ổ cắm DIMM 288-pin, không phải ECC, 2 khe ram
Ổ cứng 	1Tb
Kết nối mạng 	Một số: 11ac không dây, thẻ M.2, Realtek 8821CE (băng tần kép),
Bộ kết hợp Wi-Fi + Bluetooth 4.2, 1x1 ( cấu hình tùy quốc gia )
Một số: 11ac không dây, M.2 Card, Intel Dual Band Không Dây-AC 3165,
Bộ kết hợp Wi-Fi + Bluetooth 4.0, 1x1 ( cấu hình tùy quốc gia )
Một cổng ethernet gigabit, Realtek RTL8111HN, Wake on LAN
Ổ quang 	DVDRW
Phụ kiện 	Key/mouse
Cổng giao tiếp 	Cổng trước :
Hai USB 3.1 Gen 2, hai USB 3.1 Gen 1, micrô (3.5mm), âm thanh kết hợp /
jack cắm micrô (3.5mm), đầu đọc thẻ tùy chọn
Cổng sau :
Hai USB 3.1 Gen1, hai USB 2.0, một nối tiếp, song song tùy chọn,
một ethernet (RJ-45), một VGA, một DisplayPort, một cổng HDMI,thêm VGA, DisplayPort hoặc HDMI trên thẻ đồ họa tùy chọn trên một số kiểu máy
Cổng âm thanh sau :
Đường ra (3.5mm)
Hệ điều hành 	Dos
Kiểu dáng 	case đứng nhỏ
Kích thước 	SFF (7.4L), màu đen, vỏ kim loại
3,9 "W X 12,0" D X 10,8 "H
100mm W X 304,4mm D X 274,8mm H
Khối lượng 	(4,2 kg), trọng lượng có thể thay đổi theo cấu hình', N'Thiết kế nhỏ gọn, chắc chắn

Máy tính để bàn Lenovo V530S-07ICB 10TXA004VA có kiểu dáng cứng cáp, nhỏ gọn tiết kiệm không gian làm việc. Các vị trí, khe tản nhiệt của máy được sắp xếp một cách khoa học trực quan.', NULL, 200, CAST(N'2018-12-05T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'pc', NULL, 1, NULL, 3, 19)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (25, N'HP Pavilion 590', N'HP-Pavilion-590', 1, N'/assets/Client/images/ProductCategory/Product/PC/PC3.jpg', NULL, CAST(9000000 AS Decimal(18, 0)), NULL, 2, N'Sản phẩm 	Máy tính để bàn
Tên Hãng 	HP
Model 	Pavilion 590-P0056D 4LY14AA
Bộ VXL 	Core i5 - 8400
Chipset 	Intel H370
Cạc đồ họa 	VGA rời, Nvidia Geforce GT730 2Gb
Bộ nhớ 	4Gb DDR4 2400Mhz (1x4GB)
Ổ cứng 	1TB SATA  7200rpm
Kết nối mạng 	10/100Mbps/ 802.11bgn TPM 2.0
Ổ quang 	SuperMulti DVDRW 
Phụ kiện 	Key/mouse
Cổng giao tiếp 	USB (rear: 2 USB 2.0 + 2 USB 3.0 + Front: 1 USB 3.0, 1 USB 3.0 - Type C), 1 LAN, VGA, HDMI, 3-in-1 Card Reader
Hệ điều hành 	Windows 10
Kiểu dáng 	case đứng to
Kích thước 	17 x 33.8 x 27,7 cm (W x H x D)
Khối lượng 	5.95 kg', N'Máy tính để bàn HP Pavilion 590-P0056D 4LY14AA sở hữu thiết kế nhỏ gọn, cứng cáp, hiệu năng mạnh mẽ với cấu hình Core i5 8400, RAM 4GB, VGA rời, Nvidia Geforce GT730 2GB đáp ứng tốt nhu cầu công việc hay những tựa game giải trí, đa nhiệm cao cấp.', NULL, 120, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'pc', NULL, 1, NULL, 2, 15)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (30, N'Dell Optiplex 3060SFF', N'Dell-Optiplex-3060SFF', 1, N'/assets/Client/images/ProductCategory/Product/PC/PC4.jpg', NULL, CAST(6700000 AS Decimal(18, 0)), CAST(6200000 AS Decimal(18, 0)), 2, N'sản phẩm 	Máy tính để bàn
Tên Hãng 	Dell
Model 	Optiplex 3060SFF-70166584
Bộ VXL 	Core i3 - 8100
Chipset 	Intel® B250
Cạc đồ họa 	VGA onboard / Intel® HD Graphics 530 
Bộ nhớ 	4GB 2666MHz DDR4 UDIMM Non-ECC
Ổ cứng 	1TB 7200RPM
Kết nối mạng 	1000Mbps
Ổ quang 	DVDRW
Phụ kiện 	Key/mouse
Cổng giao tiếp 	4 USB 3.0 (2 front/2 rear)
4 USB 2.0 (2 front/2 rear)
2 USB Internal
1 RJ-45
1 Serial (optional)
1 Display Port 1.2
1 HDMI 1.4 
2 PS/2 (optional) 
1 UAJ
1 Line-out
1 VGA (optional) 
Hệ điều hành 	Fedora
Kiểu dáng 	case đứng nhỏ
Kích thước 	9.26cmx29.2cmx29.0cm
Khối lượng 	5.14 kg', N'Máy tính để bàn Dell Optiplex 3060SFF-70166584 được trang bị với bộ vi xử lý Intel Core i3 8100, RAM 4 GB cho tốc độ xử lý đa nhiệm nhanh chóng và hiệu quả, ổ cứng 1 TB cho không gian lưu trữ rộng lớn. Nếu bạn đang muốn tìm chiếc máy tính để bàn giá rẻ, cấu hình tốt thì Dell Optiplex 3060SFF-70166584 là sự lựa chọn sáng giá.', NULL, 120, CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'pc', NULL, 1, NULL, 1, 12)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (34, N'Asus TUF FX504GD', N'Asus-TUF-FX504GD', 2, N'/assets/Client/images/ProductCategory/Product/laptop/laptop1.png', NULL, CAST(20000000 AS Decimal(18, 0)), CAST(19500000 AS Decimal(18, 0)), 12, N'Cân nặng: 	2.2KG
CPU: 	Core i5-8300H (2.3Ghz uptu 4.0GHZ, 8MB Cache,4 Cores, 8 Threads)
Màu sắc: 	Đen
Tình Trạng Máy : 	Mới 100%
Xuất xứ: 	Chính Hãng
RAM: 	8GB DDR4 (2666MHZ) Nâng Max 32GB
Ổ cứng: 	1000GB
Màn hình: 	15.6 Full HD (1920 x 1080 pixels) IPS Non-Glare LED Backlit
VGA/GPU: 	Nividia GTX 1050 4G Vram DDR5', N'Laptop cấu hình mạnh, cùng với thiết kế khỏe khắn mạnh mỡ vô cùng hấp dẫn với người  dùng trong tầm giá', NULL, 505, CAST(N'2019-03-21T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'laptop', NULL, 1, N'https://www.youtube.com/embed/jHwCyDUlWL8', 1, 200)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (39, N'Acer Nitro 5 AN515-52-75FT ', N'Acer-Nitro-5-AN515-52-75FT ', 2, N'/assets/Client/images/ProductCategory/Product/laptop/laptop2.jpg', NULL, CAST(21000000 AS Decimal(18, 0)), NULL, 12, N'
    Bộ xử lý
    Hãng CPU : intel
    Công nghệ CPU : core i7
    Loại CPU : 8750H
    Tốc độ CPU : 2.20 GHz
    Bộ nhớ đệm : 9 MB Cache
    Tốc độ tối đa : 4.10 GHz
    Bo mạch
    Chipset : intel
    Tốc độ Bus : 2666 MHz
    Hỗ trợ RAM tối đa : 32 GB
    RAM
    Dung lượng RAM : 8 GB
    Loại RAM : DDR4
    Tốc độ BUS RAM : 2666 MHz
    Số lượng khe RAM : 2
    Đĩa cứng
    Loại ổ đĩa : SSD(M.2 2280) + HDD SATA3 (5400rpm)
    Dung lượng ổ đĩa : 128 GB + 1 TB
    Khe cắm ổ SSD : Không
    Đồ họa
    Chipset đồ họa : NVIDIA GeForce GTX 1050Ti
    Bộ nhớ đồ họa : 4 GB GDDR5
    Kiểu thiết kế đồ họa : Card rời
    Màn hình
    Kích thước màn hình : 15.6 inches
    Độ phân giải (W x H) : 1920 x 1280 Pixels
    Công nghệ màn hình : Full HD IPS Anti-Glare, Acer ComfyView LED-backlit TFT LCD
    Cảm ứng : Không
    Âm thanh
    Kênh âm thanh : 2.0
    Thông tin thêm : Realtek High Definition Audio (Two built-in stereo speakers with 1 Subwoofer, Optimized Dolby Audio Premium)
    Đĩa quang
    Có sẵn đĩa quang : Không
    Tính năng mở rộng & cổng giao tiếp
    Cổng giao tiếp : 2 x USB 2.0; 1 x USB 3.0 port with power-off charging; 1 x USB 3.1 Gen 1; 1 x HDMI;1 x RJ45; 1 x Headphone/Microphone Combo Port
    Tính năng mở rộng : Không
    Giao tiếp mạng
    LAN : 10/100/1000
    Chuẩn Wi-Fi : 802.11ac
    Kết nối không dây khác : Bluetooth 5
    Card Reader
    Đọc thẻ nhớ : 4-1
    Khe đọc thẻ nhớ : Multi-in-1 card reader, supporting: SD card
    Webcam
    Độ phân giải : 1.0 MP
    Thông tin thêm : Không
    Hệ điều hành, phầm mềm có sẵn
    Hệ điều hành : Linux
    Phần mềm có sẵn : Không
    PIN/Battery
    Loại pin : 4 Cell Int
    Kiểu pin : Liền
    Thông tin khác
    Cảm biến vân tay : Không
    Đèn bàn phím : Có
    Bàn phím số : Có
    Phụ kiện kèm theo : Sạc, cáp...
    Kích thước & trọng lượng
    Kích Thước : 390 x 266 x 26.75 mm
    Trọng lượng : 2.42 Kg
    Chất liệu : Nhôm nguyên khối
    Bảo hành
    Thời gian bảo hành : 12 tháng
', N' Acer thiết kế hiện đại, dễ dàng mang theo khi di chuyển, làm việc và du lịch vì trọng lượng 2.45 kg khá nhẹ. Màn hình 15.6 inch FHD có độ phân giải 1920x1080 pixel, tấm nền IPS hiển thị hình ảnh sắc nét. Lớp vỏ máy có vân Carbon tạo cảm giác cá tính xen kẽ màu đỏ ở bản lề bắt mắt

Cấu hình khủng với Intel Core i7 8750H cho hiệu suất hoạt động mạnh mẽ, mở nhiều chương trình cùng lúc không bị giật, vận hành trơn tru. Hỗ trợ chơi được nhiều tựa game nặng như PUBG, Fortnite, The Witcher,…', NULL, 600, CAST(N'2018-11-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'laptop', NULL, 1, N'https://www.youtube.com/embed/LMhuIe0CZts', 1, 340)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (41, N'Lenovo Legion Y520', N'Lenovo-Legion-Y520', 2, N'/assets/Client/images/ProductCategory/Product/laptop/laptop3.jpg', NULL, CAST(20500000 AS Decimal(18, 0)), NULL, 12, N'
    Bo mạch
    Chipset : Intel® Chipset Express
    Bộ xử lý
    Hãng CPU : Intel
    Công nghệ CPU : Core i5
    Loại CPU : 7300HQ
    Tốc độ CPU : 2.5Ghz
    Bộ nhớ đệm : 6MB
    Tốc độ tối đa : 3.50 GHz
    RAM
    Dung lượng RAM : 8 GB
    Loại RAM : DDR4
    Tốc độ BUS RAM : 2400MHz
    Đĩa cứng
    Loại ổ đĩa : HDD + SSD
    Dung lượng ổ đĩa : 1000Gb 5400rpm + 128GB PCIe
    Khe cắm ổ SSD : Không
    Đồ họa
    Chipset đồ họa : NVIDIA GeForce GTX 1050 4GB GDDR5 + Intel HD Graphics 620NVIDIA GeForce GTX 1050 4GB GDDR5 + Intel HD Graphics 620
    Bộ nhớ đồ họa : 4GB
    Kiểu thiết kế đồ họa : Card rời
    Màn hình
    Kích thước màn hình : 15.6 inch
    Độ phân giải (W x H) : (1920x1080)
    Công nghệ màn hình : FHD IPS
    Cảm ứng : Không
    Âm thanh
    Kênh âm thanh : 2.0
    Thông tin thêm : Dolby Atmos
    Đĩa quang
    Có sẵn đĩa quang : No
    Tính năng mở rộng & cổng giao tiếp
    Cổng giao tiếp : 2 x USB 3.0 1 x USB 2.0 1 x HDMI™ 1 x USB Type C (USB 3.1) 1 x RJ45 LAN 1
    Tính năng mở rộng : Multi TouchPad
    Giao tiếp mạng
    LAN : 10/100/1000M Gigabit Ethernet
    Chuẩn Wi-Fi : 802.11AC
    Card Reader
    Đọc thẻ nhớ : 4-in-1
    Khe đọc thẻ nhớ : MMC, SD, SDHC, SDXC
    Webcam
    Độ phân giải : 720p
    Thông tin thêm : HD webcam
    Hệ điều hành, phầm mềm có sẵn
    Hệ điều hành : Free Dos
    Phần mềm có sẵn : Không
    PIN/Battery
    Loại pin : 3 Cell
    Kiểu pin : Pin Li-Polymer, liền
    Thông tin khác
    Cảm biến vân tay : Không
    Đèn bàn phím : Không
    Bàn phím số : Không
    Phụ kiện kèm theo : Sạc, HDSD
    Kích thước & trọng lượng
    Kích Thước : 380 x 265 x 25.8mm
    Trọng lượng : 2.4 kg
    Chất liệu : Nhựa đen tráng nhôm
    Bảo hành
    Thời gian bảo hành : 12
', N'Lenovo Legion Y520 là mẫu laptop gaming tầm trung vừa được hãng Lenovo ra mắt tại thị trường Việt Nam cách đây không lâu. Sở hữu thiết kế gọn gàng nhưng không kém phần bắt mắt, hiệu năng ấn tượng cùng một mức giá hợp lý, Lenovo Legion Y520 là một lựa chọn tuyệt vời trong phân khúc laptop chơi game tầm trung.', NULL, 789, CAST(N'2019-03-05T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'laptop', NULL, 1, N'https://www.youtube.com/embed/bOlJaLrYVus', 1, 500)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (42, N'Asus ROG Strix GL553VD', N'Asus-ROG -trix-GL553VD', 2, N'/assets/Client/images/ProductCategory/Product/laptop/laptop4.jpg', NULL, CAST(25000000 AS Decimal(18, 0)), NULL, 12, N'CPU :Intel, Core i5 7300HQ
RAM :8 GB, DDR4
Ổ cứng :HDD, 1 TB
Màn hình :15.6 inch , 1920 x 1080 pixels
Card màn hình :NVIDIA Geforce GTX 1050 4GB GDDR5
Cổng kết nối :LAN : 10/100/1000 Mbps, WIFI : 802.11 a/b/g/n/
Hệ điều hành :Free DOS
Trọng lượng :2.5 Kg
Kích thước :383 x 255 x 30 mm', N'Một trong những dòng laptop chuyên chơi game trong tầm giá dưới 25 triệu cực ổn phải kể đến Asus ROG Strix GL553VD. Thiết kế phần khung kim loại cá tính, màu đen nổi bật cuốn hút người đối diện. Bàn phím chiclet có trang bị đèn LED phát sáng trong bóng tối nên người dùng dễ dàng thực hiện các thao tác.

Màn hình 15.6 inch full HD có độ phân giải 1920 x 1080 cung cấp góc nhìn rộng, mang đến hình ảnh chân thực, sống động đến từng chi tiết. Nhà sản xuất trang bị nhiều cổng kết nối như USB 3.0, USB 3.1 lắp được các thiết bị công nghệ mới chơi được nhiều game hơn.', NULL, 400, CAST(N'2018-02-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'laptop', NULL, 1, N'https://www.youtube.com/embed/4P-cNj6W4Ig', 1, 300)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (43, N'Acer Aspire VX5 591G', N'Acer-Aspire-VX5-591G', 2, N'/assets/Client/images/ProductCategory/Product/laptop/laptop5.jpg', NULL, CAST(26000000 AS Decimal(18, 0)), NULL, 12, N'
    Hãng sản xuất: Acer.
    Chủng loại: VX5-591G-52YZ /Model Gaming
    Mầu sắc: Đen - vỏ nhôm cao cấp.
    Bộ vi xử lý : Intel Core i5-7300HQ Kabylake
    Bộ nhớ trong: 1* 8GB DDR4 2400MHz upto 32GB
    VGA: NVIDIA GeForce GTX 1050 4G GDDR5
    Ổ cứng: 128G SSD (M.2 2280) + 1TB SATA3 (5400rpm)
    Card Reader : có.
    Bảo mật, công nghệ: LED Keyboard ; tản nhiệt kép Dual Fan
    Màn hình: 15.6" Full HD (1920*1080)
    Webcam: HD
    Audio: Acer True harmony + Dolby Audio Premium
    Giao tiếp mạng: Gigabit.
    Giao tiếp không dây: 802.11 ac , Bluetooth 4.0
    Cổng giao tiếp: 1 x USB 2.0, 2 x USB 3.0, 1 x Type C USB 3.1 , HDMI
    Pin: upto 6 hours.
    Cân nặng: 2.5Kg
    Phụ kiện đi kèm : AC Adapter
', N'Chiếc laptop này được nhà sản xuất thiết kế theo phong cách hầm hố, màu sắc nổi bật với tông màu đỏ, đen, bạc đậm chất game. Màn hình 15,6 inch có độ phân giải 1920x1080 pixel, tấm nền IPS hiển thị hình ảnh sắc nét, chân thực. 2 vạch đèn LED ở mặt trước và bàn phím giúp máy nổi bật cả ngày lẫn đêm.', NULL, 300, CAST(N'2019-02-03T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'laptop', NULL, 1, N'https://www.youtube.com/embed/-u5o90FcYyc', 1, 440)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (44, N'Nikon D5600', N'Nikon-D5600', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/mayanh1.jpg', NULL, CAST(12800000 AS Decimal(18, 0)), NULL, 12, N'- Cảm biến: CMOS APS-C 25 MP, hiệu dụng : 24 MP
- Chip xử lý ảnh: Nikon EXPEED 4
- ISO: Auto, 100 - 25.600
- Tốc độ màn trập: 1/4000 - 30 giây
- Hệ thống lấy nét: AF 39 điểm, có tracking hỗ trợ quay phim
- Viewfinder: quang học, độ bao phủ 95%, độ phóng đại 0,82x
- Màn hình: LCD TFT cảm ứng 3.2-inch, 1.037.000 pixel
- Quay phim: 1080p@60fps, 720p@60fps, quay Timelapse
- Kết nối: USB 2.0, Bluetooth 4.1 LE, Wi-Fi 801.11b/g/n, mini-HDMI
- Cân nặng: 465g kèm pin
- Kích thước: 124 x 97 x 70 mm', N'Máy ảnh Nikon D5600 là mẫu máy ảnh được sản xuất nhằm khắc phục những thiếu sót mà người đàn anh D5500 để lại. Với những tính năng vượt trội cùng với những khả năng kết nối và chia sẽ thông minh, chiếc máy ảnh DSLR Nikon mới này sẽ đáp ứng cho nhu cầu của người dùng một cách đầy đủ nhất, mang lại những hình ảnh sống động trong cuộc sống hàng ngày của bạn.', NULL, 500, CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/eVTpAQWor5U', 1, 300)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (46, N'Canon 700D', N'Canon-700D', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/700D.jpg', NULL, CAST(8000000 AS Decimal(18, 0)), NULL, 12, N'- Cảm biến thế hệ mới Hybrid CMOS APS-C 18.0 MPs

- Bộ xử lý DIGIC V 14 bit, hệ thống AF 9 điểm

- ISO tới 12.800, tốc độ chụp liên tiếp 5 hình/s

- Hệ thống đo sáng thế hệ mới iFCL 63 vùng ảnh

- Quay phim Full HD với khả năng lấy nét liên tục

- Màn hình lật xoay cảm ứng 3.2” lên tới 1.04 MPs

- Ống kính kèm theo: Canon EF-S 18-55mm IS STM

- Tên gọi khác: Canon Kiss X7i tại Nhật, Rebel T5i tại Mỹ', N'Chiếc máy ảnh này được Canon tung ra thị trường nhằm đáp ứng nhu cầu của những nhiếp ảnh gia cần một chiếc máy ảnh đơn giản nhưng hiệu quả. Chiếc DSLR này dùng cảm biến 18 megapixel Advanced Photo System type C (APS-C) và bộ xử lý ảnh DIGIC 5 mạnh mẽ của Canon cho chất lượng ảnh cao. Cùng với đó là dải ISO từ 100 lên tới 12.800, khả năng chụp liên tục 5 hình mỗi giây và lấy nét tự động 9 điểm. Nhờ vậy 700D có thể ghi lại cảnh sinh hoạt nhộn nhịp của cuộc sống hàng ngày ngay cả trong điều kiện thiếu sáng.', NULL, 600, CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/1gQ3BbCuwg4', 1, 400)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (47, N'Canon EOS 3000D ', N'Canon-EOS-3000D ', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/Canon-3000d.jpg', NULL, CAST(12000000 AS Decimal(18, 0)), CAST(9500000 AS Decimal(18, 0)), 6, N'- Bộ xử lý hình ảnh DIGIC 4+
- Hệ thống đo nét tiên tiến với 9 điểm
- Màn hình LCD 3.0inch 
- Tốc độ màn trập 30 - 1/4000giây
- Tốc độ chụp liên tục tối đa 3.0 hình/giây
- ISO 100-6400 (mở rộng 12800)
- Quay phim Full HD
- Kết nối Wifi / NFC
- Pin tương thích LP-E10
- Phụ kiện máy ảnh đi kèm : Pin, sạc pin, dây đeo, cataloge, phiếu bảo hành', N'Tháng 2, 2018, hãng Canon đã tung ra sản phẩm  máy ảnh Canon EOS 3000D tầm trung  giá cả rất phải chăng nhằm hướng đến người dùng mới bắt đầu tìm hiểu về máy ảnh. Với cảm biến CMOS cỡ APS-C 18 megapixel. So với các cảm biến điện thoại thông minh nhỏ hơn, cảm biến CMOS lớn giúp dễ dàng đạt được độ sâu trường ảnh nông sâu cần thiết để tạo ra hiệu ứng nhòe nền đẹp.  ', NULL, 690, CAST(N'2019-02-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/PXZpC5XM_Mo', 1, 500)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (48, N'CANON EOS 5D MARK IV', N'CANON-EOS-5D-MARK-IV', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/5D.jpg', NULL, CAST(90000000 AS Decimal(18, 0)), CAST(8200000 AS Decimal(18, 0)), 12, N'Cảm biến: 30MP Full-Frame (30.4 triệu điểm ảnh hữu dụng)
- Chip xử lý hình ảnh: DIGIC 6+
- Số điểm nét AF: 61 điểm với điểm lấy nét 41 cross-points
- Dual Pixel RAW
- Loại kính ngắm: Khung ngắm công nghệ gương phản chiếu 5 mặt (pentaprism)
- Màn hình LCD chính: Màn hình tinh thể lỏng màu TFT 3.2 inches, Cảm ứng hoàn toàn,
- Khả năng quay video: 4K
- Chế độ đo sáng: Hệ thống bộ cảm biến đo sáng RGB+IR xấp xỉ 150.000 pixel
- Chế độ khử flicker
- Tích hợp: kết nối Wi-Fi và NFC
- Thẻ nhớ: SD/ SDHC/ SDXC, CompactFlash Type II
- Tuổi thọ pin (theo CIPA): 900 tấm khi sạc đầy
- Cổng kết nối: USB 3.0, HDMI
- Kích thước: 150.7 x 116.4 x 75.9mm
- Khối lượng: 890g', N'Mới đây, những người yêu thích bộ môn nhiếp ảnh như vỡ òa khi mà hãng Canon ra mắt một siêu phẩm mới máy ảnh Canon EOS 5D Mark IV. Chiếc DSLR này đã đáp ứng được sự kỳ vọng mà tất cả mọi người mong đợi với những cải tiến vượt bậc bởi những công nghệ tiên tiến nhất hiện nay đem đến cho người dùng những tiện ích nổi trội. ', NULL, 799, CAST(N'2019-01-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/uP1b8VASInU', 1, 20)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (49, N'Canon EOS 800D kit', N'Canon-EOS-800D-kit', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/800D.jpg', NULL, CAST(20000000 AS Decimal(18, 0)), CAST(1890000 AS Decimal(18, 0)), 12, N'Cảm biến: CMOS APS-C 24MP
Chip xử lý: DIGIC 7
Lấy nét AF: 45 điểm cross-type
Công nghệ lấy nét Dual Pixel
Tốc độ chụp liên tục: 6 ảnh/giây
Tốc độ màn trập: 30s-1/4000s
Ống ngắm quan học OVF bao phủ 95%, phóng đại 0.82X
Màn hình LCD cảm ứng xoay lật đa chiều 3 inch
Quay phim: Full HD 60p (tính năng HDR)
Thẻ nhớ: SD/SDHC/SDXC (chuẩn UHS-I)
Pin: LP-E17 (600 tấm)
Kết nối: Wi-fi, NFC, mini HDMI, USB', N'Canon EOS 800D hay còn gọi với cái tên khác là Rebel T7i một DSLR entry-level nhằm mục đích tiếp cận nhiếp ảnh gia muốn một bước lên từ các mô hình cơ bản nhất được công bố vào 02/2017.', NULL, 800, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/Zqet4Tcpcpc', 1, 20)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (50, N'Canon PowerShot SX430 IS', N'Canon-PowerShot-SX430-IS', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/PowerShot.jpg', NULL, CAST(11400000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), 12, N'- Cảm biến CMOS 20.0 megapixel 
- Bộ xử lý hình ảnh Digic 4+
- Màn hình 3.0 inch 
- Zoom Quang học 45x (24mm – 1080mm) 
- Zoomplus lên tới 90x
- Độ nhạy sáng ISO 100-800
- Tốc độ màn chập 15 – 1/4000 giây
- Tốc độ chụp 5.0 ảnh/giây 
- Quay phim HD 1280 x 720
- Tích hợp Wifi và NFC
- Sử dụng Pin NB-11LH
- Phụ kiện máy ảnh đi kèm: Pin, Sạc pin, Dây đeo, Cataloge, Phiếu bảo hành', N'owerShot SX430 IS là một máy ảnh 20.0 megapixel phù hợp cho những chuyến đi du lịch với khả năng zoom quang học 45x, cho bạn khả năng chụp cận cảnh ấn tượng. Báng pin dạng công thái học cũng giúp thao tác tốt hơn, đặc biệt hữu dụng để ghi video và đảm bảo hình ảnh ổn định. Với tính năng Wi-Fi/NFC tích hợp, việc chia sẻ hình ảnh trên mạng xã hội chưa bao giờ đơn giản đến thế. ', NULL, 460, CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/Qo_kpNmVhUs', 1, 12)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (51, N'Canon EOS 77D', N'Canon-EOS-77D', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/77D.jpg', NULL, CAST(11200000 AS Decimal(18, 0)), NULL, 12, N'- Cảm biến CMOS APS-C 24.2MP
- Bộ xử lý hình ảnh DIGIC 7
- Màn hình cảm ứng LCD 3inch 1.04m-Dot
- Quay video Full HD 1080p tại 60fps
- Hệ thống lấy nét theo pha 45 điểm Cross-Type
- Dual Pixel CMOS AF
- Tốc độ chụp liên tục 6fps, ISO mở rộng 51200
- Tích hợp kết nối Wifi, NFC, Bluetooth
- Cảm biến RGB+IR 7560 Pixel
- Pin tương thích LP-E17', N'Máy ảnh Canon EOS 77D là bản cập nhật của Canon cho máy ảnh Canon 760D , và cung cấp một máy ảnh SLR kỹ thuật số nhỏ gọn dành cho phân khúc cao cấp hơn (thuộc phân khúc dưới Canon EOS 80D )', NULL, 567, CAST(N'2018-12-12T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/DcfpFvlIkw8', 1, 19)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (52, N'Canon EOS 6D Mark II', N'Canon-EOS-6D-Mark-II', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/6D.jpg', NULL, CAST(15000000 AS Decimal(18, 0)), NULL, 14, N'- Cảm biến: 26.2 MP, full-frame, 6.240 x 4.160 pixel
- Bộ xử lý hình ảnh: DIGIC 7
- Màn hình: LCD 3" cảm ứng, Clear View II, xoay và lật
- ISO: 100 - 40.000
- Tốc độ màn trập: 1/4.000 giây
- Chụp liên tiếp: 6,5 fps
- Cảm biến đo sáng: 7560-pixel RGB+IR (tương tự EOS 80D)
- Quay phim: Full HD 1.920 x 1.080 pixel @ 60 fps / 30 fps / 24 fps,
- Kết nối: Wi-Fi chuẩn n, Bluetooth 4.1 LE
 NFC, GPS + GLONASS + QZSS
- Giao tiếp: USB 2.0, HDMI mini (type C), microphone, đèn flash
- Thẻ nhớ: SD (SDHC/SDXC) UHS-I
- Kích thước: 144.0 x 110.5 x 74.8mm
- Khối lượng: 685g (thân máy), 765g (Pin và thẻ nhớ)', N'Máy ảnh Canon EOS 6D Mark II là chiếc máy ảnh cao cấp được nâng cấp từ người đàn anh Canon 6D đã được sãn xuất từ năm 2012. Với những tính năng độc đáo của một chiếc máy ảnh cao cấp, 6D mark II sẽ mang đến cho bạn những trải nghiệm thú vị, giúp bạn ghi lại những khoảnh khắc ấn tượng và độc đáo trong cuộc sống hàng ngày. ', NULL, 700, CAST(N'2019-03-02T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/zJ3LaTXTpz', 1, 23)
INSERT [dbo].[SanPham] ([ID], [TenSanPham], [DinhDanh], [IDDanhMucSanPham], [HinhAnh], [NhieuAnhHon], [Gia], [GiaKhuyenMai], [BaoHanh], [MoTa], [NoiDung], [TrangChu], [DemLuotXem], [NgayTao], [NguoiTao], [NgayCapNhat], [NguoiCapNhat], [TheTuKhoa], [TheMoTa], [TrangThai], [LinkYoutubeProduct], [DoiTra], [SoLuongHang]) VALUES (55, N'Canon EOS 750D', N'Canon-EOS-750D', 7, N'/assets/Client/images/ProductCategory/Product/mayanh/750D.jpg', NULL, CAST(29000000 AS Decimal(18, 0)), NULL, 16, N' Cảm biến CMOS 24.2 megapixel.
- Bộ xử lý hình ảnh DIGIC 6
- Hệ thống lấy nét lai (Hybrid CMOS AF III)
- Hệ thống đo nét tiên tiến với 19 điểm
- Màn hình LCD 3.0inch cảm ứng
- Tốc độ màn trập 1/4000 giây đến 30 giây
- Tốc độ chụp liên tục tối đa 5.0 hình/giây
- ISO 100-6400 ( mở rộng 12800)
- Thẻ nhớ tương thích : SD/ SDHC/SDXC
- Quay phim Full HD
- Hỗ trợ Wi-Fi và NFC
- Trọng lượng  565g
- Phù hợp với  Đèn Speedlite seri EX
- Đo sáng đèn flash Đèn flash tự động E-TTL II
- Ống kính đi kèm : EF50F1.8 IS STM
- Pin tương thích LP-E17
- Phụ kiện máy ảnh đi kèm : Pin, sạc pin, dây đeo,đĩa CD, cataloge, phiếu bảo hành', N'Nếu ở phân khúc cao cấp Canon vẫn duy trì vị thế nhất định của mình, thì phân khúc tầm trung hãng lại bị các đối thủ như Nikon hay Fujifilm cạnh tranh khá mạnh. Việc ra đời của máy ảnh Canon EOS 750D là để hãng này để tìm lại chỗ đứng.', NULL, 600, CAST(N'2019-03-05T00:00:00.000' AS DateTime), N'Son', NULL, NULL, N'may-anh', NULL, 1, N'https://www.youtube.com/embed/Q5SPz2rTgHo', 1, 20)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([ID], [TenSanPham], [MoTa], [HinhAnh], [Url], [ThuTuHienThi], [TieuDe1], [TieuDe3], [TieuDe2], [TrangThai], [IDSanPham]) VALUES (1, N'Loa Vi Tính AW200', N'
Dàn loa máy tính hiện đại chất lượng hay đến từng giây!
', N'/assets/Client/images/slide-1-image.png', N'/productdetail?productcategory=loa&product=loa-vi-tinh-AW200', 1, N'/assets/Client/images/flower2.PNG', N'Chỉ với  700.000 đ', N'GIẢM GIÁ TỚI 30%', 1, 17)
INSERT [dbo].[Slides] ([ID], [TenSanPham], [MoTa], [HinhAnh], [Url], [ThuTuHienThi], [TieuDe1], [TieuDe3], [TieuDe2], [TrangThai], [IDSanPham]) VALUES (6, N'Tivi Samsung 49 inch G2', N'Tivi Samsung 49 inch G2 hỗ trợ HDR mới nhất!
', N'/assets/Client/images/slide-3-image.jpg', N'/productdetail?productcategory=ti-vi&product=samsung-49-inch-G2', 2, N'/assets/Client/images/flower2.PNG', N' Chỉ Với 6.999.999 đ', N'GIẢM 1 TRIỆU VNĐ', 1, 1)
INSERT [dbo].[Slides] ([ID], [TenSanPham], [MoTa], [HinhAnh], [Url], [ThuTuHienThi], [TieuDe1], [TieuDe3], [TieuDe2], [TrangThai], [IDSanPham]) VALUES (8, N'Smart Tivi Samsung 4K 49 inch UA43NU7100 ', N'
Smart Tivi Samsung 4K 49 inch UA43NU7100 có độ phân giải 4K sắc nét gấp 4 lần Full HD cho hình ảnh cực nét
', N'/assets/Client/images/UA43NU7100_2.png', N'/productdetail?productcategory=ti-vi&product=smart-tivi-samsung-4k-49-inch-ua43nu7100', 3, N'/assets/Client/images/flower2.PNG', N' Chỉ Với 10.000.000 đ', N'GIẢM GIÁ TỚI 17%', 1, 6)
SET IDENTITY_INSERT [dbo].[Slides] OFF
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [Email], [PasswordMaHoa], [SoLanDangNhapSai], [KhoaTaiKhoan], [NgayTaiKhoanHetHan], [ChucVu], [XacDinhQuanTri]) VALUES (N'a', N'sprice_scout_007@yahoo.com', N's', 0, 0, NULL, N'Persion', 0)
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [Email], [PasswordMaHoa], [SoLanDangNhapSai], [KhoaTaiKhoan], [NgayTaiKhoanHetHan], [ChucVu], [XacDinhQuanTri]) VALUES (N'aaa', N'abcde@gmail.com', N'aaa', 0, 0, NULL, N'Persion', 0)
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [Email], [PasswordMaHoa], [SoLanDangNhapSai], [KhoaTaiKhoan], [NgayTaiKhoanHetHan], [ChucVu], [XacDinhQuanTri]) VALUES (N'admin', N'adminstrator@gmail.com', N'abc@123', 0, 0, NULL, N'Admin', 1)
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [Email], [PasswordMaHoa], [SoLanDangNhapSai], [KhoaTaiKhoan], [NgayTaiKhoanHetHan], [ChucVu], [XacDinhQuanTri]) VALUES (N'DamNgocSon', N'Son@company.com', N'123', 0, 0, NULL, N'Persion', 0)
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [Email], [PasswordMaHoa], [SoLanDangNhapSai], [KhoaTaiKhoan], [NgayTaiKhoanHetHan], [ChucVu], [XacDinhQuanTri]) VALUES (N'sads', N'abcde@gmail.com', N'12345', 0, 0, NULL, N'Persion', 0)
INSERT [dbo].[ThongTinCuaHang] ([ID], [TenCuaHang], [SDT], [Logo], [ViTri], [ThoiGianLamViec], [Email]) VALUES (1, N'SammiShop', N'0976264789', N'/assets/Client/images/Sammi/SammiShop.png', N'112 Hoàng Quốc Việt, Cổ Nhuế, Hà Nội', N'Từ 8h - 21h các ngày trong tuần', N'SammiShop@company.com')
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF_TaiKhoan_SoLanDangNhapSai_1]  DEFAULT ((0)) FOR [SoLanDangNhapSai]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF_TaiKhoan_KhoaTaiKhoan_1]  DEFAULT ((0)) FOR [KhoaTaiKhoan]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF_TaiKhoan_ChucVu_1]  DEFAULT ('Persion') FOR [ChucVu]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [DF_TaiKhoan_XacDinhQuanTri_1]  DEFAULT ((0)) FOR [XacDinhQuanTri]
GO
ALTER TABLE [dbo].[BaiDang]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.PostCategories_CategoryID] FOREIGN KEY([IDLoaiBaiDang])
REFERENCES [dbo].[LoaiBaiDang] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BaiDang] CHECK CONSTRAINT [FK_dbo.Posts_dbo.PostCategories_CategoryID]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatHang_DatHang] FOREIGN KEY([IDDatHang])
REFERENCES [dbo].[DatHang] ([ID])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [FK_ChiTietDatHang_DatHang]
GO
ALTER TABLE [dbo].[ChiTietDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDatHang_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[ChiTietDatHang] CHECK CONSTRAINT [FK_ChiTietDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChucNangNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ChucNangNguoiDung_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([ID])
GO
ALTER TABLE [dbo].[ChucNangNguoiDung] CHECK CONSTRAINT [FK_ChucNangNguoiDung_SanPham]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.MenuGroups_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[MenuGroups] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.MenuGroups_GroupID]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.ProductCategories_CategoryID] FOREIGN KEY([IDDanhMucSanPham])
REFERENCES [dbo].[DanhMucSanPham] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_dbo.Products_dbo.ProductCategories_CategoryID]
GO
ALTER TABLE [dbo].[TagBaiDang]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PostTags_dbo.Posts_PostID] FOREIGN KEY([IDBaiDang])
REFERENCES [dbo].[BaiDang] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagBaiDang] CHECK CONSTRAINT [FK_dbo.PostTags_dbo.Posts_PostID]
GO
ALTER TABLE [dbo].[TagBaiDang]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PostTags_dbo.Tags_TagID] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagBaiDang] CHECK CONSTRAINT [FK_dbo.PostTags_dbo.Tags_TagID]
GO
ALTER TABLE [dbo].[TagsSanPham]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductTags_dbo.Products_ProductID] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagsSanPham] CHECK CONSTRAINT [FK_dbo.ProductTags_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[TagsSanPham]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductTags_dbo.Tags_TagID] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TagsSanPham] CHECK CONSTRAINT [FK_dbo.ProductTags_dbo.Tags_TagID]
GO
ALTER TABLE [dbo].[ThongTinNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinNguoiDung_TaiKhoan] FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[ThongTinNguoiDung] CHECK CONSTRAINT [FK_ThongTinNguoiDung_TaiKhoan]
GO
/****** Object:  StoredProcedure [dbo].[AccountRegister]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AccountRegister]
@TenTaiKhoan varchar(50),
@Email varchar(30),
@Password varchar(50)
as
begin	
	insert into TaiKhoan(TenTaiKhoan,Email, PasswordMaHoa)
		values(@TenTaiKhoan,@Email,@Password)
end
GO
/****** Object:  StoredProcedure [dbo].[ComfirmCart]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ComfirmCart]
@HoTenKhachHang nvarchar(256),
@EmailKhachHang nvarchar(256),
@SDTKhachHang nvarchar(50),
@DiaChiKhachHang nvarchar(256),
@Ngaytao datetime
as
begin
	insert into DatHang(HoTenKhachHang, EmailKhachHang, SDTKhachHang,DiaChiKhachHang, NgayTao)
	values (@HoTenKhachHang,@EmailKhachHang,@SDTKhachHang,@DiaChiKhachHang,@Ngaytao)
end
GO
/****** Object:  StoredProcedure [dbo].[laythongtintaikhoan]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[laythongtintaikhoan]
@username varchar(50)
as
begin
	select*from ThongTinNguoiDung where TenTaiKhoan=@UserName
end
GO
/****** Object:  StoredProcedure [dbo].[Login_acconut]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Login_acconut]
@TenTaiKhoan varchar(50),
@PasswordMaHoa varchar(50)
as
begin
  declare @count int
  declare @res bit
	select @count = COUNT(*) from TaiKhoan where TenTaiKhoan = @TenTaiKhoan and PasswordMaHoa = @PasswordMaHoa and ChucVu = 'Persion' 
	and KhoaTaiKhoan = 0 and XacDinhQuanTri = 0;
	if @count > 0
	set @res = 1
	else
	set @res = 0
	select @res
end
GO
/****** Object:  StoredProcedure [dbo].[Login_acconut_Admin]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Login_acconut_Admin]
@TenTaiKhoan varchar(50),
@PasswordMaHoa varchar(50)
as
begin
  declare @count int
  declare @res bit
	select @count = COUNT(*) from TaiKhoan where TenTaiKhoan = @TenTaiKhoan and PasswordMaHoa = @PasswordMaHoa and XacDinhQuanTri = 1
	and KhoaTaiKhoan = 0;
	if @count > 0
	set @res = 1
	else
	set @res = 0
	select @res
end
GO
/****** Object:  StoredProcedure [dbo].[SendFeedback]    Script Date: 11/27/2019 6:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SendFeedback]
@HoTenKhachHang nvarchar(256),
@EmailKhachHang nvarchar(256),
@SDTKhachHang nvarchar(256),
@Tieude nvarchar(256),
@LoiNhanKhachHang nvarchar(256),
@NgayTao datetime
as
begin	
	insert into PhanHoi(HoTenKhachHang, EmailKhachHang, SDTKhachHang, Tieude, LoiNhanKhachHang, NgayTao)
	values (@HoTenKhachHang,@EmailKhachHang,@SDTKhachHang,@Tieude,@LoiNhanKhachHang, @NgayTao )
end
GO
USE [master]
GO
ALTER DATABASE [HomeShoppe] SET  READ_WRITE 
GO
