<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" EnableEventValidation="true" ValidateRequest="false" CodeFile="ManagerAbout.aspx.cs" Inherits="Admin_ManagerAbout" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div id="DIV_About" style="width:100%;border:0px solid #c0c0c0;padding-bottom:5px;" align="center" runat="server">
                <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
                    Quản lý thông tin giới thiệu
                </div>
            </div>
            <div id="DIV_Progress" style="position: absolute; display: block;padding-left:360px;">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID=""
                DynamicLayout="true" DisplayAfter="5">
                    <ProgressTemplate>
                        <asp:Image ID="IMG_XMLProcess" runat="Server" ImageUrl="~/Admin/ImageAdmin/Process.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div id="DIV_AddEditAbout" style="width:100%;border:0px solid #c0c0c0;padding-top:5px;padding-bottom:30px;" align="center" runat="server">
                <div id="Div1" style="width:90%;border:1px solid #c0c0c0;" align="left" runat="server">
                    <div style="width:100%;" class="DataGridTitleBar">
			            Cập nhật Giới thiệu
		            </div>
                    <div style="height:10px;"></div>
                    <div style="width:100px;padding:2px;float:left;">
                        Tiêu đề giới thiệu
                    </div>
                    <div style="width:200px;padding:2px;float:left;">
                        <asp:TextBox ID="TB_TieuDe" runat="server" Width="400px"></asp:TextBox>
                    </div>
                    <div style="clear:left;"></div>
                    <div style="width:700px;padding-right:10px;">
                        <div>&nbsp;Nội dung :</div>
                        <div style="border-bottom:1px solid black;">
                            <FCKeditorV2:FCKeditor ID="FCKeditor" BasePath="./fckeditor/" runat="server">
                            </FCKeditorV2:FCKeditor>
                        </div>
                    </div>
                    <div style="clear:left;"></div>
                    <div style="width:310px;padding-top:20px;padding-bottom:10px;" align="center">
                        <div style="width:400px;float:left;" align="right">
                            <asp:Button ID="BT_SubmitAbout" runat="server" CssClass="ButtonText" 
                            Text="Chấp nhận" OnClick="BT_SubmitAbout_Click"/>
                        </div>
                        <div style="clear:left;"></div>
                    </div>
                </div>
            </div>
            <div visible="false">
                <input id="HD_ID_About" type="hidden" runat="server" value="0"/>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>