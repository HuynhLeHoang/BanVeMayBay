using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Flight.Models.Functions
{
    public class F_Login
    {
        private AirLineDbContext context = null;
        public F_Login()
        {
            context = new AirLineDbContext();
        }
        public IQueryable<Admin> DS_Admin
        {
            get { return context.Admins; }
        }
        public bool login (string username, string password)
        {
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@username", username),
                new SqlParameter("@password", password),
            };
            var res = context.Database.SqlQuery<bool>("Account_Login @username,@password",sqlparams).SingleOrDefault();
            return res;
        }
    }
}