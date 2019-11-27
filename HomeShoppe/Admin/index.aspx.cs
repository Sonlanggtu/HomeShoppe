using System;

namespace HomeShoppe.Admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }

            string del_session_Login = Request.QueryString["thoat"];

            if (del_session_Login == "exit")
            {
                Session["Quantri"] = null;
                Response.Redirect("/");
            }

        }
    }
}