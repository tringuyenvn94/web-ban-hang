<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="PaymentInfo.aspx.cs" Inherits="PaymentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="text-align: center;">
        <span ><span style="color: rgb(255, 0, 0);"><span><strong style="font-size: 20px;">HƯỚNG
            DẪN THANH TOÁN</strong> </span></span></span>
    </p>
    <p>
        <span><strong  style="font-size: 16px;">1. Thanh toán trực tiếp cho người giao hàng</strong>
        </span>
    </p>
    <p>
        <span ><strong style="font-size: 16px;">2. Thanh toán trực tiếp tại văn phòng:</strong>
        </span>
    </p>
    <ul>
        <li style="color: #0066cc; font-weight: bold; font-size: 15px;" >THÁI DEAL</li>
        <li><strong>Địa chỉ: </strong>Số 7 tổ 6 ngõ 105 Đường Lương Ngọc Quyến TP Thái Nguyên
        </li>
        <li><strong>Tel:</strong> 0983165163 | <strong>Email:</strong> <a href="mailto:loveyou_is_loveme_1501@yahoo.com">
            loveyou_is_loveme_1501@yahoo.com</a> </li>
    </ul>
   
    <p>
        <span style="font-size: 16px;"><strong>3. Thanh toán chuyển khoản qua ngân hàng:</strong>
        </span>
    </p>
    <p>
        <asp:Label ID="lblInfo" runat="server" Text="Label"></asp:Label>
    </p>
</asp:Content>
