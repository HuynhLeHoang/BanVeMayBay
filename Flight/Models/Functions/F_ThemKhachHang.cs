using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Flight.Models.Functions
{
    public class F_ThemKhachHang
    {
        private AirLineDbContext context = null;
        public F_ThemKhachHang()
        {
            context = new AirLineDbContext();
        }
       public void ThemKhachHang(string fullname, string txtPax1_Ctry, string phone, string email, string address)
        {
     
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@HoTen", fullname),
                new SqlParameter("@KhuVuc", txtPax1_Ctry),
                new SqlParameter("@DienThoai", phone),
                new SqlParameter("@email", email),
                new SqlParameter("@Diachi", address)
            };
            context.Database.ExecuteSqlCommand("exec ThemKhachHang @HoTen,@KhuVuc,@DienThoai,@email,@Diachi", sqlparams);
        }
        public string Find(string fullname, string phone, string email)
        {
            KhachHang temp = context.KhachHangs.Where(x => x.HoTenKhachHang == fullname && x.DienThoai == phone && x.Email == email).SingleOrDefault();
            string result = temp.MaKhachHang;
            return result;
        }

    }
}