<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" EnableEventValidation="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <div id="DIV_Logo" style="width:100%;border:0px solid #c0c0c0;padding-top:5px;padding-bottom:15px;" align="center" runat="server">
        <div style="color:Red;padding-top:3px;">
            <h2>Chào mừng bạn đã đến với Quản trị Website ThaiDeal</h2>
        </div>
        <div style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerAdmin.aspx?"><img alt="" src="ImageAdmin/ManagerAdmin.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Admin</b>
        </div>
        <div align="center" style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerCategory.aspx?"><img alt="" src="ImageAdmin/ManagerCategories.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Thể loại</b>
        </div>
        <div align="center" style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerProduct.aspx?"><img alt="" src="ImageAdmin/ManagerProduct.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Sản Phẩm</b>
        </div>
        <div style="clear:left;"></div>
        <div style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerCustomer.aspx?"><img alt="" src="ImageAdmin/ManagerCustomer.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Khách hàng</b>
        </div>
        <div align="center" style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerBill.aspx?"><img alt="" src="ImageAdmin/ManagerBill.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Hóa đơn</b>
        </div>
        <div align="center" style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerAbout.aspx?"><img alt="" src="ImageAdmin/ManagerAbout.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Giới thiệu</b>
        </div>
        <div style="clear:left;"></div>
        <div style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerLink.aspx?"><img alt="" src="ImageAdmin/ManagerLink.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý liên kết</b>
        </div>
        <div align="center" style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerSupportOnline.aspx?"><img alt="" src="ImageAdmin/ManagerSupportOnline.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý Trực tuyến</b>
        </div>
        <div align="center" style="float:left;padding-left:100px;padding-top:20px;color:Red;">
            <a href="ManagerTypePayment.aspx?"><img alt="" src="ImageAdmin/ManagerTypePayment.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý thanh toán</b>
        </div>
        <div align="center" style="float:left;padding-left:350px;padding-top:20px;color:Red;">
            <a href="ManagerAddress.aspx?"><img alt="" src="ImageAdmin/ManagerAddress.jpg" width="150px" height="120px"/></a>
            <br />
            <b>Quản lý địa chỉ Website</b>
        </div>
        <div style="clear:left;"></div>
    </div>
</asp:Content>

