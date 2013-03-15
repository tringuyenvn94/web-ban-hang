﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" EnableEventValidation="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="ManagerSupportOnline.aspx.cs" Inherits="Admin_ManagerSupportOnline" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="DIV_SupportOnline" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Hỗ trợ Online
        </div>
        <div style="width:50%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
		    <div class="DataGridTitleBar">
			    Quản lý Hỗ trợ Online
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_SupportOnline" runat="server" AllowPaging="True" PageSize="10"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                        OnRowDeleting="On_RowDelete" OnRowDataBound="OnRowData_SupportOnline" OnSelectedIndexChanged="OnRowSelected_SupportOnline" 
                        OnPageIndexChanging="Grid_SupportOnline_PageIndexChanging" Width="100%" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Do not have any record" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" ShowHeader="true" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_SupportOnlineItem" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver"/>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_NameItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="40%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Yahoo" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_YahooItem" runat="server" Text='<%# Eval("Yahoo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="40%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Điện thoại hỗ trợ" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_PhoneSuppotItem" runat="server" Text='<%# Eval("PhoneSuppot") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="40%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_SelectSupportOnline" CausesValidation="false" CssClass="ButtonText" Text="Cập Nhật" runat="server" CommandName="Select"/>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_DeleteSupportOnline" CssClass="ButtonText" runat="server" CommandName="Delete" Text="Xóa"/>
                                    </ItemTemplate>
                                    <ItemStyle Width="5%"/>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
                        <div style="width:100%;padding-top:5px;" align="left">
                            <asp:Button ID="BT_AddSupportOnline" CssClass="ButtonText" Width="55px" runat="server" 
                            Text="Thêm" CausesValidation="False" onclick="BT_AddSupportOnline_Click1" />
                        </div>
					</div>
				</div>
		    </div>
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
    <div id="DIV_AddEditSupportOnline" style="width:100%;border:0px solid #c0c0c0;padding-top:30px;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="width:310px;" align="left">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        </div>
        <div id="Div1" style="width:310px;border:1px solid #c0c0c0;" align="left" runat="server">
            <div style="width:310px;" class="DataGridTitleBar">
			    Thêm/Cập Nhật Hỗ trợ Online
		    </div>
            <div style="height:10px;"></div>
            <div style="width:100px;padding:2px;float:left;">
                Tên : 
            </div>
            <div style="width:200px;padding:2px;float:left;">
                <asp:TextBox ID="TB_NameSupportOnline" runat="server" Width="150px"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:100px;padding:2px;float:left;">
                Yahoo : 
            </div>
            <div style="width:200px;padding:2px;float:left;">
                <asp:TextBox ID="TB_YahooSupportOnline" runat="server" Width="150px"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:100px;padding:2px;float:left;">
                Điện thoại hỗ trợ : 
            </div>
            <div style="width:200px;padding:2px;float:left;">
                <asp:TextBox ID="TB_PhoneSupport" runat="server" Width="150px"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:310px;padding-top:20px;padding-bottom:10px;" align="center">
                <div style="width:155px;float:left;" align="right">
                    <asp:Button ID="BT_SubmitSupportOnline" runat="server" CssClass="ButtonText" 
                    Text="Submit" onclick="BT_SubmitSupportOnline_Click" />
                </div>
                <div style="width:155px;float:left;" align="left">
                    <asp:Button ID="BT_Cancel" runat="server" CssClass="ButtonText"  
                    CausesValidation="false" Text="Cancel" onclick="BT_Cancel_Click"/>
                </div>
                <div style="clear:left;"></div>
            </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_SupportOnline" type="hidden" runat="server" value="0"/>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>