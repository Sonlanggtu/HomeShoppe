using HomeShoppe.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HomeShoppe.Cart
{
    public class CartItem
    {
        
        public SanPham Product { set; get; }
     
        public int Quantity { set; get; }

        public CartItem()
        {
             Product = new SanPham();
             Quantity = 0;
        }
    }
}