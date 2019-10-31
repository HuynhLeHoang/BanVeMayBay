using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class FlightInfo
    {
        public string LoaiCb { set; get; }
        public ChuyenBay cb { set; get; }
        public int adultNo { set; get; }
        public int tongGiaVeNguoiLon { set; get; }

        public int childNo { set; get; }
        public int tongGiaVetreEm { set; get; }

        public int infantNo { set; get; }
        public int tongGiaveSoSinh { set; get; }
    }
}