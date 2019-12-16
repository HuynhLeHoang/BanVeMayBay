using Flight.Models.Entity;
using Flight.Models.Functions;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Flight.Controllers
{
    public class Khoa_thu6Controller : Controller
    {
        // GET: Khoa_thu6
        public ActionResult Index()
        {
            return View();
        }
        

        public ActionResult AddBaggage(string mahanhly, string tenhanhly, int loaihanhly, int giatien)
        {
            var connect = new AirLineDbContext();
            connect.HanhLies.Add(new HanhLy
            {
                MaHanhLy = mahanhly,
                TenHanhLy = tenhanhly,
                LoaiHanhLy = loaihanhly,
                GiaTien = giatien,
            });
            connect.SaveChanges();
            return View();       
        }
        public ActionResult StartModify()
        {
            return View();
        }
        public ActionResult ModifyBaggage( string mahanhly, string tenhanhly, int loaihanhly, int  giatien)
        {
            var connect = new AirLineDbContext();
           HanhLy info =  connect.HanhLies.Find(mahanhly);
            info.TenHanhLy = tenhanhly;
            info.LoaiHanhLy = loaihanhly;
            info.GiaTien = giatien;
            connect.SaveChanges();
            return View();
        }
        public ActionResult StartDelete()
        {
            return View();
        }
        public ActionResult DeleteBaggage(string mahanhly)
        {
            var connect = new AirLineDbContext();
            HanhLy info = connect.HanhLies.Find(mahanhly);
            connect.HanhLies.Remove(info);
            connect.SaveChanges();
            return View();
        }
        public ActionResult StartThongKe()
        {
            return View();
        }

        public ActionResult ThongKe_KiemTra(string ngay1, string ngay2)
        {
            // thong ke giua 1 khoang thoi gian co bao nhieu nguoi dat ve 
            DateTime dt1 = DateTime.ParseExact(ngay1, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime dt2 = DateTime.ParseExact(ngay2, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            int thongke = new F_thongke().thongke(dt1, dt2);
            ViewBag.ngay1 = dt1;
            ViewBag.ngay2 = dt2;
            ViewBag.thongke = thongke;
            return View();
        }
    }
}