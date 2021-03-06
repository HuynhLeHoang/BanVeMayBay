USE [master]
GO
/****** Object:  Database [BanVeMayBay]    Script Date: 12/27/2019 8:48:24 AM ******/
CREATE DATABASE [BanVeMayBay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanVeMayBay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.DKYUUBY\MSSQL\DATA\BanVeMayBay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanVeMayBay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.DKYUUBY\MSSQL\DATA\BanVeMayBay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BanVeMayBay] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanVeMayBay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanVeMayBay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanVeMayBay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanVeMayBay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanVeMayBay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanVeMayBay] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanVeMayBay] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BanVeMayBay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanVeMayBay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanVeMayBay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanVeMayBay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanVeMayBay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanVeMayBay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanVeMayBay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanVeMayBay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanVeMayBay] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BanVeMayBay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanVeMayBay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanVeMayBay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanVeMayBay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanVeMayBay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanVeMayBay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanVeMayBay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanVeMayBay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanVeMayBay] SET  MULTI_USER 
GO
ALTER DATABASE [BanVeMayBay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanVeMayBay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanVeMayBay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanVeMayBay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BanVeMayBay] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BanVeMayBay', N'ON'
GO
ALTER DATABASE [BanVeMayBay] SET QUERY_STORE = OFF
GO
USE [BanVeMayBay]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/27/2019 8:48:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[MaThanhVien] [nvarchar](10) NOT NULL,
	[TenThanhVien] [nvarchar](50) NULL,
	[Lop] [nvarchar](50) NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
 CONSTRAINT [PK__About__2BE0A0F0F819E239] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenBay]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenBay](
	[Title] [nvarchar](50) NULL,
	[UrlAnh] [text] NULL,
	[MaChuyenBay] [nvarchar](10) NOT NULL,
	[DiemDi] [nvarchar](100) NULL,
	[DiemDen] [nvarchar](100) NULL,
	[Ngay] [date] NULL,
	[ChuyenBay] [nvarchar](50) NULL,
	[KhoiHanh] [nvarchar](10) NULL,
	[Den] [nvarchar](10) NULL,
	[Gia] [int] NULL,
	[Thue] [int] NULL,
	[GiaTreEm] [int] NULL,
	[ThueTreEm] [int] NULL,
	[GiaVeTreSoSinh] [int] NULL,
	[SoCho] [int] NULL,
	[PlaneID] [varchar](10) NULL,
	[PilotID1] [varchar](10) NULL,
	[PilotID2] [varchar](10) NULL,
 CONSTRAINT [PK__ChuyenBa__9B5036A305FD0D70] PRIMARY KEY CLUSTERED 
(
	[MaChuyenBay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HanhKhach]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HanhKhach](
	[MaHanhKhach] [nvarchar](10) NOT NULL,
	[LoaiHanhKhach] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[MaHanhLy] [varchar](3) NULL,
 CONSTRAINT [PK_HanhKhach] PRIMARY KEY CLUSTERED 
(
	[MaHanhKhach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HanhLy]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HanhLy](
	[MaHanhLy] [varchar](3) NOT NULL,
	[TenHanhLy] [varchar](100) NULL,
	[LoaiHanhLy] [int] NULL,
	[GiaTien] [int] NULL,
 CONSTRAINT [PK_HanhLy] PRIMARY KEY CLUSTERED 
(
	[MaHanhLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [nvarchar](10) NOT NULL,
	[HoTenKhachHang] [nvarchar](100) NULL,
	[KhuVuc] [nvarchar](50) NULL,
	[DienThoai] [nchar](10) NULL,
	[Email] [nchar](100) NULL,
	[Diachi] [nvarchar](100) NULL,
	[MaThanhToan] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang_ChuyenBay]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang_ChuyenBay](
	[MaHanhKhach] [nvarchar](10) NOT NULL,
	[MaKhachHang] [nvarchar](10) NOT NULL,
	[MaChuyenBay] [nvarchar](10) NOT NULL,
	[MaCode] [nvarchar](10) NOT NULL,
	[TongTien] [int] NULL,
	[NgayDatVe] [date] NULL,
	[NgayBay] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MayBay]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MayBay](
	[PlaneID] [varchar](10) NOT NULL,
	[MadeIn] [nvarchar](50) NULL,
	[PlaneName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhiCong]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhiCong](
	[PilotID] [varchar](10) NOT NULL,
	[PilotName] [nvarchar](50) NULL,
	[PilotAge] [int] NULL,
	[PilotAddress] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[PilotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhToan]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhToan](
	[MaThanhToan] [int] NOT NULL,
	[TenHinhThucThanhToan] [nvarchar](100) NULL,
 CONSTRAINT [PK_ThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaThanhToan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0001      ', N'Lê Hoàng Huynh', N'Bảo đảm an toàn thông tin', N'LHH', N'a18848bd8b4a8375b976b83550fe1a06', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0002      ', N'Phạm Đăng Khoa', N'Bảo đảm an toàn thông tin', N'PDK', N'cb31e2e4cdd569aad3ca5c3fc149ecb1', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0003      ', N'Lê Ngọc Dự', N'An ninh hệ thống thông tin', N'LND', N'9b619a81ef0b0c7ab081e3f0aeafc96f', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0004      ', N'Nguyễn Trọng Long', N'Công nghệ thông tin 1', N'NTL', N'18204185d319f620fdd669d5ed699e8d', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0005', N'Người quản trị', N'Người quản trị', N'admin', N'dece13c4ed94eaf263ed058498a69795', N'ADMIN')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'6', N'LHH', NULL, N'LHNQ', N'84ffadbbc961519261648530b886c437', N'MEMBER')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoCho], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0001', N'Hà Nội (HAN)', N'TP.Hồ Chí Minh (SGN)', CAST(N'2019-12-19' AS Date), N'MTA Air', N'7:00      ', N'9:00      ', 599000, 233000, 415000, 120000, 100000, 137, N'MB0001    ', N'PC0001    ', N'PC0005    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoCho], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0002', N'Hà Nội (HAN)', N'TP.Hồ Chí Minh (SGN)', CAST(N'2019-10-23' AS Date), N'MTA Air', N'7:30      ', N'9:30      ', 823000, 137000, 634000, 50000, 75000, 246, N'MB0002    ', N'PC0002    ', N'PC0006    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoCho], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0003', N'Hà Nội (HAN)', N'TP.Hồ Chí Minh (SGN)', CAST(N'2019-10-23' AS Date), N'MTA Air', N'12:30     ', N'14:40   ', 1599000, 415000, 635000, 415000, 467000, 154, N'MB0003    ', N'PC0003    ', N'PC0007    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoCho], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0004', N'Hà Nội (HAN)', N'TP.Hồ Chí Minh (SGN)', CAST(N'2019-10-23' AS Date), N'MTA Air', N'12:00     ', N'14:00     ', 1345000, 267000, 1100000, 345000, 576000, 155, N'MB0004    ', N'PC0004    ', N'PC0008    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoCho], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet', N'vietJet.png', N'CB0009', N'TP.Hồ Chí Minh (SGN)', N'Hà Nội (HAN)', CAST(N'2020-01-02' AS Date), N'MTA Air', N'10:00', N'12:00', 1665000, 300000, 600000, 150000, 500000, 200, N'MB0003', N'PC0001', N'PC0005')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoCho], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet', N'vietJet.png', N'CB0010', N'TP.Hồ Chí Minh (SGN)', N'Hà Nội (HAN)', CAST(N'2019-11-14' AS Date), N'MTA Air', N'12:00     ', N'14:00     ', 1345000, 267000, 1100000, 345000, 576000, 237, NULL, NULL, NULL)
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'ADD_FLIGHT')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'DELETE_TICKET')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'EDIT_FLIGHT')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'EDIT_TICKET')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'MEMBER', N'DELETE_TICKET')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'MEMBER', N'EDIT_TICKET')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'39609FE1-0', N'Người Lớn', N'Ông', N'LE NGOC DU', CAST(N'1997-12-19' AS Date), N'12')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'3E0366A9-0', N'Trẻ sơ sinh', N'Nữ', N'NGUYEN THI A', CAST(N'2019-11-20' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'6493B1AE-3', N'Người Lớn', N'Ông', N'LE NGOC DU', CAST(N'1999-12-19' AS Date), N'14')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'64D11ABF-9', N'Trẻ em', N'Nữ', N'LE THI CA', CAST(N'2005-11-20' AS Date), N'11')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'6528726F-1', N'Người Lớn', N'Ông', N'Phạm Đăng Khoa', CAST(N'1970-01-28' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'76B251EC-C', N'Người Lớn', N'Ông', N'LE VAN VAN', CAST(N'1997-12-19' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'7FEECCDD-7', N'Trẻ sơ sinh', N'Nam', N'NGUYEN VAN A', CAST(N'2019-01-01' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'809BF88B-6', N'Trẻ sơ sinh', N'Nam', N'NGUYEN VAN A', CAST(N'2018-01-01' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'8D41DEF4-3', N'Người Lớn', N'Ông', N'LE NGOC DU', CAST(N'1997-12-19' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'B1B2506D-D', N'Trẻ em', N'Nữ', N'LE THI CH', CAST(N'2006-11-20' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'DB6CC13B-F', N'Trẻ em', N'Nữ', N'LE THI C', CAST(N'2005-06-15' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [LoaiHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'F830C0E4-B', N'Trẻ em', N'Nữ', N'LE THI C', CAST(N'2005-11-20' AS Date), N'1')
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'1', N'Không mua thêm hành lý', 0, 0)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'11', N'Gói 3 - 25kg - 260.000 VNÐ', 25, 260000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'12', N'Gói 4 - 30kg - 370.000 VNÐ', 30, 370000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'13', N'Gói 5 - 35kg - 430.000 VNÐ', 35, 430000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'14', N'Gói 6 - 40kg - 480.000 VNÐ', 40, 480000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'2', N'Gói 1 - 15kg - 175.000 VNÐ', 15, 175000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'3', N'Gói 2 - 20kg - 196.000 VNÐ', 20, 196000)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi], [MaThanhToan]) VALUES (N'22A1BD40-1', N'Phạm Đăng Khoa', N'Vietnam', N'0976567845', N'phamdangkhoa@gmail.com                                                                              ', N'236 Hoàng Quốc Việt ', 3)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi], [MaThanhToan]) VALUES (N'2BB72BE3-3', N'Le Ngoc Du', N'Vietnam', N'0983872992', N'phambangbang1235@gmail.com                                                                          ', N'555', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi], [MaThanhToan]) VALUES (N'C301CFE4-8', N'LE VAN VAN', N'Vietnam', N'0165236542', N'lengocdu1912@gmail.com                                                                              ', N'Hà Nội', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi], [MaThanhToan]) VALUES (N'CFC5925D-D', N'Le Ngoc Du', N'Vietnam', N'0983872994', N'phambangbang1235@gmail.com                                                                          ', N'54545', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi], [MaThanhToan]) VALUES (N'FC874CBC-2', N'Le Ngoc Du', N'Vietnam', N'0983872992', N'lengocdu1912@gmail.com                                                                              ', N'123', 1)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'6528726F-1', N'22A1BD40-1', N'CB0001', N'ZOTWKCKL', 1028000, CAST(N'2019-12-16' AS Date), CAST(N'2019-12-19' AS Date))
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'8D41DEF4-3', N'FC874CBC-2', N'CB0009', N'KSQRXTJP', 3390000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'F830C0E4-B', N'FC874CBC-2', N'CB0009', N'KSQRXTJP', 3390000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'809BF88B-6', N'FC874CBC-2', N'CB0009', N'KSQRXTJP', 3390000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'39609FE1-0', N'2BB72BE3-3', N'CB0009', N'RGZOIWVF', 3781000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'B1B2506D-D', N'2BB72BE3-3', N'CB0009', N'RGZOIWVF', 3781000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'7FEECCDD-7', N'2BB72BE3-3', N'CB0009', N'RGZOIWVF', 3781000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'6493B1AE-3', N'CFC5925D-D', N'CB0009', N'EBIEITRG', 3955000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'64D11ABF-9', N'CFC5925D-D', N'CB0009', N'EBIEITRG', 3955000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'3E0366A9-0', N'CFC5925D-D', N'CB0009', N'EBIEITRG', 3955000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaHanhKhach], [MaKhachHang], [MaChuyenBay], [MaCode], [TongTien], [NgayDatVe], [NgayBay]) VALUES (N'76B251EC-C', N'C301CFE4-8', N'CB0009', N'JFZBKRDN', 2161000, CAST(N'2019-12-27' AS Date), NULL)
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0001    ', N'VietNam', N'MTA 787')
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0002    ', N'VietNam', N'MTA 789')
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0003    ', N'VietNam', N'MTA 790')
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0004    ', N'VietNam', N'MTA 791')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0001    ', N'Lê Hoàng Huynh', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0002    ', N'Phạm Đăng Khoa', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0003    ', N'Lê Ngọc Dự', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0004    ', N'Nguyễn Trọng Long', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0005    ', N'Nguyễn Thị B', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_FLIGHT', N'Thêm chuyến bay ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_FLIGHT', N'Xóa chuyến bay ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_TICKET', N'Xóa Vé')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_FLIGHT', N'Sửa chuyến bay ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_TICKET', N'Sửa Vé')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_FLIGHT', N'Xem danh sách chuyến bay')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [TenHinhThucThanhToan]) VALUES (1, N'THANH TOÁN  TẠI PHÒNG VÉ')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [TenHinhThucThanhToan]) VALUES (2, N'THANH TOÁN TẠI ÐỊA CHỈ QUÝ KHÁCH YÊU CẦU')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [TenHinhThucThanhToan]) VALUES (3, N'THANH TOÁN BẰNG HÌNH THỨC CHUYỂN KHOẢN')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [TenHinhThucThanhToan]) VALUES (4, N'THANH TOÁN TRỰC TUYẾN BẰNG THẺ ATM')
INSERT [dbo].[ThanhToan] ([MaThanhToan], [TenHinhThucThanhToan]) VALUES (6, N'THANH TOÁN TRỰC TUYẾN BẰNG THẺ Visa, Master, JCB')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản Trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành Viên')
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_UserGroup] FOREIGN KEY([GroupID])
REFERENCES [dbo].[UserGroup] ([ID])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_UserGroup]
GO
ALTER TABLE [dbo].[ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenBay_MayBay] FOREIGN KEY([PlaneID])
REFERENCES [dbo].[MayBay] ([PlaneID])
GO
ALTER TABLE [dbo].[ChuyenBay] CHECK CONSTRAINT [FK_ChuyenBay_MayBay]
GO
ALTER TABLE [dbo].[ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_ChuyenBay_PhiCong] FOREIGN KEY([PilotID1])
REFERENCES [dbo].[PhiCong] ([PilotID])
GO
ALTER TABLE [dbo].[ChuyenBay] CHECK CONSTRAINT [FK_ChuyenBay_PhiCong]
GO
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_Role]
GO
ALTER TABLE [dbo].[Credential]  WITH CHECK ADD  CONSTRAINT [FK_Credential_UserGroup] FOREIGN KEY([UserGroupID])
REFERENCES [dbo].[UserGroup] ([ID])
GO
ALTER TABLE [dbo].[Credential] CHECK CONSTRAINT [FK_Credential_UserGroup]
GO
ALTER TABLE [dbo].[HanhKhach]  WITH CHECK ADD  CONSTRAINT [FK_HanhKhach_HanhLy] FOREIGN KEY([MaHanhLy])
REFERENCES [dbo].[HanhLy] ([MaHanhLy])
GO
ALTER TABLE [dbo].[HanhKhach] CHECK CONSTRAINT [FK_HanhKhach_HanhLy]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ThanhToan] FOREIGN KEY([MaThanhToan])
REFERENCES [dbo].[ThanhToan] ([MaThanhToan])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ThanhToan]
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChuyenBay_ChuyenBay] FOREIGN KEY([MaChuyenBay])
REFERENCES [dbo].[ChuyenBay] ([MaChuyenBay])
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay] CHECK CONSTRAINT [FK_KhachHang_ChuyenBay_ChuyenBay]
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChuyenBay_HanhKhach1] FOREIGN KEY([MaHanhKhach])
REFERENCES [dbo].[HanhKhach] ([MaHanhKhach])
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay] CHECK CONSTRAINT [FK_KhachHang_ChuyenBay_HanhKhach1]
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChuyenBay_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay] CHECK CONSTRAINT [FK_KhachHang_ChuyenBay_KhachHang]
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Account_Login]
	@username varchar(20),
	@password varchar(32)
as
begin 
	declare @count int
	declare @res bit
	select @count = count(*) from Admin as a where a.UserName = @username and a.Password = @password
	if @count > 0
		set @res = 1
	else 
		set @res = 0
	select @res
end

GO
/****** Object:  StoredProcedure [dbo].[GenerateCode]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateCode]
@MaHanhKhach nvarchar(10),
@MaKhachHang nvarchar(10),
@MaChuyenBay nvarchar(10),
@MaCode nvarchar(10),
@tonggiave int,
@ngayDatve date 
as 
begin 
	insert into KhachHang_ChuyenBay(MaHanhKhach,MaKhachHang, MaChuyenBay, MaCode, TongTien,NgayDatVe) values (@MaHanhKhach,@MaKhachHang, @MaChuyenBay, @MaCode, @tonggiave,@ngayDatve)

end

GO
/****** Object:  StoredProcedure [dbo].[ThemHanhKhach]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ThemHanhKhach]
@LoaiHanhKhach nvarchar(50),
@GioiTinh nvarchar(3),
@HoTen nvarchar(50),
@NgaySinh date,
@MaHanhLi int 
as
begin 
	declare @count int
	declare @MaHanhKhach nvarchar (10)
	declare @randomString nvarchar(10)
	SELECT @randomString = CONVERT(varchar(255), NEWID())
	select @count = count(*) from HanhKhach as hk where hk.GioiTinh = @GioiTinh and hk.HoTen = @HoTen and hk.NgaySinh = @NgaySinh and hk.MaHanhLy = @MaHanhLi
	if(@count = 0)
		insert into HanhKhach(MaHanhKhach,LoaiHanhKhach,GioiTinh, HoTen, NgaySinh, MaHanhLy) values(@randomString, @LoaiHanhKhach,@GioiTinh, @HoTen, @NgaySinh, @MaHanhLi)
end

GO
/****** Object:  StoredProcedure [dbo].[ThemKhachHang]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ThemKhachHang]
@HoTen nvarchar(100),
@KhuVuc nvarchar(50),
@DienThoai nchar(10),
@email nchar(100),
@Diachi nvarchar(100),
@MaThanhToan int
as
begin 
	declare @count int 
	declare @MaKhachHang nchar(10)
	declare @randomString nvarchar(10)
	SELECT @randomString = CONVERT(varchar(255), NEWID())
	select @count = count(*) from KhachHang as kh where kh.DienThoai = @DienThoai and kh.Email = @email 
	if (@count = 0)
		insert into KhachHang(MaKhachHang,HoTenKhachHang,KhuVuc,DienThoai,Email,Diachi,MaThanhToan) values(@randomString, @HoTen, @KhuVuc, @DienThoai, @email, @Diachi,@MaThanhToan)
end


GO
/****** Object:  StoredProcedure [dbo].[ThongKe]    Script Date: 12/27/2019 8:48:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThongKe]
@ngay1 date,
@ngay2 date

as 
begin 
	declare @thongke int 
	select @thongke = count(*) from KhachHang_ChuyenBay as a where a.NgayDatVe >= N'2019-11-11' and a.NgayDatVe <= N'2019-11-14'
	select @thongke
end 


GO
USE [master]
GO
ALTER DATABASE [BanVeMayBay] SET  READ_WRITE 
GO
