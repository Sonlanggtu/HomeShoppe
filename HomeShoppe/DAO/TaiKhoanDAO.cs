using HomeShoppe.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HomeShoppe.DAO
{
    public class TaiKhoanDAO
    {
        private ConnectionDBContext context = null;

        public TaiKhoanDAO()
        {
            context = new ConnectionDBContext();
        }

        public TaiKhoan ViewAccount(string username)
        {
            return context.TaiKhoans.Find(username);
        }

    }
}