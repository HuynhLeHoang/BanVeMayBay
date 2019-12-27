using Flight.Areas.Admin.Models;
using Flight.Common;
using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
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
            var session1 = (UserLogin)Session[CommonSession.USER_SESSION];
            if (session1 != null)
            {
                TempData["layout"] = "logged in";
                return View();
            }
            return View();
        }
        [HasCredential(RoleID = "ADD_FLIGHT")]
        public ActionResult AddFlight()
        {
            return View();
        }

        [HttpPost]
        [HasCredential(RoleID = "ADD_FLIGHT")]
        public ActionResult AddFlight(ThongTinChuyenBay ThongTin)
        {
            try
            {
                var connect = new AirLineDbContext();

                connect.ChuyenBays.Add(new ChuyenBay {
                    Title = "VietJet",
                    UrlAnh = "vietJet.png",
                    MaChuyenBay = ThongTin.flightID,
                    DiemDi = ThongTin.depAirport,
                    DiemDen = ThongTin.arvAirport,
                    Ngay = ThongTin.date.Date,
                    ChuyenBay1 = ThongTin.chuyenBay,
                    KhoiHanh = ThongTin.gioDi,
                    Den = ThongTin.gioDen,
                    Gia = int.Parse(ThongTin.gia),
                    Thue = int.Parse(ThongTin.thue),
                    GiaTreEm = int.Parse(ThongTin.giatreem),
                    ThueTreEm = int.Parse(ThongTin.thuetreem),
                    GiaVeTreSoSinh = int.Parse(ThongTin.giavetresosinh),
                    SoCho = int.Parse(ThongTin.sochocontrong),
                    PlaneID = ThongTin.planeID,
                    PilotID1 = ThongTin.pilotID1,
                    PilotID2 = ThongTin.pilotID2,
                });
                connect.SaveChanges();
                
                return View("Success", TempData["notice"] = "Thêm chuyến bay thành công!");
            }
            catch 
            {
                
                return View("Success", TempData["notice"] = "Đã có lỗi xảy ra!");
            }
        }

        public ActionResult Success()
        {
            return View();
        }
        [HasCredential(RoleID = "EDIT_FLIGHT")]
        public ActionResult ModifyFlight()
        {
            return View();
        }
        [HttpPost]
        [HasCredential(RoleID = "EDIT_FLIGHT")]
        public ActionResult ModifyFlight(ThongTinChuyenBay ThongTin)
        {
            try
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
                info.Thue = int.Parse(ThongTin.thue);
                info.GiaTreEm = int.Parse(ThongTin.giatreem);
                info.ThueTreEm = int.Parse(ThongTin.thuetreem);
                info.GiaVeTreSoSinh = int.Parse(ThongTin.giavetresosinh);
                info.SoCho = int.Parse(ThongTin.sochocontrong);
                info.PlaneID = ThongTin.planeID;
                info.PilotID1 = ThongTin.pilotID1;
                info.PilotID2 = ThongTin.pilotID2;
                connect.SaveChanges();
            }
            catch
            {

            }
            return RedirectToAction("Index", "Home");
        }
     
        [HasCredential(RoleID = "EDIT_TICKET")]
        public ActionResult ModifyTicket()
        {
            return View();        
        }

        [HttpPost]
        [HasCredential(RoleID = "EDIT_TICKET")]
        public ActionResult SuaVe(ThongTinKhachHang ThongTin)
        {
            
            try
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

                    ticket.HoTenKhachHang = ThongTin.fullname;
                    ticket.KhuVuc = ThongTin.country;
                    ticket.DienThoai = ThongTin.phone;
                    ticket.Email = ThongTin.email;
                    ticket.Diachi = ThongTin.address;

                    connection.SaveChanges();
                    return View("Success", TempData["notice"] = "Sửa vé thành công!");
                }
            }
            catch
            {
                return View("Success", TempData["notice"] = "Đã có lỗi xảy ra!");
            }
        }
        [HasCredential(RoleID = "DELETE_TICKET")]
        public ActionResult DeleteTicket()
        {
            return View();
        }
        [HttpPost]
        [HasCredential(RoleID = "DELETE_TICKET")]
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

        public ActionResult GetCustomerInfo(string TicketCode)
        {
            var db = new AirLineDbContext();
            try
            {
                KhachHang_ChuyenBay ticket = db.KhachHang_ChuyenBay.AsNoTracking().Where(x => x.MaCode == TicketCode).ToList()[0];
                if (ticket == null)
                {
                    return HttpNotFound();
                }
                var hanhkhach = db.KhachHangs.Find(ticket.MaKhachHang.ToString());
              
                return PartialView("KhachHang", hanhkhach);
            }
            catch
            {
                return HttpNotFound();
            }
        }

        public ActionResult GetGuestInfo(string TicketCode)
        {
            
            var db = new AirLineDbContext();
            List<KhachHang_ChuyenBay> ticket = new List<KhachHang_ChuyenBay>();
            try
            {
                ticket = db.KhachHang_ChuyenBay.AsNoTracking().Where(x => x.MaCode == TicketCode).ToList();
                if(ticket.Count == 0)
                {
                    return HttpNotFound();
                }
                List<Flight.Models.Entity.HanhKhach> hanhkhach = new List<Flight.Models.Entity.HanhKhach>();
                foreach (KhachHang_ChuyenBay khcb in ticket)
                {
                    hanhkhach.Add(db.HanhKhaches.Find(khcb.MaHanhKhach.ToString()));
                }
                return PartialView("HanhKhach", hanhkhach);
            }
            catch
            {
                return HttpNotFound();
            }
            
        }
        [HttpPost]
        public ActionResult ModifyTicketNew(ModifyTicket ticket)
        {
            var db = new AirLineDbContext();
            var KH = db.KhachHangs.Find(ticket.MaKhachHang);
            KH.HoTenKhachHang = ticket.FullName;
            KH.DienThoai = ticket.SDT;
            KH.Email = ticket.Email;
            KH.Diachi = ticket.DiaChi;
            db.SaveChanges();
            for(var i = 0; i < ticket.HanhKhach.Count; i++)
            {
                var HK = db.HanhKhaches.Find(ticket.HanhKhach[i].MaHanhKhach);
                DateTime outTemp;
                outTemp = DateTime.Parse(ticket.HanhKhach[i].NgaySinh + " 12:00:00 AM");
                HK.NgaySinh = outTemp.Date;
                HK.GioiTinh = ticket.HanhKhach[i].GioiTinh;
                HK.HoTen = ticket.HanhKhach[i].HoTen;
                db.SaveChanges();
            }
            return Json(new
            {
                msg = "M"
            });
        }
    }
}