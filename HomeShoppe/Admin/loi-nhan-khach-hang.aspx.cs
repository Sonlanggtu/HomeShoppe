using HomeShoppe.DataBaseConection;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeShoppe.Admin
{
    public partial class loi_nhan_khach_hang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Quantri"] == null)
            {
                Response.Redirect("/Admin");
            }
            else
            {
                // day vao csdl
                int getID_delMesage = 0;
                getID_delMesage = Convert.ToInt32(Request.QueryString["guiID"]);
                if (getID_delMesage != 0)
                {
                    ConnectString ConnectionString1 = new ConnectString();
                    SqlConnection Conn1 = new SqlConnection(ConnectionString1.ConnectionString());
                    Conn1.Open();
                    string stringdel_message = "Delete PhanHoi where ID = " + getID_delMesage + "";
                    SqlCommand del_TN = new SqlCommand(stringdel_message, Conn1);
                    del_TN.ExecuteNonQuery();
                    Conn1.Close();
                }
                ConnectString ConnectionString = new ConnectString();
                SqlConnection Conn = new SqlConnection(ConnectionString.ConnectionString());
                Conn.Open();
                string get_message_Persion = "select ID, HoTenKhachHang, EmailKhachHang, SDTKhachHang, Tieude, LoiNhanKhachHang, NgayTao from PhanHoi";
                SqlCommand query_message_Persion = new SqlCommand(get_message_Persion, Conn);
                SqlDataReader render_message = query_message_Persion.ExecuteReader();
                string Read_message = "";
                while (render_message.Read())
                {
                    string HoTenKhachHang = render_message["HoTenKhachHang"].ToString();
                    string EmailKhachHang = render_message["EmailKhachHang"].ToString();
                    string SDTKhachHang = render_message["SDTKhachHang"].ToString();
                    string Tieude = render_message["Tieude"].ToString();
                    string LoiNhanKhachHang = render_message["LoiNhanKhachHang"].ToString();
                    int IDKhachHang = Convert.ToInt32(render_message["ID"]);
                    DateTime NgayTao = Convert.ToDateTime(render_message["NgayTao"]);
                    Read_message += "<tr>";
                    Read_message += "<td style='text-align:center;padding-left:15px; padding-right:15px' >" + HoTenKhachHang + "</td>";
                    Read_message += "<td style='text-align:center;padding-left:15px; padding-right:15px'>" + EmailKhachHang + "</td>";
                    Read_message += "<td style='text-align:center'>" + SDTKhachHang + "</td>";
                    Read_message += "<td style='padding-left:15px; padding-right:15px'>" + Tieude + "</td>";
                    Read_message += "<td style='text-align:justify'>" + LoiNhanKhachHang + "</td>";
                    Read_message += "<td style='text-align:center'>" + NgayTao + "</td>";
                    Read_message += "<td style='text-align:center;margin-top:10px;' class='btn btn-danger Delete_Mesage' data-id='" + IDKhachHang + "'>Xóa</td>";
                    Read_message += "</tr>";
                }
                LtMessage_Persion.Text = Read_message;
                Conn.Close();


            }
        }
            
    }
}