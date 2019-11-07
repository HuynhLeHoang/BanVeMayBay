using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class KhachHangModel
    {
            public string fullname { set; get; }
            public string txtPax1_Ctry { set; get; }
            public string phone { set; get; }
            public string email { set; get; }
            public string address { set; get; }
            public int tongtien { set; get; }
    }
}