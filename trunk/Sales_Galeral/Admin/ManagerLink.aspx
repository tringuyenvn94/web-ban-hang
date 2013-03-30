<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" EnableEventValidation="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="ManagerLink.aspx.cs" Inherits="Admin_ManagerLink" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="DIV_Link" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Liên Kết
        </div>
        <div style="width:90%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
		    <div class="DataGridTitleBar">
			    Quản lý Liên Kết
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_Link" runat="server" AllowPaging="True" PageSize="10"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                        OnRowDeleting="On_RowDelete" OnRowDataBound="OnRowData_Link" OnSelectedIndexChanged="OnRowSelected_Link" 
                        OnPageIndexChanging="Grid_Link_PageIndexChanging" Width="100%" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Không có bản ghi nào" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" ShowHeader="true" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_LinkItem" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver"/>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STT" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_STTItem" runat="server" Text='<%# Bind("STT") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver"/>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Liên Kết" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_LinkLinkItem" runat="server" Text='<%# Eval("Link") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="90%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_SelectLink" CausesValidation="false" CssClass="ButtonText" Text="Cập Nhật" runat="server" CommandName="Select"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_DeleteLink" CssClass="ButtonText" runat="server" CommandName="Delete" Text="Xóa"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
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
                            <asp:Button ID="BT_AddLink" CssClass="ButtonText" Width="55px" runat="server" 
                            Text="Thêm" CausesValidation="False" onclick="BT_AddLink_Click1" />
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
    <div id="DIV_AddEditLink" style="width:100%;border:0px solid #c0c0c0;padding-top:30px;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="width:410px;" align="left">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        </div>
        <div id="Div1" style="width:410px;border:1px solid #c0c0c0;" align="left" runat="server">
            <div style="width:410px;" class="DataGridTitleBar">
			    Thêm/Cập Nhật Liên Kết
		    </div>
            <div style="height:10px;"></div>
            <div style="width:70px;padding:2px;float:left;">
                Liên Kết : 
            </div>
            <div style="width:330px;padding:2px;float:left;">
                <asp:TextBox ID="TB_LienKet" runat="server" TextMode="MultiLine" Rows="3" Width="300px"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:410px;padding-top:20px;padding-bottom:10px;" align="center">
                <div style="width:205px;float:left;" align="right">
                    <asp:Button ID="BT_SubmitLink" runat="server" CssClass="ButtonText" 
                    Text="Chấp nhận" onclick="BT_SubmitLink_Click" />
                </div>
                <div style="width:205px;float:left;" align="left">
                    <asp:Button ID="BT_Cancel" runat="server" CssClass="ButtonText" Width="75px"
                    CausesValidation="false" Text="Thoát" onclick="BT_Cancel_Click"/>
                </div>
                <div style="clear:left;"></div>
            </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_Link" type="hidden" runat="server" value="0"/>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>