using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Flight.Models.Entity;


namespace Flight.Models.Functions
{
    public class F_DanhSachChuyenBay
    {
        private AirLineDbContext context;
        public F_DanhSachChuyenBay()
        {
            context = new AirLineDbContext();
        }
        public IQueryable<ChuyenBay> DS_ChuyenBay
        {
            get { return context.ChuyenBays; }
        }
        // Tra ve mot doi tuong khi biet khoa 
        public ChuyenBay FindEntity(string maCB)
        {  
            ChuyenBay dbEntry = context.ChuyenBays.Find(maCB);
            return dbEntry;
        }
       



    }
}