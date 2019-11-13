using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;


namespace Flight.Models.Functions
{
    public class F_Login
    {
        private AirLineDbContext context = null;
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
        public F_Login()
        {
            context = new AirLineDbContext();
        }
        public IQueryable<Admin> DS_Admin
        {
            get { return context.Admins; }
        }
        public List<string> GetListCredential(string userName)
        {
            var user = context.Admins.Single(x => x.UserName == userName);
            var data = (from a in context.Credentials
                        join b in context.UserGroups on a.UserGroupID equals b.ID
                        join c in context.Roles
                        on a.RoleID equals c.ID
                        where b.ID == user.GroupID
                        select new
                        {
                            RoleID = a.RoleID,
                            UserGroupID = a.UserGroupID
                        }).AsEnumerable().Select(x => new Credential()
                        {
                            RoleID = x.RoleID,
                            UserGroupID = x.UserGroupID
                        });
            return data.Select(x => x.RoleID).ToList();

                       
        }
        public bool login (string username, string password)
        {
            var pass = Flight.Models.Functions.F_Login.EncMD5(password);
            object[] sqlparams = new SqlParameter[]
            {
                new SqlParameter("@username", username),
                new SqlParameter("@password", pass),
            };
            var res = context.Database.SqlQuery<bool>("Account_Login @username,@password",sqlparams).SingleOrDefault();
            return res;
        }
    }
}