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
using System.Security.Cryptography;
using System.Text;

namespace Flight.Controllers
{
    public class HomeController : Controller
    {
        
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

        public ActionResult About()
        {
            try
            {
                ViewBag.Message = "Your application description page.";

                return View();
            }
            catch
            {
                return View("Index");
            }
        }
        
        public ActionResult SearchResult()
        {
            try
            {
                return View();
            }
            catch
            {
                return View("Index");
            }
        }
        [HttpPost]
        public ActionResult SearchResult(Request request)
        {
            try
            {
                //Nếu là chuyến bay một chiều thì chọn chuyến bay sẽ về luôn nhập thông tin
                // Nếu không thì sẽ chuyeenrr sang một action trong controller cho phép chọn thêm một chuyến bay nữa 
                if (request.flightType == 0)
                {
                    ViewBag.redirect = "Detail";
                }
                else
                {
                    ViewBag.redirect = "SearchResultReturn";
                }
                SearchResultOneWay result = new SearchResultOneWay();
                //người lớn và trẻ em thì cho ngồi ghế còn trẻ sơ  sinh thì người lớn bế 
                int soluonghanhkhach = request.adultNo + request.childNo;
                List<ChuyenBay> temp = new List<ChuyenBay>();
                DateTime dt = DateTime.ParseExact(request.depDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                result.cb = new List<ChuyenBay>();
                temp = new F_DanhSachChuyenBay().DS_ChuyenBay.Where(x => x.DiemDi == request.depAirport && x.DiemDen == request.arvAirport && x.Ngay == dt).ToList();
                //kiểm tra thử còn chỗ không với các chuyến bay phù hợp với ngày đã chọn
                foreach (ChuyenBay item in temp)
                {
                    int a = new AirLineDbContext().KhachHang_ChuyenBay.Where(x => x.MaChuyenBay == item.MaChuyenBay && x.NgayBay == item.Ngay).ToList().Count();
                    if (item.SoCho - a >= soluonghanhkhach)
                    {
                        result.cb.Add(item);
                    }
                }

                result.departAirport = request.depAirport;
                result.arrivedAirport = request.arvAirport;
                result.date = request.depDate;
                result.rtndate = request.rtnDate;
                result.adultNo = request.adultNo;
                result.childNo = request.childNo;
                result.infantNo = request.infantNo;
                return View(result);

            }
            catch
            {
                return View("Index");
            }
            
        }
        //Bản nháp 
 
        [HttpPost  ]
        public ActionResult SearchResultReturn(SearchReturn SearchReturn)
        {

            SearchResultOneWay result = new SearchResultOneWay();
            result.cb = new List<ChuyenBay>();
            DateTime dt = DateTime.ParseExact(SearchReturn.ReturnDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //người lớn và trẻ em thì cho ngồi ghế còn trẻ sơ  sinh thì người lớn bế 
            int soluonghanhkhach = SearchReturn.adultNo + SearchReturn.childNo;
            List<ChuyenBay> temp = new List<ChuyenBay>();
            result.cb = new F_DanhSachChuyenBay().DS_ChuyenBay.Where(x => x.DiemDi == SearchReturn.arvAirport && x.DiemDen == SearchReturn.depAirport && x.Ngay == dt).ToList();
            //kiểm tra thử còn chỗ không trên các chuyến bay với ngày đã chọn 
            foreach (ChuyenBay item in temp)
            {
                int a = new AirLineDbContext().KhachHang_ChuyenBay.Where(x => x.MaChuyenBay == item.MaChuyenBay && x.NgayBay == item.Ngay).ToList().Count();
                if (item.SoCho - a >= soluonghanhkhach)
                {
                    result.cb.Add(item);
                }
            }
            result.departAirport = SearchReturn.arvAirport;
            result.arrivedAirport = SearchReturn.depAirport;
            result.date = null;
            result.rtndate = SearchReturn.ReturnDate;
            result.adultNo = SearchReturn.adultNo;
            result.childNo = SearchReturn.childNo;
            result.infantNo = SearchReturn.infantNo;
            ViewBag.MaChuyenBayLuotDi = SearchReturn.MaChuyenBayLuotDi;
            return View(result);
        }
        public ActionResult Detail(TravelerDetail DeTail)
        {
            ViewBag.tongtien = 0;
            // Hiển thị chi tiết của từng chuyến bay(tạo một list có 2 chuyến bay là lượt đi và  lượt về )
            List<FlightInfo> result = new List<FlightInfo>();
            ChuyenBay model = new F_DanhSachChuyenBay().FindEntity(DeTail.MaChuyenBayLuotDi);
            FlightInfo Flightif = new FlightInfo();
            Flightif.LoaiCb = "Chuyến Bay Lượt đi";
            Flightif.cb = model;
            Flightif.adultNo = DeTail.adultNo;
            Flightif.childNo = DeTail.childNo;
            Flightif.infantNo = DeTail.infantNo;
            ViewBag.adultNo = DeTail.adultNo;
            ViewBag.childNo = DeTail.childNo;
            ViewBag.infantNo = DeTail.infantNo;
            //Lưu mã chuyến bay lượt đi vào sesion 
            Session[CommonSession.FLIGHTDEP_ID] = DeTail.MaChuyenBayLuotDi;
            Flightif.tongGiaVeNguoiLon = DeTail.adultNo * ((int)(Flightif.cb.Gia) + (int)(Flightif.cb.Thue));
            Flightif.tongGiaVetreEm = DeTail.childNo * ((int)(Flightif.cb.GiaTreEm) + (int)(Flightif.cb.ThueTreEm));
            Flightif.tongGiaveSoSinh = DeTail.infantNo * (int)(Flightif.cb.GiaVeTreSoSinh);
            ViewBag.tongtien += Flightif.tongGiaVeNguoiLon + Flightif.tongGiaVetreEm + Flightif.tongGiaveSoSinh;
            result.Add(Flightif);
            if (DeTail.MaChuyenBayLuotVe != null)
            {
                ChuyenBay tmp = new F_DanhSachChuyenBay().FindEntity(DeTail.MaChuyenBayLuotVe);
                FlightInfo t = new FlightInfo();
                t.LoaiCb = "Chuyến Bay Lượt Về";
                t.cb = tmp;
                t.adultNo = DeTail.adultNo;
                t.childNo = DeTail.childNo;
                t.infantNo = DeTail.infantNo;
                t.tongGiaVeNguoiLon = DeTail.adultNo * ((int)(t.cb.Gia) + (int)(t.cb.Thue));
                t.tongGiaVetreEm = DeTail.childNo * ((int)(t.cb.GiaTreEm) + (int)(t.cb.ThueTreEm));
                t.tongGiaveSoSinh = DeTail.infantNo * (int)(t.cb.GiaVeTreSoSinh);
                ViewBag.tongtien += t.tongGiaVeNguoiLon + t.tongGiaVetreEm + t.tongGiaveSoSinh;
                //lưu mã chuyến bay lượt về vào session 
                Session[CommonSession.FLIGHTARV_ID] = DeTail.MaChuyenBayLuotVe;
                result.Add(t);
            }
            return View(result);
        }
        [HttpPost]
        public ActionResult Review(KhachHangModel khmodel, IList<adult> adults, IList<child> childs, IList<infant> infants, int radiopayment)
        {
            //Lưu Khách hàng(người đặt vé) vào cơ sở dữ liệu 
            new F_ThemKhachHang().ThemKhachHang( khmodel.fullname, khmodel.txtPax1_Ctry, khmodel.phone, khmodel.email, khmodel.address,radiopayment);
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
                    HanhLy adultBaggage = new F_ThemHanhKhach().FindEntity(item.adultBaggage);
                    item.adultBaggageType = adultBaggage.TenHanhLy;
                    ViewBag.tongtien += adultBaggage.GiaTien;
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
                    HanhLy childBaggage = new F_ThemHanhKhach().FindEntity(item.childBaggage);
                    item.childBaggageType = childBaggage.TenHanhLy;
                    ViewBag.tongtien += childBaggage.GiaTien;
                    new F_ThemHanhKhach().ThemHanhKhach(item);
                    DateTime ngaysinh = DateTime.ParseExact(item.childBirthday, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    HanhKhach temp1 = new AirLineDbContext().HanhKhaches.Where(x => x.GioiTinh == item.childSex
                    && x.HoTen == item.childName
                    && x.NgaySinh == ngaysinh
                    && x.MaHanhLy == item.childBaggage
                    ).SingleOrDefault();
                    // lấy lại mã hành khách để sinh vé ở bước cuối cùng 
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
            var temp = new AirLineDbContext().ThanhToans.Where(x => x.MaThanhToan == radiopayment).SingleOrDefault();
            //Khách Hàng(Người đặt vé) thì truyền qua ViewBag, hanh khach thi truyen qua view 

            ViewBag.HinhThucThanhToan = temp.TenHinhThucThanhToan;
            ViewBag.khachhang = model;
            ViewBag.tongtien += khmodel.tongtien;

            return View(hkModel);
        }
        public ActionResult Thankyou(string makhachhang,int amount, List<string> hkID)
        {
            string machuyenbayluotdi = Session[CommonSession.FLIGHTDEP_ID] as string;
            DateTime date = DateTime.Today;
            string maCode = new F_GenerateCode().RandomString();
            foreach (string item in hkID)
            {
                new F_GenerateCode().Generatecode(machuyenbayluotdi, amount, maCode, item, makhachhang,date);
            }
            if(Session[CommonSession.FLIGHTARV_ID] != null)
            {
                string machuyenbayluotve = Session[CommonSession.FLIGHTARV_ID] as string;
                foreach (string item in hkID)
                {
                    new F_GenerateCode().Generatecode(machuyenbayluotve, amount, maCode, item, makhachhang,date);
                }
            }
            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonSession.USER_SESSION] = null;
            return RedirectToAction("Index");
        }
        
        public ActionResult Register()
        {
            return View();
        }

        public static string EncMD5(string passwword)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            UTF8Encoding encoder = new UTF8Encoding();
            byte[] originalBytes = encoder.GetBytes(passwword);
            byte[] encodedBytes = md5.ComputeHash(originalBytes);
            passwword = BitConverter.ToString(encodedBytes).Replace("-", "");
            var result = passwword.ToLower();
            return result;

        }

        [HttpPost]
        public ActionResult Register(Member member)
        {
            var db = new AirLineDbContext();
            var user = db.Admins.SingleOrDefault(x => x.UserName == member.UserName);
            if (member.Password != member.RePassword)
            {
                return Json(new
                {
                    status = "LoiMatKhau",
                    msg = "Nhập lại mật khẩu không trùng khớp"
                });
            }
            if (user != null)
            {
                return Json(new
                {
                    status = "ThatBai",
                    msg = "Tên đăng nhập đã tồn tại"
                });
            }
            var counter = db.Admins.Count() + 1;
            string str = counter.ToString();
            string encpsw = EncMD5(member.Password);
            db.Admins.Add(new Admin
            {
                MaThanhVien = str,
                TenThanhVien = member.FullName,
                UserName = member.UserName,
                Password = encpsw,
                //Password = member.Password,
                GroupID = "MEMBER"                
            });
            db.SaveChanges();
            return Json(new
            {
                status = "ThanhCong",
                msg = "Đăng ký thành công"
            });
        }
    }
}