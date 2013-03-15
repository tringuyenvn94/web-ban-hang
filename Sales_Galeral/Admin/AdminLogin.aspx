<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" EnableEventValidation="true" ValidateRequest="false" Inherits="Admin_AdminLogin" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<%@ Register Src="~/Admin/Controls/HeaderAdmin.ascx" TagName="Top" TagPrefix="uc_Top" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Admin</title>
    <link id="link_Style" href="../Style/Style.css" rel="Stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="divcan">
            <uc_Top:Top runat="server" ID="UC_Top" />
        </div>
        <div style="padding-top:130px;padding-bottom:180px;width:1000px;margin:0 auto;color:Red;border:1px solid #c0c0c0" align="center">
            <h1>HÃY ĐĂNG NHẬP ĐỂ QUẢN LÝ</h1>
            <div style="padding-bottom:3px;">
                <asp:Label ID="LBL_Info" runat="server" Visible="false" Text="Label" ForeColor="Red"></asp:Label>
            </div>
            <fieldset id="FIELDSET" class="Fieldset" style="width:40%;border-radius: 10px;-moz-border-radius: 10px;" runat="server">
                <legend class="FieldSetLegend" style="font-weight: bold; font-size: 12px">Access</legend>
                <table class="NormalText" border="0" width="100%" cellspacing="0" cellpadding="2" style="padding:5px">
                    <tr>
                        <td style="white-space:nowrap;width:40%; font-weight: bold;" align="right">
                            User Name :
                        </td>
                        <td style="white-space:nowrap;">
                            <asp:TextBox ID="TB_UseName" runat="server" Width="150px" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap;width:40%; font-weight: bold;" align="right">
                            Password :
                        </td>
                        <td style="white-space:nowrap;">
                            <asp:TextBox ID="TB_Password" runat="server" Width="150px" TextMode="Password" 
                                Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height:15px;" colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button CssClass="ButtonText" ID="BT_Login" runat="server" Text="Login" 
                                onclick="BT_Login_Click" BackColor="Black" BorderStyle="None" 
                                ForeColor="White" Font-Bold="True" Height="30px" Width="50px" />
                            &nbsp;&nbsp;&nbsp;<asp:Button ID="BT_Reset" runat="server" CssClass="ButtonText"  
                                CausesValidation="false" Text="Reset" onclick="BT_Reset_Click" BackColor="Black" BorderStyle="None" 
                                ForeColor="White" Font-Bold="True" Height="30px" Width="50px" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
