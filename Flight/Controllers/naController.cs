using Flight.Models.Entity;
using Flight.Models.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Flight.Controllers
{
    public class naController : Controller
    {
        // GET: na
        public ActionResult Index()
        {
            List<ChuyenBay> f = new List<ChuyenBay>();
            f = new F_DanhSachChuyenBay().DS_ChuyenBay.ToList();
            return View(f);
        }
        public ActionResult detail(string machuyenbay)
        {
            ChuyenBay df = new ChuyenBay();
            df = new F_DanhSachChuyenBay().FindEntity(machuyenbay);
            return View(df);
        }

    }
}