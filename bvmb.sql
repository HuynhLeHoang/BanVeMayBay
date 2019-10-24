USE [master]
GO
/****** Object:  Database [BanVeMayBay]    Script Date: 10/24/2019 10:59:12 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 10/24/2019 10:59:12 PM ******/
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
 CONSTRAINT [PK__About__2BE0A0F0F819E239] PRIMARY KEY CLUSTERED 
(
	[MaThanhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChuyenBay]    Script Date: 10/24/2019 10:59:12 PM ******/
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
/****** Object:  Table [dbo].[HanhKhach]    Script Date: 10/24/2019 10:59:12 PM ******/
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
/****** Object:  Table [dbo].[HanhLy]    Script Date: 10/24/2019 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HanhLy](
	[MaHanhLy] [varchar](3) NOT NULL,
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/24/2019 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [nvarchar](10) NOT NULL,
	[HoTenKhachHang] [nvarchar](100) NULL,
	[KhuVuc] [nvarchar](50) NULL,
	[DienThoai] [varchar](10) NULL,
	[Email] [varchar](100) NULL,
	[Diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang_ChuyenBay]    Script Date: 10/24/2019 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang_ChuyenBay](
	[MaKhachHang] [nvarchar](10) NULL,
	[MaChuyenBay] [nvarchar](10) NULL,
	[MaCode] [nvarchar](10) NOT NULL,
	[Chitiet] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MayBay]    Script Date: 10/24/2019 10:59:12 PM ******/
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
/****** Object:  Table [dbo].[PhiCong]    Script Date: 10/24/2019 10:59:12 PM ******/
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
ALTER TABLE [dbo].[KhachHang_ChuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ChuyenBay_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[KhachHang_ChuyenBay] CHECK CONSTRAINT [FK_KhachHang_ChuyenBay_KhachHang]
GO
/****** Object:  StoredProcedure [dbo].[Account_Login]    Script Date: 10/24/2019 10:59:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ThemKhachHang]    Script Date: 10/24/2019 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemKhachHang]
@HoTen nvarchar(100),
@KhuVuc nvarchar(50),
@DienThoai varchar(10),
@email varchar(100),
@Diachi nvarchar(100)
as
begin 
	declare @count int 
	declare @MaKhachHang varchar(10)
	select @count = count(*) from KhachHang as kh where kh.DienThoai = @DienThoai or kh.Email = @email 
	if (@count = 0)
		insert into KhachHang(MaKhachHang,HoTenKhachHang,KhuVuc,DienThoai,Email,Diachi) values('KH'+CONVERT(NVARCHAR(4),cast(rand()*10000 as int)), @HoTen, @KhuVuc, @DienThoai, @email, @Diachi)
	select @count
end



GO
USE [master]
GO
ALTER DATABASE [BanVeMayBay] SET  READ_WRITE 
GO
