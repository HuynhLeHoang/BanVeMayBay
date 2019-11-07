using Flight.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Flight.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
           
            var session1 = (UserLogin)Session[CommonSession.USER_SESSION];
            if (session1.GroupID == "MEMBER")
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "Home", action = "Index", Area = "~" }));
            }
            else if (session1.GroupID == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "Home", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }
        
    }
}