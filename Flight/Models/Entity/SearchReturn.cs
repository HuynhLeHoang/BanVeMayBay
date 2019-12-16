using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class SearchReturn
    {
        public string depAirport { set; get; }
        public string arvAirport { set; get; } 
        public string ReturnDate { set; get; }
        public string MaChuyenBayLuotDi { set; get; }
        public int adultNo { set; get; }
        public int childNo { set; get; }
        public int infantNo { set; get; }
    }
}