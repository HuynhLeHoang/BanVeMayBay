
using Flight.Common;
using Flight.Models;
using Flight.Models.Entity;
using Flight.Models.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Flight.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        // GET: Admin/Login
        
       
        
        public ActionResult Login()
        {
            try
            {
                Session[CommonSession.USER_SESSION] = null;
                return View("Login");
            }
            catch
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult SignIn(LoginModel model)
        {


            var F_login = new F_Login();
            if(ModelState.IsValid)

            {

                
                if (F_login.login(model.Username, model.Password))
                    {
                        var temp = new F_Login().DS_Admin.Where(x => x.UserName == model.Username && x.Password == model.Password).SingleOrDefault();
                        var UserSession = new UserLogin();
                        UserSession.UserName = model.Username;
                        UserSession.UserID = temp.MaThanhVien;
                        UserSession.Role = temp.Role;
                    if (UserSession.Role == "MEMBER")
                    {
                        Session.Add(CommonSession.USER_SESSION, UserSession);
                        return Json(new
                        {
                            msg = "M"
                        });
                    }
                    else if (UserSession.Role == "ADMIN")
                    {
                        Session.Add(CommonSession.AMDIN_SESSION, UserSession);
                        return Json(new
                        {
                            msg = "A"
                        });
                    }
                    
                }
                else
                    {
                    return Json(new
                    {
                        msg = "F"
                    });
                }
                
            }
            
            return View("Login");
            
        }
    
    }
}