<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="loi-nhan-khach-hang.aspx.cs" Inherits="HomeShoppe.Admin.loi_nhan_khach_hang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
                    <div class="col-lg-12">
                        <div class="white-box">
                            <h3 class="box-title">Static</h3>                           
                        </div>
                        <table class="col-lg-12">
                            <thead class="thead-dark">
                                <tr class="box-title">
                                    <th class="col-lg-1" style="text-align:center" scope="row">Họ và Tên</th>
                                    <th class="col-lg-1"  style="text-align:center">Email</th>
                                    <th class="col-lg-1"  style="text-align:center">Số Điện Thoại</th>
                                    <th class="col-lg-2"  style="text-align:center">Tiêu Đề</th>
                                    <th class="col-lg-5"  style="text-align:center">Lời Nhắn Khách Hàng</th>
                                    <th class="col-lg-1"  style="text-align:center;">Ngày Tạo</th>
                                    <th class="col-lg-1" >#</th>
                                </tr>
                            </thead>
                            <tbody>
                               <asp:Literal ID="LtMessage_Persion" runat="server"></asp:Literal>
                            </tbody>
                        </table>
                </div>
         </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script>
        $(document).ready(function () {
            $('.Delete_Mesage').off('click').on('click', function () {
                var guiID = $(this).data('id');

                var xhttp;       
                xhttp = new XMLHttpRequest();
                window.location.replace("/Admin/loi-nhan-khach-hang?guiid=" + guiID);
             
            })
        })
    </script>
</asp:Content>
