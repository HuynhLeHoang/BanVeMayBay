using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Areas.Admin.Models
{
    public class ModifyTicket
    {
        public string MaKhachHang { set; get; }
        public string FullName { set; get; }
        public string SDT { set; get; }
        public string Email { set; get; }
        public string DiaChi { set; get; }
        public List<Khach> HanhKhach { set; get; }
    }
}