using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Flight.Models.Entity;

namespace Flight.Areas.Admin.Models
{
    public class ThongTinDatVe
    {
        private string MaVe;
        private string HoTen;
        private string KhuVuc;
        private string SDT;
        private string Email;
        private string DiaChi;
        private IList<adult> adults;
        private IList<child> childs;
        private IList<infant> infants;
    }
}