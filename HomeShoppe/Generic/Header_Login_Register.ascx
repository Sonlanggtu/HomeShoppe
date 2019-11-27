<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header_Login_Register.ascx.cs" Inherits="HomeShoppe.Page.Client.Generic.Header_Login_Register" %>
<%--<li class="li_menu_top_left"><a href="/dang-ky"><i class="fas fa-pencil-alt">Đăng ký</i></a></li>
<li class="li_menu_top_left"><a href="/dang-nhap"><i class="fas fa-lock">Đăng nhập</i></a></li>--%>

   <asp:PlaceHolder ID="ChuaDangNhap" runat="server">
                            <li class="li_menu_top_left"><a href="/dang-ky"><i class="fas fa-pencil-alt">Đăng ký</i></a></li>
                            <li class="li_menu_top_left"><a href="/dang-nhap"><i class="fas fa-lock">Đăng nhập</i></a></li>
                        </asp:PlaceHolder>

                         <asp:PlaceHolder ID="DaDangNhap" runat="server">
                          
                         </asp:PlaceHolder>