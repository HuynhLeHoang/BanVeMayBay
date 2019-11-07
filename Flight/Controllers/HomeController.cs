using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Flight.Common;
using Flight.Models.Entity;
using Flight.Models.Functions;

namespace Flight.Controllers
{
    public class HomeController : Controller
    {
        
        public ActionResult Index()
        {
            var session = (UserLogin)Session[CommonSession.AMDIN_SESSION];
            var session1 = (UserLogin)Session[CommonSession.USER_SESSION];
            if (session1 != null || session != null)
            {
                TempData["layout"] = "logged in";
                return View();
            }
            
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        
        [HttpPost]
        public ActionResult SearchResult(Request request)
        { 
            //Nếu là chuyến bay một chiều thì chọn chuyến bay sẽ về luôn nhập thông tin
            // Nếu không thì sẽ chuyeenrr sang một action trong controller cho phép chọn thêm một chuyến bay nữa 
            if(request.flightType == 0)
            {
                ViewBag.redirect = "Detail";
            }
            else
            {
                ViewBag.redirect = "SearchResultReturn";
            }
            SearchResultOneWay result = new SearchResultOneWay();
            DateTime dt = DateTime.ParseExact(request.depDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            result.cb = new  F_DanhSachChuyenBay().DS_ChuyenBay.Where(x=>x.DiemDi == request.depAirport && x.DiemDen == request.arvAirport && x.Ngay == dt).ToList();
            result.departAirport = request.depAirport;
            result.arrivedAirport = request.arvAirport;
            result.date = request.depDate;
            result.rtndate = request.rtnDate;
            result.adultNo = request.adultNo;
            result.childNo = request.childNo;
            result.infantNo = request.infantNo;
            return View(result);
        }
        //Bản nháp 
        public ActionResult Preview()
        {
            String DanhMuc = "VietJet";
            var model = new F_DanhSachChuyenBay().DS_ChuyenBay.Where(x=>x.Title == DanhMuc).ToList();
            return View(model);
        }
        [HttpPost  ]
        public ActionResult SearchResultReturn(string depAirport, string arvAirport, string ReturnDate, string MaChuyenBayLuotDi, int adultNo, int childNo, int infantNo)
        {

            SearchResultOneWay result = new SearchResultOneWay();
            DateTime dt = DateTime.ParseExact(ReturnDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            result.cb = new F_DanhSachChuyenBay().DS_ChuyenBay.Where(x => x.DiemDi == arvAirport && x.DiemDen == depAirport && x.Ngay == dt).ToList();
            result.departAirport = arvAirport;
            result.arrivedAirport = depAirport;
            result.date = null;
            result.rtndate = ReturnDate;
            result.adultNo = adultNo;
            result.childNo = childNo;
            result.infantNo = infantNo;
            ViewBag.MaChuyenBayLuotDi = MaChuyenBayLuotDi;
            return View(result);
        }
        public ActionResult Detail(string MaChuyenBayLuotDi, string MaChuyenBayLuotVe, int adultNo, int childNo, int infantNo)
        {
            ViewBag.tongtien = 0;
            // Hiển thị chi tiết của từng chuyến bay(tạo một list có 2 chuyến bay là lượt đi và  lượt về )
            List<FlightInfo> result = new List<FlightInfo>();
            ChuyenBay model = new F_DanhSachChuyenBay().FindEntity(MaChuyenBayLuotDi);
            FlightInfo Flightif = new FlightInfo();
            Flightif.LoaiCb = "Chuyến Bay Lượt đi";
            Flightif.cb = model;
            Flightif.adultNo = adultNo;
            Flightif.childNo = childNo;
            Flightif.infantNo = infantNo;
            ViewBag.adultNo = adultNo;
            ViewBag.childNo = childNo;
            ViewBag.infantNo = infantNo;
            Session[CommonSession.FLIGHTDEP_ID] = MaChuyenBayLuotDi;
            Flightif.tongGiaVeNguoiLon = adultNo * ( (int)(Flightif.cb.Gia) + (int)(Flightif.cb.Thue));
            Flightif.tongGiaVetreEm = childNo * ((int)(Flightif.cb.GiaTreEm) + (int)(Flightif.cb.ThueTreEm));
            Flightif.tongGiaveSoSinh = infantNo * (int)(Flightif.cb.GiaVeTreSoSinh);
            ViewBag.tongtien += Flightif.tongGiaVeNguoiLon + Flightif.tongGiaVetreEm + Flightif.tongGiaveSoSinh;
            result.Add(Flightif);
            if(MaChuyenBayLuotVe != "")
            {
                ChuyenBay tmp = new F_DanhSachChuyenBay().FindEntity(MaChuyenBayLuotVe);
                FlightInfo t = new FlightInfo();
                t.LoaiCb = "Chuyến Bay Lượt Về";
                t.cb = tmp;
                t.adultNo = adultNo;
                t.childNo = childNo;
                t.infantNo = infantNo;
                t.tongGiaVeNguoiLon = adultNo * ((int)(t.cb.Gia) + (int)(t.cb.Thue));
                t.tongGiaVetreEm = childNo * ((int)(t.cb.GiaTreEm) + (int)(t.cb.ThueTreEm));
                t.tongGiaveSoSinh = infantNo * (int)(t.cb.GiaVeTreSoSinh);
                ViewBag.tongtien += t.tongGiaVeNguoiLon + t.tongGiaVetreEm + t.tongGiaveSoSinh;
                Session[CommonSession.FLIGHTARV_ID] = MaChuyenBayLuotVe;
                result.Add(t);
            }
            return View(result);
        }
        [HttpPost]
        public ActionResult Review(KhachHangModel khmodel, IList<adult> adults, IList<child> childs, IList<infant> infants)
        {
            new F_ThemKhachHang().ThemKhachHang( khmodel.fullname, khmodel.txtPax1_Ctry, khmodel.phone, khmodel.email, khmodel.address);
            string makhachhang = new F_ThemKhachHang().Find(khmodel.fullname, khmodel.phone, khmodel.email);
            HanhKhachModel hkModel = new HanhKhachModel();
            hkModel.adultList = new List<adult>();
            hkModel.childList = new List<child>();
            hkModel.infantList = new List<infant>();
            ViewBag.tongtien = 0;
            ViewBag.makhachhang = makhachhang;
            foreach(adult item in adults)
            {
                if(item.adultName != null)
                {
                    HanhLy temp = new F_ThemHanhKhach().FindEntity(item.adultBaggage);
                    item.adultBaggageType = temp.TenHanhLy;
                    ViewBag.tongtien += temp.GiaTien;
                    // them hanh khach vao co so du lieu va gan cho mot ma 
                    new F_ThemHanhKhach().ThemHanhKhach(item);
                    // lay len tu co so du lieu ma hanh khach 
                    DateTime ngaysinh = DateTime.ParseExact(item.adultBirthday, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    HanhKhach temp1 = new AirLineDbContext().HanhKhaches.Where(x => x.GioiTinh == item.adultSex
                    && x.HoTen == item.adultName
                    && x.NgaySinh == ngaysinh
                    && x.MaHanhLy == item.adultBaggage
                    ).SingleOrDefault();
                    item.adultID = temp1.MaHanhKhach;                  
                    hkModel.adultList.Add(item);                  
                }            
            }
            foreach(child item in childs)
            {
               if(item.childName != null)
                {
                    HanhLy temp = new F_ThemHanhKhach().FindEntity(item.childBaggage);
                    item.childBaggageType = temp.TenHanhLy;
                    ViewBag.tongtien += temp.GiaTien;
                    new F_ThemHanhKhach().ThemHanhKhach(item);
                    DateTime ngaysinh = DateTime.ParseExact(item.childBirthday, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    HanhKhach temp1 = new AirLineDbContext().HanhKhaches.Where(x => x.GioiTinh == item.childSex
                    && x.HoTen == item.childName
                    && x.NgaySinh == ngaysinh
                    && x.MaHanhLy == item.childBaggage
                    ).SingleOrDefault();
                    item.childID = temp1.MaHanhKhach;
                    hkModel.childList.Add(item);
                }
            }
            foreach(infant item in infants)
            {
                if(item.infantName != null)
                {
                    new F_ThemHanhKhach().ThemHanhKhach(item);
                    DateTime ngaysinh = DateTime.ParseExact(item.infantBirthday, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    HanhKhach temp1 = new AirLineDbContext().HanhKhaches.Where(x => x.GioiTinh == item.infantSex
                    && x.HoTen == item.infantName
                    && x.NgaySinh == ngaysinh
                    && x.MaHanhLy == "1"
                    ).SingleOrDefault();
                    item.infantID = temp1.MaHanhKhach;
                    hkModel.infantList.Add(item);
                }
            }
            KhachHang model = new KhachHang();
            model.HoTenKhachHang = khmodel.fullname;
            model.KhuVuc = khmodel.txtPax1_Ctry;
            model.DienThoai = khmodel.phone;
            model.Email = khmodel.email;
            model.Diachi = khmodel.address;
            ViewBag.khachhang = model;
            ViewBag.tongtien += khmodel.tongtien;
            return View(hkModel);
        }
        public ActionResult Thankyou(string makhachhang,int amount, List<string> hkID)
        {
            string machuyenbayluotdi = Session[CommonSession.FLIGHTDEP_ID] as string;         
            string maCode = new F_GenerateCode().RandomString();
            foreach (string item in hkID)
            {
                new F_GenerateCode().Generatecode(machuyenbayluotdi, amount, maCode, item, makhachhang);
            }
            if(Session[CommonSession.FLIGHTARV_ID] != null)
            {
                string machuyenbayluotve = Session[CommonSession.FLIGHTARV_ID] as string;
                foreach (string item in hkID)
                {
                    new F_GenerateCode().Generatecode(machuyenbayluotve, amount, maCode, item, makhachhang);
                }
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonSession.USER_SESSION] = null;
            return RedirectToAction("Index");
        }
    }
}