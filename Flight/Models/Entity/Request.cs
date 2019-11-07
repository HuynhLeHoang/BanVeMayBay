using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class Request
    {
            public string depAirport { set; get; }
            public string arvAirport { set; get; }
            public string depDate { set; get; }
            public string rtnDate { set; get; }
            public int adultNo { set; get; }
            public int childNo { set; get; }
            public int infantNo { set; get; }
            public int flightType { set; get; }
    }
}