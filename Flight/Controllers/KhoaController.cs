using Flight.Models.Entity;
using Flight.Models.Functions;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace Flight.Controllers
{
    public class KhoaController : Controller
    {
        // GET: Khoa
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult ThemHanhLiThanhCong(string MaHanhLy, string TenHanhLy, int LoaiHanhLy, int GiaTien)
        {
            var connect = new AirLineDbContext();
            connect.HanhLies.Add(new HanhLy
            {
                MaHanhLy = MaHanhLy,
                TenHanhLy = TenHanhLy,
                LoaiHanhLy = LoaiHanhLy,
                GiaTien = GiaTien,
            }) ;
            connect.SaveChanges();
            return View();
        }

        public ActionResult Suahanhli()
        {
            return View();
        }
        public ActionResult SuaHanhLiThanhCong(string mahanhli, string tenhanhli, int Loaihanhli, int giatien)
        {
            var connect = new AirLineDbContext();
            var info = connect.HanhLies.SingleOrDefault(x => x.MaHanhLy == mahanhli);
            info.TenHanhLy = tenhanhli;
            info.LoaiHanhLy = Loaihanhli;
            info.GiaTien = giatien;
            connect.SaveChanges();
            return View();
        }

        public ActionResult XoaHanhLi()
        {
            return View();
        }

        public ActionResult XoaHanhLiThanhCong(string mahanhli)
        {
            var connect = new AirLineDbContext();
            var info = connect.HanhLies.Find(mahanhli);
            connect.HanhLies.Remove(info);
            connect.SaveChanges();
            return View();
        }
        public ActionResult DsHanhLi()
        {
            var connect = new AirLineDbContext();
            List<HanhLy> DShanhli = connect.HanhLies.ToList();
            return View(DShanhli);
        }
        [HttpDelete]
        public ActionResult Delete(string  MaHanhLy)
        {
            new F_HanhLy().Delete(MaHanhLy);

            return RedirectToAction("DsHanhLi");
        }
        
    }
}