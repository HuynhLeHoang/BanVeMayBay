using Flight.Areas.Admin.Models;
using Flight.Common;
using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Flight.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddFlight()
        {
            return View();
        }
        public ActionResult ModifyFlight()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ModifyFlight(ThongTinChuyenBay ThongTin)
        {
            var id = ThongTin.flightID;
            var date = ThongTin.date.Date.ToString("yyyy/MM/dd");
            var connect = new AirLineDbContext();
            var info = connect.ChuyenBays.SingleOrDefault(x => x.MaChuyenBay == id);
            info.Title = "VietJet";
            info.UrlAnh = "vietJet.png";
            info.DiemDi = ThongTin.depAirport;
            info.DiemDen = ThongTin.arvAirport;
            info.Ngay = ThongTin.date.Date;
            info.ChuyenBay1 = ThongTin.chuyenBay;
            info.KhoiHanh = ThongTin.gioDi;
            info.Den = ThongTin.gioDen;
            info.Gia = int.Parse(ThongTin.gia);
            info.PlaneID = ThongTin.planeID;
            info.PilotID1 = ThongTin.pilotID1;
            info.PilotID2 = ThongTin.pilotID2;
            connect.SaveChanges();
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ModifyTicket()
        {
            return View();        
        }

        public ActionResult SuaVe(ThongTinKhachHang ThongTin)
        {
            string ticketcode = ThongTin.ticketcode;
            var connection = new AirLineDbContext();
            string passengercode = connection.KhachHang_ChuyenBay.Find(ticketcode).MaKhachHang;
            var ticket = connection.KhachHangs.Find(passengercode);
            if (ticket == null)
            {
                return HttpNotFound();
            }
            else
            {
                var khachhang = new KhachHang
                {
                    HoTenKhachHang = ThongTin.fullname,
                    KhuVuc = ThongTin.country,
                    DienThoai = ThongTin.phone,
                    Email = ThongTin.email,
                    Diachi = ThongTin.address
                };
                connection.Entry(khachhang).State = EntityState.Modified;
                connection.SaveChanges();
                return View("ModifyTicket");
            }
        }
        public ActionResult DeleteTicket()
        {
            return View();
        }

        public ActionResult Delete(Ve ve)
        {
            var connection = new AirLineDbContext();
            try
            {
                var ticket = connection.KhachHang_ChuyenBay.SingleOrDefault(x => x.MaCode == ve.MaVe);
                connection.KhachHang_ChuyenBay.Remove(ticket);
                connection.SaveChanges();
            }
            catch(ArgumentNullException e)
            {
                TempData["notice"] = "Ticket not found";
                return View("DeleteTicket");
            }
            TempData["notice"] = "Ticket has been delete";
            return View("DeleteTicket");
        }

        public ActionResult Logout()
        {
            Session[CommonSession.USER_SESSION] = null;
            return RedirectToAction("Index", "../Home");
        }
    }
}