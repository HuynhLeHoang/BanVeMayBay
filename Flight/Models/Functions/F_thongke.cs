using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Flight.Models.Functions
{
    public class F_thongke
    {
        private AirLineDbContext connect = null;
        public F_thongke()
        {
            connect = new AirLineDbContext();
        }
        public int thongke(DateTime ngay1, DateTime ngay2)
        {
            int soluong;
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@ngay1", ngay1),
                new SqlParameter("@ngay2", ngay2),

            };
            soluong = (int)connect.Database.SqlQuery<int>("ThongKe @ngay1, @ngay2", sqlparams).SingleOrDefault();
            return soluong;
        }
    }
}