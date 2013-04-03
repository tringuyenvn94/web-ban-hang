<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" EnableEventValidation="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="ManagerBill.aspx.cs" Inherits="Admin_ManagerBill" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="DIV_Bill" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Hóa đơn
        </div>
        <div style="width:95%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
            <div align="left" style="padding-bottom:15px;">
			    <b>Từ ngày : </b>&nbsp;
                <asp:TextBox ID="TB_DateFrom" runat="server" Width="155px" MaxLength="200"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="TB_DateFrom" runat="server" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                <b>Đến ngày : </b>&nbsp;
                <asp:TextBox ID="TB_DateTo" runat="server" Width="155px" MaxLength="200"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtender2" TargetControlID="TB_DateTo" runat="server" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                <asp:Button ID="Button1" runat="server" CausesValidation="false" 
                    CssClass="ButtonText" Text="Tìm Kiếm" onclick="Button1_Click"/>
		    </div>
		    <div class="DataGridTitleBar">
			    Quản lý hóa đơn
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_Bill" runat="server" AllowPaging="True" PageSize="10"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="On_DeleteBill"
                        onpageindexchanging="Grid_Bill_PageIndexChanging" OnRowDataBound="OnRowData_Bill" 
                        OnSelectedIndexChanged="OnRowSelected_Bill"
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Không có bản ghi nào" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_BillItem_BillID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CustomerID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_BillItem_CustomerID" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STT" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_STTItem" runat="server" Text='<%# Bind("STT") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C"/>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ngày đặt hàng" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_BillDatePurcharseItem" runat="server" Text='<%# Eval("Date_Purcharse") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên người mua" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBLBillNameItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBLBillAddressItem" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBLBillPhoneItem" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBLBillEmailItem" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gender" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBLBillGenderItem" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tổng Số lượng" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_BillTotalQuantityItem" runat="server" Text='<%# Eval("TotalQuantity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tổng tiền" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_BillTotalMoneyItem" runat="server" Text='<%# Eval("TotalMoney") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loại thanh toán" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_BillTypePaymentItem" runat="server" Text='<%# Eval("Title_Info") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="45%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Trạng thái thanh toán" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CHKB_Payment" runat="server" Checked='<%# Eval("Status_Payment") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_View" CssClass="ButtonText" runat="server" CommandName="Select" Text="Xem chi tiết"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="3%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_DeleteBill" CssClass="ButtonText" runat="server" CommandName="Delete" Text="Xóa"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="3%" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataRowStyle ForeColor="Red" HorizontalAlign="Center" />
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
					</div>
				</div>
		    </div>
        </div>
        <div style="width:100%;vertical-align:middle;">
            <div style="width:52%;vertical-align:middle;padding-left:300px;float:left;" align="right">
                <asp:Button ID="BT_UpdateStatusPayment" runat="server" 
                    Text="Cập nhật trạng thái thanh toán" Width="200px"
                    onclick="BT_UpdateStatusPayment_Click"/>
            </div>
            <div style="width:20%;vertical-align:middle;float:left;padding-top:4px;padding-left:556px;" align="left">
                &nbsp;&nbsp;<asp:Label ID="LBL_Display" ForeColor="Red" runat="server" Visible="false"></asp:Label>
            </div>
            <div style="clear:left;">
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
    <div id="DIV_ShopCart" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;">
            <h2>Đây là chi tiết giỏ hàng của</h2>
        </div>
        <div style="color:Black;padding-bottom:15px;width:80%;" align="left">
            <h2><asp:Label ID="LBL_FullName" runat="server" Text="Label"></asp:Label></h2>
            <h2><asp:Label ID="LBL_Address" runat="server" Text="Label"></asp:Label></h2>
            <h2><asp:Label ID="LBL_Phone" runat="server" Text="Label"></asp:Label></h2>
            <h2><asp:Label ID="LBL_Email" runat="server" Text="Label"></asp:Label></h2>
            <h2><asp:Label ID="LBL_Gender" runat="server" Text="Label"></asp:Label></h2>
        </div>
        <div style="width:90%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
		    <div class="DataGridTitleBar">
			    Quản lý giỏ hàng
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_ShopCart" runat="server" AllowPaging="True" PageSize="10"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID"
                        onpageindexchanging="Grid_ShopCart_PageIndexChanging" OnRowDataBound="OnRowData_ShopCart" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black"  GridLines="None" EmptyDataText="Không có bản ghi nào" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_ShopCartItem_BillID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="STT" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_STTItem" runat="server" Text='<%# Bind("STT") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C"/>
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên Sản Phẩm" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_CartNameProductItem" runat="server" Text='<%# Eval("NameProduct") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số lượng mua" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_CartQuantityItem" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giá Sản Phẩm" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_CartPriceProductItem" runat="server" Text='<%# Eval("PriceProduct") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tổng Tiền" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_CartTotalMoneyItem" runat="server" Text='<%# Eval("TotalMoneyProduct") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="Tan" />
                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                            <SortedAscendingCellStyle BackColor="#FAFAE7" />
                            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                            <SortedDescendingCellStyle BackColor="#E1DB9C" />
                            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                        </asp:GridView>
					</div>
				</div>
		    </div>
        </div>
        <div style="color:Red;padding-left:395px;width:80%;">
            <h2><asp:Label ID="LBL_TONG" runat="server" Text="Label"></asp:Label></h2>
        </div>
        <div style="width:100%;padding-top:10px;padding-bottom:5px;" align="center">
            <div style="width:100%;" align="center">
                <asp:Button ID="BT_Close" runat="server" CssClass="ButtonText" Text="Thoát" 
                    onclick="BT_Close_Click" />
            </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_Bill" type="hidden" runat="server" value="0"/>
        <input id="HD_ID_ShopCart" type="hidden" runat="server" value="0"/>
        <input id="HD_AccountID_ShopCart" type="hidden" runat="server" value="0"/>
        <input id="HD_DateFrom" type="hidden" runat="server" value=""/>
        <input id="HD_DateTo" type="hidden" runat="server" value=""/>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
