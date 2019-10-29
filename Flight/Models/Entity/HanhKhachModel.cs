using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class HanhKhachModel
    {
        public List<adult> adultList { get; set; }
        public List<child> childList { get; set; }
        public List<infant> infantList { get; set; }

    }
}