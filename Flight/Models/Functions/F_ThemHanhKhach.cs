using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        public void ThemHanhKhach(HanhKhachModel HanhKhach)
        {

            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@GioiTinh", HanhKhach.gioitinh),
                new SqlParameter("@HoTen", HanhKhach.hoten),
                new SqlParameter("@NgaySinh", HanhKhach.ngaysinh),
                new SqlParameter("@MaHanhLi", HanhKhach.hanhly),
            };
            context.Database.ExecuteSqlCommand("exec ThemHanhKhach @GioiTinh,@HoTen,@NgaySinh,@MaHanhLi", sqlparams);
        }
    }
}