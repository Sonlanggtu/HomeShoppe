using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace HomeShoppe.Admin
{
    public partial class TestChartJS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                Chart();
            }
           
        }

        public void Chart()
        {
            ConnectString ConnectionString = new ConnectString();
            SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
            Conn.Open();
            // lay tong sp
            string get_TongTatSPKhachMua = @"select sum(SoLuong) as TongSL_SP from ChiTietDatHang";
            SqlCommand cmd_LayTongTatSPKhachMua = new SqlCommand(get_TongTatSPKhachMua, Conn);
            SqlDataReader readerLayTongTatSPKhachMua = cmd_LayTongTatSPKhachMua.ExecuteReader();
            int LayTongTatSPKhachMua = 0;
            while (readerLayTongTatSPKhachMua.Read())
            {
                LayTongTatSPKhachMua += Convert.ToInt32(readerLayTongTatSPKhachMua["TongSL_SP"]);
            }
            Conn.Close();

            // lay ra tung sp va ten tung sp
            Conn.Open();
            string stringLaysanpham = @"select  IDSanPham , sum(SoLuong) as TongSoLuongTungSP, TenSanPham from ChiTietDatHang, SanPham
                                                    where ChiTietDatHang.IDSanPham = SanPham.ID
                                                    group by IDSanPham, TenSanPham
                                                    order by IDSanPham";
            SqlCommand cmd_ReadSP = new SqlCommand(stringLaysanpham, Conn);
            SqlDataReader readerSP = cmd_ReadSP.ExecuteReader();
            List<int> TongSL_TungSP = new List<int>();
            string inputChart = "";
            string TenSanPham2 = "";
            while (readerSP.Read())
            {
                int TongSoLuongTungSP = Convert.ToInt32(readerSP["TongSoLuongTungSP"]);
                string TenSanPham = readerSP["TenSanPham"].ToString();
                TenSanPham2 += "," + TenSanPham;
                TongSL_TungSP.Add(TongSoLuongTungSP);
            }
            Conn.Close();
            // list luu phan tram tung sp
            List<decimal> PT_TongSL_TungSP = new List<decimal>();
            foreach (int item in TongSL_TungSP)
            {
                decimal t = (decimal)item / LayTongTatSPKhachMua * 100;
                PT_TongSL_TungSP.Add(t);
            }

            // doc pt tung sp ra html
            string string_PT_TongSL_TungSP = "";
            foreach (decimal item in PT_TongSL_TungSP)
            {
                string_PT_TongSL_TungSP += "," + string.Format("{0:0.#}", item);
            }

            inputChart += "<input style='display:none' value = '" + string_PT_TongSL_TungSP + "' class='lay_dl_testchart' />";
            inputChart += "<input style='display:none' value = '" + TenSanPham2 + "' class='lay_dl_testchart2' />";
            LtChartJS.Text = inputChart;
        }
    }
}