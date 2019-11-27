<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="Xem-dat-hang.aspx.cs" Inherits="HomeShoppe.Admin.Xem_dat_hang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="white-box">
                <h3 class="box-title">Xem Đặt Hàng</h3>              
            </div>
            <table class="col-lg-7">
                <thead class="thead-dark">
                    <tr class="box-title">
                        <th class="col-lg-1" style="text-align: center">ID Đặt Hàng</th>
                        <th class="col-lg-3" style="text-align: center">Tên Sản Phẩm</th>
                        <th class="col-lg-2" style="text-align: center">Giá</th>
                        <th class="col-lg-1" style="text-align: center">Số lượng</th>
                    </tr>
                </thead>
                <tbody>
                  <asp:Literal ID="LtDatHang" runat="server"></asp:Literal>
                </tbody>
            </table>
            

             <table class="col-lg-2" style="margin-top:20px;">
                <thead class="thead-dark">
                    <tr class="box-title">                     
                        <th class="col-lg-2" style="text-align: center">Tổng tiền đơn hàng</th>           
                    </tr>
                </thead>
                <tbody>
                   <asp:Literal ID="LtTinhHoaDon" runat="server"></asp:Literal>
                </tbody>
            </table>


            <table class="col-lg-3" style="margin-top:20px;">
                <thead class="thead-dark">
                    <tr class="box-title">                     
                         <th class="col-lg-3" style="text-align: center;">Tổng tiền tất cả KH</th>      
                    </tr>
                </thead>
                <tbody>
                   <asp:Literal ID="LTTongTienTatHoaDon" runat="server"></asp:Literal>
                </tbody>
            </table>
                      
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
