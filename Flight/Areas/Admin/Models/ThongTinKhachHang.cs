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
        public string passenger_name { set; get; }
        public DateTime passenger_birthday { set; get; }
        public string passenger_pass { set; get; }
        public string passenger_datepassdate { set; get; }
        public string passenger_quoctich { set; get; }
    }
}