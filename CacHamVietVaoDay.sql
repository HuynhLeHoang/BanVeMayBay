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
	select @count = count(*) from KhachHang as kh where kh.DienThoai = @DienThoai and kh.Email = @email 
	if (@count = 0)
		insert into KhachHang(MaKhachHang,HoTenKhachHang,KhuVuc,DienThoai,Email,Diachi) values('KH'+CONVERT(NVARCHAR(4),cast(rand()*10000 as int)), @HoTen, @KhuVuc, @DienThoai, @email, @Diachi)
end
go 










