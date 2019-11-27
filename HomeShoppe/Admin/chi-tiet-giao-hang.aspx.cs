using HomeShoppe.DataBaseConection;
using System;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class chi_tiet_giao_hang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {

                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                string get_ChitietGiaoHang = "select ID as IDDatHang, HoTenKhachHang, DiaChiKhachHang, EmailKhachHang, Sdtkhachhang, NgayTao from DatHang";
                SqlCommand query_get_ChitietGiaoHang = new SqlCommand(get_ChitietGiaoHang, Conn);
                SqlDataReader render_ChiTietGiaoHang = query_get_ChitietGiaoHang.ExecuteReader();
                string Read_ChitietGiaoHang = "";
                while (render_ChiTietGiaoHang.Read())
                {
                    int IDDatHang = Convert.ToInt32(render_ChiTietGiaoHang["IDDatHang"]);
                    string HoTenKhachHang = render_ChiTietGiaoHang["HoTenKhachHang"].ToString();
                    string DiaChiKhachHang = render_ChiTietGiaoHang["DiaChiKhachHang"].ToString();
                    string EmailKhachHang = render_ChiTietGiaoHang["EmailKhachHang"].ToString();
                    string Sdtkhachhang = render_ChiTietGiaoHang["Sdtkhachhang"].ToString();
                    DateTime NgayTao = Convert.ToDateTime(render_ChiTietGiaoHang["NgayTao"]);

                    Read_ChitietGiaoHang += "<tr>";
                    Read_ChitietGiaoHang += "<td style='text-align: center' scope='row'>" + IDDatHang + "</td>";
                    Read_ChitietGiaoHang += "<td style='text-align: center'>" + HoTenKhachHang + "</td>";
                    Read_ChitietGiaoHang += "<td style='text-align: center'>" + DiaChiKhachHang + "</td>";
                    Read_ChitietGiaoHang += "<td style='text-align: center'>" + EmailKhachHang + "</td>";
                    Read_ChitietGiaoHang += "<td style='text-align: center'>" + Sdtkhachhang + "</td>";
                    Read_ChitietGiaoHang += "<td style='text-align: center;'>" + NgayTao + "</td>";
                    Read_ChitietGiaoHang += "</tr>";
                }
                LtChiTietGiaoHang.Text = Read_ChitietGiaoHang;
                Conn.Close();
            }

        }
    }
}