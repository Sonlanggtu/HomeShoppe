using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe.Page.Client.Generic
{
    public partial class Header_Login_Register : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            Session["KhachHang"] = null;
            if (Session["KhachHang"] == null)
            {
                ChuaDangNhap.Visible = true;
                DaDangNhap.Visible = false;
            }
            else
            {
                ChuaDangNhap.Visible = true;
                DaDangNhap.Visible = false;
            }

        }
    }
}