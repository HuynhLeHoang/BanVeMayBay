using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class TravelerDetail
    {
        public string MaChuyenBayLuotDi { set; get; }
        public string MaChuyenBayLuotVe { set; get; } 
        public int adultNo { set; get; }
        public int childNo { set; get; }
        public int infantNo { set; get; }
    }
}