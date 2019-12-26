using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Flight.Common;
namespace Flight
{
    public class HasCredentialAttribute: AuthorizeAttribute
    {
        public string RoleID { set; get; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[Common.CommonSession.USER_SESSION];
            if(session == null)
            {
                
                return false;
            }

            List<string> privilegeLevels = this.GetCredentialByLoggedInUser(session.UserName);
            if (privilegeLevels.Contains(this.RoleID) && session.GroupID == CommonConstants.ADMIN_GROUP)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[Common.CommonSession.USER_SESSION];
            if(session == null)
            {
                filterContext.Result =  new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary {
                    {"action","Login" },
                    { "Controller","Login"}
                
                });

            }
            else
            {
                filterContext.Result = new ViewResult
                {
                    ViewName = "~/Views/Shared/401.cshtml"
                };
            }
        }
        private List<string> GetCredentialByLoggedInUser(string username)
        {
            var credential = (List<string>)HttpContext.Current.Session[Common.CommonConstants.SESSION_CREDENTIAL];
            return credential;
        }
    }
}