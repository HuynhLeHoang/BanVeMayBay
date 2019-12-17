using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Entity
{
    public class Member
    {
        public string FullName { set; get; }
        public string UserName { set; get; }
        public string Password { set; get; }
        public string RePassword { set; get; }
    }
}