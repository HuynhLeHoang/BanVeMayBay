use BanVeMayBay 
go 

create proc ThemKhachHang
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
go 

create proc ThemHanhKhach
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
go

create proc GenerateCode
@MaHanhKhach nvarchar(10),
@MaKhachHang nvarchar(10),
@MaChuyenBay nvarchar(10),
@MaCode nvarchar(10),
@tonggiave int

as 
begin 
	insert into KhachHang_ChuyenBay(MaHanhKhach,MaKhachHang, MaChuyenBay, MaCode, TongTien) values (@MaHanhKhach,@MaKhachHang, @MaChuyenBay, @MaCode, @tonggiave)

end
go 











