<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" AutoEventWireup="true" EnableEventValidation="true" ValidateRequest="false" CodeFile="ManagerTypePayment.aspx.cs" Inherits="Admin_ManagerTypePayment" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="DIV_TypePayment" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="color:Red;padding-top:15px;padding-bottom:15px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Thanh Toán
        </div>
        <div style="width:80%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
		    <div class="DataGridTitleBar">
			    Quản lý Thanh Toán
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_TypePayment" runat="server" AllowPaging="True" PageSize="10"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                        OnRowDataBound="OnRowData_TypePayment" OnSelectedIndexChanged="OnRowSelected_TypePayment" 
                        OnPageIndexChanging="Grid_TypePayment_PageIndexChanging" Width="100%" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Do not have any record" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="Loại Thanh Toán" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_TypePaymentItem" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver"/>
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Hình Thức Thanh Toán" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_InfoItem" runat="server" Text='<%# Eval("Info") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="85%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_SelectTypePayment" CausesValidation="false" CssClass="ButtonText" Text="Cập Nhật" runat="server" CommandName="Select"/>
                                    </ItemTemplate>
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
                        <div style="width:100%;padding-top:5px;" align="left">
                            <asp:Button ID="BT_AddTypePayment" CssClass="ButtonText" Width="55px" runat="server" 
                            Text="Thêm" CausesValidation="False" onclick="BT_AddTypePayment_Click1" />
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
    <div id="DIV_AddEditTypePayment" style="width:100%;border:0px solid #c0c0c0;padding-top:30px;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="width:510px;" align="left">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        </div>
        <div id="Div1" style="width:510px;border:1px solid #c0c0c0;" align="left" runat="server">
            <div style="width:510px;" class="DataGridTitleBar">
			    Thêm/Cập Nhật Hình Thức Thanh Toán
		    </div>
            <div style="height:10px;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Nội Dung Thanh Toán : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_NoiDung" runat="server" Width="300px" TextMode="MultiLine" Rows="15" Wrap="true"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:510px;padding-top:20px;padding-bottom:10px;" align="center">
                <div style="width:250px;float:left;" align="right">
                    <asp:Button ID="BT_SubmitTypePayment" runat="server" CssClass="ButtonText" 
                    Text="Submit" onclick="BT_SubmitTypePayment_Click" />
                </div>
                <div style="width:250px;float:left;" align="left">
                    <asp:Button ID="BT_Cancel" runat="server" CssClass="ButtonText"  
                    CausesValidation="false" Text="Cancel" onclick="BT_Cancel_Click"/>
                </div>
                <div style="clear:left;"></div>
            </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_TypePayment" type="hidden" runat="server" value="0"/>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>