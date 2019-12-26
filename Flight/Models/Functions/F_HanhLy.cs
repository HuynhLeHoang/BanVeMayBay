using Flight.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flight.Models.Functions
{
    public class F_HanhLy
    {
        public bool Delete(string MaHanhLy)
        {
            try
            {
                var connect = new AirLineDbContext();
                var user = connect.HanhLies.Find(MaHanhLy);
                connect.HanhLies.Remove(user);
                connect.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}