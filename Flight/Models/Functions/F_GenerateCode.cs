using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Flight.Models.Functions
{
    public class F_GenerateCode
    {
        private AirLineDbContext context = null;
        private static Random random = new Random(Guid.NewGuid().GetHashCode());
        public string RandomString()
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            return new string(Enumerable.Repeat(chars, 8)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        public F_GenerateCode()
        {
            context = new AirLineDbContext();
        }
        public void Generatecode(string machuyenbay ,int tongtien, string macode, string maHanhKhach, string makhachhang,DateTime ngaydatve)
        {
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@MaHanhKhach", maHanhKhach),
                new SqlParameter("@MaKhachHang",makhachhang),
                new SqlParameter("@MaChuyenBay", machuyenbay),
                new SqlParameter("@tonggiave", tongtien),
                new SqlParameter("@MaCode", macode),
                new SqlParameter("@ngayDatve", ngaydatve)


                
            };
            context.Database.ExecuteSqlCommand("exec GenerateCode @MaHanhKhach,@MaKhachHang,@MaChuyenBay,@MaCode,@tonggiave,@ngayDatve", sqlparams);

        }
    }
}