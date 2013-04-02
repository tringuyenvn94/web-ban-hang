<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" EnableEventValidation="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="ManagerCustomer.aspx.cs" Inherits="Admin_ManagerCustomer" %>

<<<<<<< .mine
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="DIV_Progress" style="position: absolute; display: block;padding-left:360px;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID=""
        DynamicLayout="true" DisplayAfter="5">
            <ProgressTemplate>
                <asp:Image ID="IMG_XMLProcess" runat="Server" ImageUrl="~/Admin/Images/Process.gif" />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <div id="DIV_Account" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Khách Hàng
        </div>
        <div style="width:95%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
		    <div class="DataGridTitleBar">
			    Quản lý Khách Hàng
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_Account" runat="server" AllowPaging="True" PageSize="20"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="On_RowDeleteAccount"
                        OnRowDataBound="OnRowData_Account" OnRowSelected="OnRowSelected_Account"
                        onpageindexchanging="Grid_Account_PageIndexChanging" Width="100%" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Do not have any record" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" ShowHeader="true" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountItem" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Use Name" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountUseName" runat="server" Text='<%# Eval("UseName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="18%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giới tính" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountGender" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giới tính" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountGenderBool" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số điện thoại" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Địa chỉ" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="26%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="22%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_DeleteAccount" CssClass="ButtonText" runat="server" CommandName="Delete" Text="Delete"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="5%" />
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
					</div>
				</div>
		    </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_Account" type="hidden" runat="server" value="0"/>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>=======
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="DIV_Progress" style="position: absolute; display: block;padding-left:360px;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID=""
        DynamicLayout="true" DisplayAfter="5">
            <ProgressTemplate>
                <asp:Image ID="IMG_XMLProcess" runat="Server" ImageUrl="~/Admin/Images/Process.gif" />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <div id="DIV_Account" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Khách Hàng
        </div>
        <div style="width:95%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
            <div align="left" style="padding-bottom:15px;">
			    <b>Tìm kiếm theo tên khách hàng : </b>&nbsp;
                <asp:TextBox ID="TB_SearchName" runat="server" Width="155px" MaxLength="200"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CausesValidation="false" 
                    CssClass="ButtonText" Text="Tìm Kiếm" onclick="Button1_Click"/>
		    </div>
		    <div class="DataGridTitleBar">
			    Quản lý Khách Hàng
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_Account" runat="server" AllowPaging="True" PageSize="40"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="On_RowDeleteAccount"
                        OnRowDataBound="OnRowData_Account" OnRowSelected="OnRowSelected_Account"
                        onpageindexchanging="Grid_Account_PageIndexChanging" Width="100%" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Không có bản ghi nào" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" ShowHeader="true" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountItem" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Use Name" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountUseName" runat="server" Text='<%# Eval("UseName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Password" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="18%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giới tính" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountGender" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giới tính" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountGenderBool" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số điện thoại" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountPhone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Địa chỉ" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="26%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_AccountEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="22%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_DeleteAccount" CssClass="ButtonText" runat="server" CommandName="Delete" Text="Delete"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="5%" />
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
					</div>
				</div>
		    </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_Account" type="hidden" runat="server" value="0"/>
        <input id="HD_Name" type="hidden" runat="server" value=""/>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>>>>>>>> .r27
