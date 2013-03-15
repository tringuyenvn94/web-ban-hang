<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuLeftAdmin.ascx.cs" Inherits="Admin_Controls_MenuLeftAdmin" %>

<div id="div_left">
    <div id="divlog" style="padding-left:10px;">
        <asp:Label ID="LBL_Welcome" runat="server" Visible="false" ForeColor="White"></asp:Label>
        <asp:HyperLink ID="HyperLink5" NavigateUrl="~/Admin/AdminLogin.aspx" runat="server" CssClass="link1">
            <asp:Label ID="LBL_LogOut" runat="server" Visible="false" ForeColor="Red"></asp:Label>
        </asp:HyperLink>
    </div>
    <div style="height:30px;"></div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="Admin.aspx?" class="link2" target="_parent" >Trang chủ</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerAdmin.aspx?" class="link2" target="_parent" >Quản lý Admin</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerCategory.aspx?" class="link2" target="_parent" >Quản lý Thể loại</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerProduct.aspx?" class="link2" target="_parent" >Quản lý Sản Phẩm</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerCustomer.aspx?" class="link2" target="_parent" >Quản lý Khách hàng</a> 
    </div>
     <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerBill.aspx?" class="link2" target="_parent" >Quản lý Hóa đơn</a> 
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerAbout.aspx?" class="link2" target="_parent" >Quản lý Giới thiệu</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerLink.aspx?" class="link2" target="_parent" >Quản lý liên kết</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerSupportOnline.aspx?" class="link2" target="_parent" >Quản lý Trực tuyến</a>
    </div>
    <div class="menu">
        <div class="div3" ></div>
        <a href="ManagerTypePayment.aspx?" class="link2" target="_parent" >Quản lý thanh toán</a>
    </div>
    <div style="height:758px;"></div>
 </div>