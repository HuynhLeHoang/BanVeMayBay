using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Areas.Admin.Models
{
    public class ThongTinChuyenBay
    {
        public string flightID { set; get; }
        public string depAirport { set; get; }
        public string arvAirport { set; get; }
        public DateTime date { set; get; }
        public string chuyenBay { set; get; }
        public string gioDi { set; get; }
        public string gioDen { set; get; }
        public string gia { set; get; }
        public string planeID { set; get; }
        public string pilotID1 { set; get; }
        public string pilotID2 { set; get; }
        
    }
}