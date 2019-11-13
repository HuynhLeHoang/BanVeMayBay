
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
        public ActionResult SignIn(LoginModel model, bool isLoginAdmin = false)    
        {


            var F_login = new F_Login();
            if(ModelState.IsValid)

            {

                
                if (F_login.login(model.Username, model.Password))
                    {
                    var password = Flight.Models.Functions.F_Login.EncMD5(model.Password);
                        var temp = new F_Login().DS_Admin.Where(x => x.UserName == model.Username && x.Password == password).SingleOrDefault();
                        var UserSession = new UserLogin();
                        UserSession.UserName = model.Username;
                        UserSession.UserID = temp.MaThanhVien;
                        UserSession.GroupID = temp.GroupID;
                    var listCredential = F_login.GetListCredential(model.Username);
                    Session.Add(CommonConstants.SESSION_CREDENTIAL, listCredential);
                    Session.Add(CommonSession.USER_SESSION, UserSession);
                    if (UserSession.GroupID == "MEMBER")
                    {
                       
                        return Json(new
                        {
                            msg = "M"
                        });
                    }
                    else if (UserSession.GroupID == "ADMIN")
                    {
                    
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