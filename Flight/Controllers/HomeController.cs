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
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
     
        public ActionResult SearchResult(string depAirport, string arvAirport, string depDate, int adultNo, int childNo, int infantNo)
        { 
            SearchResultOneWay result = new SearchResultOneWay();
            DateTime dt = DateTime.ParseExact(depDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            result.cb = new  F_DanhSachChuyenBay().DS_ChuyenBay.Where(x=>x.DiemDi == depAirport && x.DiemDen == arvAirport && x.Ngay == dt).ToList();
            result.departAirport = depAirport;
            result.arrivedAirport = arvAirport;
            result.date = depDate;
            result.adultNo = adultNo;
            result.childNo = childNo;
            result.infantNo = infantNo;
            return View(result);
        }

        public ActionResult Preview()
        {
            String DanhMuc = "VietJet";
            var model = new F_DanhSachChuyenBay().DS_ChuyenBay.Where(x=>x.Title == DanhMuc).ToList();
            return View(model);
        }
       
        public ActionResult Detail(string MaChuyenBay, int adultNo, int childNo, int infantNo)
        {
            ChuyenBay model = new F_DanhSachChuyenBay().FindEntity(MaChuyenBay);
            FlightInfo Flightif = new FlightInfo();
            Flightif.cb = model;
            Flightif.adultNo = adultNo;
            Flightif.childNo = childNo;
            Flightif.infantNo = infantNo;
            Flightif.tongGiaVeNguoiLon = adultNo * ( (int)(Flightif.cb.Gia) + (int)(Flightif.cb.Thue));
            Flightif.tongGiaVetreEm = childNo * ((int)(Flightif.cb.GiaTreEm) + (int)(Flightif.cb.ThueTreEm));
            Flightif.tongGiaveSoSinh = infantNo * (int)(Flightif.cb.GiaVeTreSoSinh);
            Session[CommonSession.FLIGHT_SESION]= Flightif;
            return View(Flightif);
        }
        [HttpPost]
        public ActionResult Review(string fullname, string txtPax1_Ctry, string phone, string email, string address, int tongtien, IList<adult> adults, IList<child> childs, IList<infant> infants)
        {
            new F_ThemKhachHang().ThemKhachHang( fullname, txtPax1_Ctry, phone, email, address);
            HanhKhachModel hkModel = new HanhKhachModel();
            hkModel.adultList = new List<adult>();
            hkModel.childList = new List<child>();
            hkModel.infantList = new List<infant>();
            ViewBag.tongtien = 0;
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
            model.HoTenKhachHang = fullname;
            model.KhuVuc = txtPax1_Ctry;
            model.DienThoai = phone;
            model.Email = email;
            model.Diachi = address;
            ViewBag.khachhang = model;
            ViewBag.tongtien += tongtien;
            return View(hkModel);
        }
        public ActionResult Thankyou(int amount, List<string> hkID)
        {
            FlightInfo flightInfo = new FlightInfo();
            flightInfo = Session[CommonSession.FLIGHT_SESION] as FlightInfo;
            string maCode = new F_GenerateCode().RandomString();
            foreach (string item in hkID)
            {
                new F_GenerateCode().Generatecode(flightInfo.cb.MaChuyenBay, amount, maCode, item);
            }
            return View();
        }
        

    }
}