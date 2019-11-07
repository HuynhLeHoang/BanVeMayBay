USE [master]
GO
/****** Object:  Database [BanVeMayBay]    Script Date: 11/7/2019 10:13:12 PM ******/
CREATE DATABASE [BanVeMayBay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanVeMayBay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BanVeMayBay.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanVeMayBay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BanVeMayBay_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanVeMayBay] SET COMPATIBILITY_LEVEL = 120
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
USE [BanVeMayBay]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[MaThanhVien] [nvarchar](10) NOT NULL,
	[TenThanhVien] [nvarchar](50) NULL,
	[Lop] [nvarchar](50) NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[GroupID] [varchar](20) NULL,
 CONSTRAINT [PK__About__2BE0A0F0F819E239] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChuyenBay]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[SoChoConTrong] [int] NULL,
	[PlaneID] [varchar](10) NULL,
	[PilotID1] [varchar](10) NULL,
	[PilotID2] [varchar](10) NULL,
 CONSTRAINT [PK__ChuyenBa__9B5036A305FD0D70] PRIMARY KEY CLUSTERED 
(
	[MaChuyenBay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HanhKhach]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HanhKhach](
	[MaHanhKhach] [nvarchar](10) NOT NULL,
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HanhLy]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/7/2019 10:13:12 PM ******/
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
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang_ChuyenBay]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang_ChuyenBay](
	[MaKhachHang] [nvarchar](10) NULL,
	[MaChuyenBay] [nvarchar](10) NULL,
	[MaCode] [nvarchar](10) NOT NULL,
	[TongTien] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MayBay]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhiCong]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0001      ', N'Lê Hoàng Huynh', N'Bảo đảm an toàn thông tin', N'LHH', N'LHH', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0002      ', N'Phạm Đăng Khoa', N'Bảo đảm an toàn thông tin', N'PDK       ', N'PDK       ', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0003      ', N'Lê Ngọc Dự', N'An ninh hệ thống thông tin', N'LND       ', N'LND       ', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0004      ', N'Nguyễn Trọng Long', N'Công nghệ thông tin 1', N'NTL       ', N'NTL       ', N'MEMBER')
INSERT [dbo].[Admin] ([MaThanhVien], [TenThanhVien], [Lop], [UserName], [Password], [GroupID]) VALUES (N'0005', N'Người quản trị', N'Người quản trị', N'admin', N'admin', N'ADMIN')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoChoConTrong], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0001', N'Hà Nội (HAN)', N'TP.Hồ Chí Minh (SGN)', CAST(N'2019-10-23' AS Date), N'MTA Air', N'7:00      ', N'9:00      ', 599000, 233000, 415000, 120000, 100000, 137, N'MB0001    ', N'PC0001    ', N'PC0005    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoChoConTrong], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0002', N'Hà Nội (HAN)', N'Đà Nẵng (DAD)', CAST(N'2019-10-09' AS Date), N'MTA Air', N'7:00      ', N'9:00      ', 823000, 137000, 634000, 50000, 75000, 246, N'MB0002    ', N'PC0002    ', N'PC0006    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoChoConTrong], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0003', N'Đà Nẵng (DAD)', N'TP.Hồ Chí Minh (SGN)', CAST(N'2019-10-16' AS Date), N'MTA Air', N'12:00     ', N'14:00     ', 1599000, 415000, 635000, 415000, 467000, 78, N'MB0003    ', N'PC0003    ', N'PC0007    ')
INSERT [dbo].[ChuyenBay] ([Title], [UrlAnh], [MaChuyenBay], [DiemDi], [DiemDen], [Ngay], [ChuyenBay], [KhoiHanh], [Den], [Gia], [Thue], [GiaTreEm], [ThueTreEm], [GiaVeTreSoSinh], [SoChoConTrong], [PlaneID], [PilotID1], [PilotID2]) VALUES (N'VietJet                                           ', N'vietJet.png', N'CB0004', N'TP.Hồ Chí Minh (SGN)', N'Hà Nội (HAN)', CAST(N'2019-11-11' AS Date), N'MTA Air', N'12:00     ', N'14:00     ', 1345000, 267000, 1100000, 345000, 576000, 64, N'MB0004    ', N'PC0004    ', N'PC0008    ')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'ADD_FLIGHT')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'EDIT_FLIGHT')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'7F8FB56A-8', N'Nam', N'Lê Ngọc Dự ', CAST(N'2012-09-20' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'908F4C8D-D', N'Ông', N'Lê Văn Thắng ', CAST(N'1998-08-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH0001', N'Bà', N'Lê Thị A', CAST(N'1967-08-20' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH0002    ', N'Ông', N'Nguyễn Văn B', CAST(N'1967-09-21' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH0003    ', N'Ông', N'Nguyễn Văn C', CAST(N'1985-08-22' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH0004    ', N'Ông', N'Nguyễn Văn D ', CAST(N'1986-08-23' AS Date), N'11')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH0005    ', N'Ông', N'Nguyễn Văn F', CAST(N'1987-08-24' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH0006    ', N'Ông', N'Nguyễn Văn G', CAST(N'1988-08-25' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH3012', N'Ông', N'Lê Văn Thắng ', CAST(N'1980-10-29' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH3039', N'Nam', N'Nguyễn Trung  Thành ', CAST(N'2015-06-17' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH3199', N'Nam', N'Lê Ngọc Dự ', CAST(N'2012-09-20' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH3214', N'Bà', N'Lê Thị Thu', CAST(N'1998-08-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH3675', N'Ông', N'Nguyễn Phi Lao', CAST(N'1968-01-28' AS Date), N'11')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH3678', N'Nữ', N'Nguyễn Thị Yến Vy ', CAST(N'2015-10-20' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH4286', N'Nam', N'Lê Ngọc Dự ', CAST(N'2017-10-20' AS Date), N'11')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH4373', N'Ông', N'Lê Thị Thu', CAST(N'1968-01-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH4920', N'Nam', N'Nguyễn Trung  Thành ', CAST(N'2015-06-17' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH4938', N'Ông', N'Nguyễn Mạnh Thiên ', CAST(N'1998-02-13' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH4997', N'Ông', N'Lê Văn Bê', CAST(N'1997-05-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH5006', N'Nam', N'Phạm Phùng Khoan ', CAST(N'2015-10-20' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH5165', N'Nam', N'Lê Ngọc Dự ', CAST(N'2015-06-17' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH6723', N'Nam', N'Lê Ngọc Dự ', CAST(N'2017-10-20' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH6729', N'Ông', N'Phạm Đăng Khoa', CAST(N'1998-08-28' AS Date), N'3')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH7127', N'Nam', N'Lê Ngọc Dự ', CAST(N'2017-10-20' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH7133', N'Ông', N'Phạm Đăng Khoa', CAST(N'1998-08-28' AS Date), N'1')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH8124', N'Ông', N'Nguyễn Phi Lao', CAST(N'1997-05-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH8139', N'Nam', N'Phạm Phùng Khoan ', CAST(N'2015-10-20' AS Date), N'11')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH8445', N'Bà', N'Lê Thị Thu', CAST(N'1998-08-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH8878', N'Ông', N'Phạm Đăng Khoa', CAST(N'1998-08-28' AS Date), N'2')
INSERT [dbo].[HanhKhach] ([MaHanhKhach], [GioiTinh], [HoTen], [NgaySinh], [MaHanhLy]) VALUES (N'KH9060', N'Nam', N'Lê Ngọc Dự ', CAST(N'2017-10-20' AS Date), N'3')
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'1', N'Không mua thêm hành lý', 0, 0)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'11', N'Gói 3 - 25kg - 260.000 VNÐ', 25, 260000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'12', N'Gói 4 - 30kg - 370.000 VNÐ', 30, 370000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'13', N'Gói 5 - 35kg - 430.000 VNÐ', 35, 430000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'14', N'Gói 6 - 40kg - 480.000 VNÐ', 40, 480000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'2', N'Gói 1 - 15kg - 175.000 VNÐ', 15, 175000)
INSERT [dbo].[HanhLy] ([MaHanhLy], [TenHanhLy], [LoaiHanhLy], [GiaTien]) VALUES (N'3', N'Gói 2 - 20kg - 196.000 VNÐ', 20, 196000)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH0001    ', N'Lê Thị A', N'Vietnam', N'0896489241', N'abc@gmail.com                                                                                       ', N'236 Hoàng Quốc Việt - Bắc Từ Liêm- Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH0002    ', N'Nguyễn Văn B', N'Vietnam', N'0898104526', N'abcd@gmail.com                                                                                      ', N'236 Hoàng Quốc Việt - Bắc Từ Liêm- Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH0003    ', N'Nguyễn Văn C', N'Vietnam', N'0896490631', N'ght@gmail.com                                                                                       ', N'236 Hoàng Quốc Việt - Bắc Từ Liêm- Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH0004    ', N'Long Bệt', N'Singapore', N'0329341583', N'longbet@gmail.com                                                                                   ', N'1')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH0005    ', N'Nguyễn Văn F', N'Vietnam', N'0896493523', N'ggg@gmail.com                                                                                       ', N'236 Hoàng Quốc Việt - Bắc Từ Liêm- Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH0006    ', N'Nguyễn Văn G', N'Vietnam', N'0896489103', N'gbf@gmail.com                                                                                       ', N'236 Hoàng Quốc Việt - Bắc Từ Liêm- Hà Nội')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH3453', N'Nguyễn Đức Vượng ', N'Vietnam', N'0976567845', N'nguyenducvuong1998@gmail.com                                                                        ', N'236 Hoàng Quốc Việt ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH4521', N'Lê Hoàng Huynh ', N'Vietnam', N'0987191111', N'lehoanghuynh1998@gmail.com                                                                          ', N'236 Hoàng Quốc Việt ')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKhachHang], [KhuVuc], [DienThoai], [Email], [Diachi]) VALUES (N'KH6851    ', N'Phạm Đăng Khoa', N'Vietnam', N'0332264122', N'phambangbang1235@gmail.com                                                                          ', N'236 Hoàng Quốc Việt - Bắc Từ Liêm- Hà Nội')
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'KH0004    ', N'CB0004', N'BRBYYH', NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'KH0002    ', N'CB0002', N'FERFERT', NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'KH0003    ', N'CB0003', N'TYNRGB', NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'KH0001    ', N'CB0001', N'YTUGHT', NULL)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'KH3012', N'CB0001', N'05F74103', 1717000)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'KH5165', N'CB0001', N'89713F73', 1717000)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'908F4C8D-D', N'CB0001', N'B82F2717', 1738000)
INSERT [dbo].[KhachHang_ChuyenBay] ([MaKhachHang], [MaChuyenBay], [MaCode], [TongTien]) VALUES (N'7F8FB56A-8', N'CB0001', N'12567B72', 1738000)
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0001    ', N'VietNam', N'MTA 787')
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0002    ', N'VietNam', N'MTA 789')
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0003    ', N'VietNam', N'MTA 790')
INSERT [dbo].[MayBay] ([PlaneID], [MadeIn], [PlaneName]) VALUES (N'MB0004    ', N'VietNam', N'MTA 791')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0001    ', N'Lê Hoàng Huynh', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0002    ', N'Phạm Đăng Khoa', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0003    ', N'Lê Ngọc Dự', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0004    ', N'Nguyễn Trọng Long', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0005    ', N'Nguyễn Thị B', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0006    ', N'Nguyễn Thị C', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0007    ', N'Nguyễn Thị D', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[PhiCong] ([PilotID], [PilotName], [PilotAge], [PilotAddress]) VALUES (N'PC0008    ', N'Nguyễn Thị E', 21, N'236 Hoàng Quốc Việt')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_FLIGHT', N'Thêm chuyến bay ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_FLIGHT', N'Xóa chuyến bay ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_FLIGHT', N'Sửa chuyến bay ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_FLIGHT', N'Xem danh sách chuyến bay')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Qu?n Tr?')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành Viên')
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
ALTER TABLE [dbo].[HanhKhach]  WITH CHECK ADD  CONSTRAINT [FK_HanhKhach_HanhLy] FOREIGN KEY([MaHanhLy])
REFERENCES [dbo].[HanhLy] ([MaHanhLy])
GO
ALTER TABLE [dbo].[HanhKhach] CHECK CONSTRAINT [FK_HanhKhach_HanhLy]
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChuyenBay_ChuyenBay] FOREIGN KEY([MaChuyenBay])
REFERENCES [dbo].[ChuyenBay] ([MaChuyenBay])
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay] CHECK CONSTRAINT [FK_KhachHang_ChuyenBay_ChuyenBay]
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChuyenBay_HanhKhach] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[HanhKhach] ([MaHanhKhach])
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay] CHECK CONSTRAINT [FK_KhachHang_ChuyenBay_HanhKhach]
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Account_Login]
	@username varchar(10),
	@password varchar(10)
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
/****** Object:  StoredProcedure [dbo].[GenerateCode]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GenerateCode]
@MaHanhKhach nvarchar(10),
@MaChuyenBay nvarchar(10),
@MaCode nvarchar(10),
@tonggiave int
as 
begin 
	declare @randomString varchar(8)
	SELECT @randomString = CONVERT(varchar(255), NEWID())
	insert into KhachHang_ChuyenBay(MaKhachHang, MaChuyenBay, MaCode, TongTien) values (@MaHanhKhach, @MaChuyenBay, @randomString, @tonggiave)

end



GO
/****** Object:  StoredProcedure [dbo].[ThemHanhKhach]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThemHanhKhach]
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
		insert into HanhKhach(MaHanhKhach,GioiTinh, HoTen, NgaySinh, MaHanhLy) values(@randomString, @GioiTinh, @HoTen, @NgaySinh, @MaHanhLi)
end



GO
/****** Object:  StoredProcedure [dbo].[ThemKhachHang]    Script Date: 11/7/2019 10:13:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ThemKhachHang]
@HoTen nvarchar(100),
@KhuVuc nvarchar(50),
@DienThoai nchar(10),
@email nchar(100),
@Diachi nvarchar(100)
as
begin 
	declare @count int 
	declare @MaKhachHang nchar(10)
	declare @randomString nvarchar(10)
	SELECT @randomString = CONVERT(varchar(255), NEWID())
	select @count = count(*) from KhachHang as kh where kh.DienThoai = @DienThoai and kh.Email = @email 
	if (@count = 0)
		insert into KhachHang(MaKhachHang,HoTenKhachHang,KhuVuc,DienThoai,Email,Diachi) values(@randomString, @HoTen, @KhuVuc, @DienThoai, @email, @Diachi)
end



GO
USE [master]
GO
ALTER DATABASE [BanVeMayBay] SET  READ_WRITE 
GO
