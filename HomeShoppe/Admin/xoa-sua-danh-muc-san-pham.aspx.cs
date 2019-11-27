using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe.Admin
{
    public partial class xoa_sua_danh_muc_san_pham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                //bat request sua Danh muc sp tu ben them moi danh muc sp
                int getID_Sua_PC = 0;
                string TheLoaiSP1 = Request.QueryString["TheLoaiSP"];
                string url1 = Request.QueryString["url"];
                string TheTuKhoa1 = Request.QueryString["TheTuKhoa"];
                string TheMoTa1 = Request.QueryString["TheMoTa"];
                string MoTaDanhMuc1 = Request.QueryString["MoTaDanhMuc"];
                string TrangThai1 = Request.QueryString["TrangThai"];
                getID_Sua_PC = Convert.ToInt32(Request.QueryString["idproductcategory"]);
                int Checkbox = 3;
                if (TrangThai1 == "true")
                {
                    Checkbox = 1;
                }
                // gan ra checkbox = so nguyen de update vao database
                else
                {
                    Checkbox = 0;
                }
                // Neu duoc truyen vao
                if (getID_Sua_PC != 0)
                {
                    // update Danh Muc san pham
                    ConnectString ConnectionString3 = new ConnectString();
                    SqlConnection Conn3 = new SqlConnection(ConnectionString3.ConnectionString());
                    Conn3.Open();
                    string stringUpdateProductCategory = @"update DanhMucSanPham set TheLoaiSP = '" + TheLoaiSP1 + "' ,  Url = '" + url1 + "', TheTuKhoa='" + TheTuKhoa1 + "', TheMoTa='" + TheMoTa1 + "', MoTa = '" + MoTaDanhMuc1 + "', TrangThaiDM = " + Checkbox + " where ID = " + getID_Sua_PC + "";
                    SqlCommand Update_PCategory = new SqlCommand(stringUpdateProductCategory, Conn3);
                    Update_PCategory.ExecuteNonQuery();
                    Conn3.Close();
                }
                // xoa Danh muc SP
                Del_ProductCategory();

                // read danh muc sp
                Read_ProductCategory();
            }

            
        }

        public void Del_ProductCategory()
        {
            #region
            int getID_Delete_PCategory = 0;
            getID_Delete_PCategory = Convert.ToInt32(Request.QueryString["xoadanhmucsp"]);
            if (getID_Delete_PCategory != 0)
            {
                ConnectString ConnectionString2 = new ConnectString();
                SqlConnection Conn2 = new SqlConnection(ConnectionString2.ConnectionString());
                Conn2.Open();
                string stringDelete_PCategory = @"delete DanhMucSanPham where id = " + getID_Delete_PCategory + "";
                SqlCommand Delete_PCategory = new SqlCommand(stringDelete_PCategory, Conn2);
                Delete_PCategory.ExecuteNonQuery();
                Conn2.Close();
            }
            #endregion
        }

        public void Read_ProductCategory()
        {          
            #region
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            string get_ProductCategory = "select ID, TheLoaiSP, Url, TheTuKhoa, TheMoTa, MoTa, TrangThaiDM from DanhMucSanPham";
            SqlCommand query_ProductCategory = new SqlCommand(get_ProductCategory, Conn);
            SqlDataReader render_ProductCategory = query_ProductCategory.ExecuteReader();
            string Read_ProductCategory = "";
            while (render_ProductCategory.Read())
            {
                int ID = Convert.ToInt32(render_ProductCategory["ID"]);
                string TheLoaiSP = render_ProductCategory["TheLoaiSP"].ToString();
                string Url = render_ProductCategory["Url"].ToString();
                string TheTuKhoa = render_ProductCategory["TheTuKhoa"].ToString();
                string TheMoTa = render_ProductCategory["TheMoTa"].ToString();
                string MoTa = render_ProductCategory["MoTa"].ToString();
                string TrangThai = render_ProductCategory["TrangThaiDM"].ToString();
                Read_ProductCategory += "<tr>";
                Read_ProductCategory += "<td style='text-align:center;padding-left:15px; padding-right:15px'>" + ID + "</td>";
                Read_ProductCategory += "<td style='text-align:center;padding-left:15px; padding-right:15px'>" + TheLoaiSP + "</td>";
                Read_ProductCategory += "<td style='text-align:center'>" + Url + "</td>";
                Read_ProductCategory += "<td style='padding-left:15px;padding-right:15px'>" + TheTuKhoa + "</td>";
                Read_ProductCategory += "<td style='text-align:justify'>" + TheMoTa + "</td>";
                Read_ProductCategory += "<td style='text-align:center'>" + MoTa + "</td>";
                Read_ProductCategory += "<td style='text-align:center'>" + TrangThai + "</td>";
                Read_ProductCategory += "<td><button  style='text-align:center; margin-right:10px' class='btn btn-info modify_PCategory' type='button' data-id='" + ID + "'>Sửa</button>";
                Read_ProductCategory += "<button  style='text-align:center ' class='btn btn-danger Delete_PCategory' type='button' data-id='" + ID + "'>Xóa</button></td>";
                Read_ProductCategory += "</tr>";
            }
            LtProductCategory.Text = Read_ProductCategory;
            Conn.Close();
            #endregion
        }

    }
}