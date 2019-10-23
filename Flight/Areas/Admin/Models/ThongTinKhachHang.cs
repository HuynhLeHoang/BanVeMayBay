using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Areas.Admin.Models
{
    public class ThongTinKhachHang
    {
        public string ticketcode { set; get; }
        public string fullname { set; get; }
        public string country { set; get; }
        public string phone { set; get; }
        public string email { set; get; }
        public string address { set; get; }
        public string passenger_sex { set; get; }


    }
}