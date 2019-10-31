using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class SearchResultOneWay
    {
        public List<ChuyenBay> cb { set; get; }
        public string departAirport { set; get; }
        public string arrivedAirport { set; get; }
        public string date { set; get; }
        public string rtndate { set; get; }
        public int adultNo { set; get; }
        public int childNo { set; get; }
        public int infantNo { set; get; }

    }
}