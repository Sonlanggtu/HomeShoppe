using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe
{
    public partial class tintucmoi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string stringDadangnhap = "";
            string getdestroy_session = Request.QueryString["session"];
            if (getdestroy_session == "destroy")
            {
                Session["KhachHang"] = null;
                ChuaDangNhap.Visible = true;
                DaDangNhap.Visible = false;
            }
            if (Session["KhachHang"] != null)
            {
                string destroy = "destroy";
                ChuaDangNhap.Visible = false;
                stringDadangnhap += "<li class='li_menu_top_left'><a href='#'><i class='fas fa-user'>Chào " + Session["KhachHang"] + ",</i></a></li>";
                stringDadangnhap += "<li class='li_menu_top_left'><a href='/tin-tuc-moi?session=" + destroy + "'><i class='fas fa-sign-out-alt'>Đăng xuất</i></a></li>";
                LtDaDangNhap.Text = stringDadangnhap;
                DaDangNhap.Visible = true;
            }
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            // doc ra Sale Product
            Conn.Open();
            string PostCategories = null;
            string query_PostCategories = @"select TenTheLoai, LoaiBaiDang.DinhDanh as LoaiBDDinhDanh , 
                                     TenBaiViet, BaiDang.DinhDanh as BDDinhDanh, BaiDang.HinhAnh as HinhAnhBD, 
                                        BaiDang.MoTa as MoTaBD, BaiDang.NgayTao as NgayTaoBD , DemLuotXem
                                             from BaiDang, LoaiBaiDang
                                        where LoaiBaiDang.ID = BaiDang.IDLoaiBaiDang
                                      and (LoaiBaiDang.TrangThai = 1 and BaiDang.TrangThai = 1)";
            SqlCommand exec_PostCategories = new SqlCommand(query_PostCategories, Conn);
            SqlDataReader render_PostCategories = exec_PostCategories.ExecuteReader();
            while (render_PostCategories.Read())
            {

                PostCategories += "<div class='sectionNew'>";
                PostCategories += "<div class='ImgNew'>";
                PostCategories += "<a href='" + render_PostCategories["LoaiBDDinhDanh"].ToString() + "/" + render_PostCategories["BDDinhDanh"].ToString() + "'>";
                PostCategories += "<img src='" + render_PostCategories["HinhAnhBD"].ToString() + "' width='380px' /></a>";
                PostCategories += "</div>";
                PostCategories += "<div class='contentNew'>";
                PostCategories += "<a href='" + render_PostCategories["LoaiBDDinhDanh"].ToString() + "/" + render_PostCategories["BDDinhDanh"].ToString() + "'>";
                PostCategories += "<h4>" + render_PostCategories["TenBaiViet"].ToString() + "</h4>";
                PostCategories += "</a>";
                PostCategories += "<h6> Thể loại:<a href ='" + render_PostCategories["LoaiBDDinhDanh"].ToString() + "'> "+ render_PostCategories["TenTheLoai"].ToString() + "</a></h6>";
                PostCategories += "<h6>Đăng ngày " + render_PostCategories["NgayTaoBD"].ToString() + " </ h6>";
                PostCategories += "<p> Quan tâm: " + render_PostCategories["DemLuotXem"].ToString() + " lượt </p>";
                PostCategories += "<p>";
                PostCategories += "" + render_PostCategories["MoTaBD"].ToString() + "</p>";
                PostCategories += "</div>";
                PostCategories += "</div>";
            }
            LtPostCategories.Text = PostCategories;
            Conn.Close();
        }
    }
}