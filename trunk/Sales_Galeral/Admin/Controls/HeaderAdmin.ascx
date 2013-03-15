<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderAdmin.ascx.cs" Inherits="Admin_Controls_HeaderAdmin" %>

<div id="DIV_Banner" style="background-color:#E4E4E4;">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Admin/ImageAdmin/BannerAdmin.jpg" Width="1000px" Height="100px"/>
    <div style="clear:left;"></div>
</div>
<div style="padding:1px;"></div>
<div id="div_mq">
    <marquee scrollamount="4" onmouseover="this.stop()" onmouseout="this.start()">
        Xin chào bạn đã đến với quản trị Adminnistrator
    </marquee>
</div>
<div style="padding:1px;"></div>