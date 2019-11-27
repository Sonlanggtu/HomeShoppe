<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/PageGeneric.Master" AutoEventWireup="true" CodeBehind="TestChartJS.aspx.cs" Inherits="HomeShoppe.Admin.TestChartJS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <canvas id="myChart"></canvas>

    <asp:Literal ID="LtChartJS" runat="server"></asp:Literal>

    <h2 style="text-align:center"><b>Biểu đồ Thống kê số lượng sản phẩm khách hàng mua</b></h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="server">
    <script>

        $(document).ready(function () {
            var TongSoLuongTungSP = $('.lay_dl_testchart').val();
            var TenSanPham = $('.lay_dl_testchart2').val();
            var strTongSoLuongTungSP = TongSoLuongTungSP.slice(1);
            var strTenSanPham = TenSanPham.slice(1);
            var arr_TongSoLuongTungSP = strTongSoLuongTungSP.split(',');
            var arr_TenSanPham = strTenSanPham.split(',');
        
            ///
            var ctx = document.getElementById('myChart').getContext('2d');
            var chart = new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: arr_TenSanPham,
                    datasets: [{
                        label: 'Biểu đồ Thống kê số lượng sản phẩm khách hàng mua',
                        backgroundColor: 'rgb(255, 23, 32)',
                        borderColor: 'rgb(255, 99, 132)',
                        backgroundColor: [
                            "#f38b4a",
                            "#56d798",
                            "#ff8397",
                            "#6970d5",
                            "#9900FF",
                            "#00FFFF",
                            "#00FF82",                        
                            "#FFC800",                          
                            "#A8FFD4",
                            "#BAEDED",                 
                            "#51A9FF",                    
                            "#A8FFA8",                            
                            "#A8FFD5",
                            "#FFF900",
                            "#5D8BA1",
                            "#FFB4A8",
                            "#52FF51",
                            "#7D74DC",
                            "#FF2700",
                            "#DD6E22",
                            "#FF6700",
                            "#FF004F",
                            "#DC2326",
                            "#FF0004",
                            "#DC3C23",
                            "#DC235C",
                            "#FF2300"
                        ],
                        hoverBackgroundColor: [
                            "#A8FFFF",
                            "#BAD3ED",
                            "#A8D4FF",
                            "#8E33CB"
                        ],
                        data: arr_TongSoLuongTungSP,
                    }]
                },
                options: {}
            });

        })
    </script>
</asp:Content>
