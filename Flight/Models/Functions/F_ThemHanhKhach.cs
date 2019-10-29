using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace Flight.Models.Functions
{
    public class F_ThemHanhKhach
    {
        private AirLineDbContext context = null;
        public F_ThemHanhKhach()
        {
            context = new AirLineDbContext();
        }
        public HanhLy FindEntity(string maHL)
        {
            HanhLy dbEntry = context.HanhLies.Find(maHL);
            return dbEntry;
        }
        public void ThemHanhKhach(adult HanhKhach)
        {
            DateTime temp = DateTime.ParseExact(HanhKhach.adultBirthday, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@GioiTinh", HanhKhach.adultSex),
                new SqlParameter("@HoTen", HanhKhach.adultName),
                new SqlParameter("@NgaySinh", temp),
                new SqlParameter("@MaHanhLi", HanhKhach.adultBaggage),
            };
            context.Database.ExecuteSqlCommand("exec ThemHanhKhach @GioiTinh,@HoTen,@NgaySinh,@MaHanhLi", sqlparams);
        }
        public void ThemHanhKhach(child HanhKhach)
        {
            DateTime temp = DateTime.ParseExact(HanhKhach.childBirthday,"dd/MM/yyyy", CultureInfo.InvariantCulture);
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@GioiTinh", HanhKhach.childSex),
                new SqlParameter("@HoTen", HanhKhach.childName),
                new SqlParameter("@NgaySinh", temp),
                new SqlParameter("@MaHanhLi", HanhKhach.childBaggage),
            };
            context.Database.ExecuteSqlCommand("exec ThemHanhKhach @GioiTinh,@HoTen,@NgaySinh,@MaHanhLi", sqlparams);
        }
        public void ThemHanhKhach(infant HanhKhach)
        {
            DateTime temp = DateTime.ParseExact(HanhKhach.infantBirthday, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@GioiTinh", HanhKhach.infantSex),
                new SqlParameter("@HoTen", HanhKhach.infantName),
                new SqlParameter("@NgaySinh", temp),
                new SqlParameter("@MaHanhLi", "1"),
            };
            context.Database.ExecuteSqlCommand("exec ThemHanhKhach @GioiTinh,@HoTen,@NgaySinh,@MaHanhLi", sqlparams);
        }
    }
}