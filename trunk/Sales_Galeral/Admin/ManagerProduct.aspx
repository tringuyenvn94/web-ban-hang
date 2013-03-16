<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.master" EnableEventValidation="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="ManagerProduct.aspx.cs" Inherits="Admin_ManagerProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <link id="link_Style" href="~/Style/Style.css" rel="Stylesheet" type="text/css" runat="server"/>
    <script type="text/javascript" language="javascript">
        function EnsureNumericKeyEntry(x) {
            var kCode, kChar
            kCode = event.keyCode
            kChar = String.fromCharCode(kCode)
            /*if(kCode == 13){
            SubmitOK()
            }*/
            /*  ns7 added -  Remove blanks = 32 , */

            if (kCode == 32 || kCode == 37) {
                return false;
            }

            if (!isNaN(kChar)) {
                return true;
            } else {
                if (kChar == ".") {
                    var index
                    index = x.indexOf(".")
                    if (index != -1) {
                        return false;
                    }
                } else {
                    if ((kCode != 8) && (kCode != 45)) {
                        return false;
                    }
                }
                return true;
            }
        }

        function maskIt_Space(fld) {
            fldVal = fld.value;
            var tmpStr = "(";
            keyCount = fldVal.length;
            keyEntered = fldVal.substring(keyCount - 1, keyCount);
            var isNamedFone;
            if (keyCount < 2) isNamedFone = false;
            if (!isNamedFone) isNamedFone = chkNAN(keyEntered);
            keyCount++;
            with (document.forms[0]) {
                switch (keyCount) {
                    case 2:
                        tmpStr += fldVal;
                        fld.value = tmpStr;
                        break;
                    case 5:
                        fld.value += ") ";
                        break;
                    case 10:
                        fld.value += "-";
                        break;
                    case 14:
                        fld.value += "";
                        break;
                }
            }
        }
    </script>
    <div id="DIV_Product" style="width:100%;border:0px solid #c0c0c0;padding-bottom:30px;" visible="false" align="center" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div style="color:Red;padding-top:15px;padding-bottom:15px;padding-left:2px;padding-right:2px;font-size:20px;font-weight:bold">
            Quản lý dữ liệu Sản Phẩm
        </div>
        <div style="width:95%;border-right:1px solid #c0c0c0;border-top:1px solid #c0c0c0;
        border-left:1px solid #c0c0c0;border-bottom:1px solid #c0c0c0;">
            <div align="left" style="padding-bottom:15px;">
			    <b>Tìm kiếm bằng tên sản phẩm : </b>&nbsp;<asp:TextBox ID="TB_SearchProduct" runat="server"></asp:TextBox>&nbsp;
                <asp:Button ID="Button1" runat="server" CssClass="ButtonText" Text="Tìm Kiếm" 
                    onclick="Button1_Click" />
		    </div>
		    <div class="DataGridTitleBar">
			    Quản lý Sản Phẩm
		    </div>
		    <div style="width:100%;vertical-align:top;">
				<div style="border-collapse:collapse;border-color:#c0c0c0;width:100%;border::1px solid #c0c0c0;">
					<div style="width:100%;vertical-align:top">
                        <asp:GridView ID="Grid_Product" runat="server" AllowPaging="True" PageSize="5"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" OnRowDeleting="On_DeleteProducts"
                        OnRowDataBound="OnRowData_Product" OnSelectedIndexChanged="OnRowSelected_Product"
                        onpageindexchanging="Grid_Product_PageIndexChanging" Width="100%" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        CellPadding="2" ForeColor="Black" GridLines="None" EmptyDataText="Do not have any record" EmptyDataRowStyle-ForeColor="red">
                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_ProductItem" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_CategoryIDItem" runat="server" Text='<%# Bind("Category_ID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tên SP" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_NameItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mã SP" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_ProductCodeItem" runat="server" Text='<%# Eval("Product_Code") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giá gốc" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_PriceOriginalItem" runat="server" Text='<%# Eval("Price_Original") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Giá Bán" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_PriceSaleItem" runat="server" Text='<%# Eval("Price_Sale") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="% giảm giá" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_PriceDiscountItem" runat="server" Text='<%# Eval("Price_Discount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số lượng hiện có" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_QuantityInItem" runat="server" Text='<%# Eval("Quantity_In") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Số lượng bán" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_QuantityBoughtItem" runat="server" Text='<%# Eval("Quantity_Bought") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ảnh" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Image ID="LBL_ImageProductItem" runat="server" ImageUrl='<%# "../images/ImageProduct/"+Eval("Image")%>'  Width="30px" Height="30px"/>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Đường dẫn ảnh" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_LinkImageProductItem" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mô tả" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_DescriptionItem" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="#D2B48C" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Chi tiết" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_DetailsItem" runat="server" Text='<%# Eval("Details") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loại" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="LBL_TypeItem" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle BackColor="Silver" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_SelectProduct" CausesValidation="false" Text="Cập Nhật" CssClass="ButtonText" runat="server" CommandName="Select"/>
                                    </ItemTemplate>
                                    <ItemStyle Width="2%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="BT_DeleteProduct" CssClass="ButtonText" runat="server" CommandName="Delete" Text="Xóa"/>
                                    </ItemTemplate>
                                    <ItemStyle Width="2%" />
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
                        <div style="width:100%;padding-top:5px;" align="left">
                            <asp:Button ID="BT_AddProduct" CssClass="ButtonText" Width="55px" 
                            runat="server" Text="Thêm" CausesValidation="False" 
                            onclick="BT_AddProduct_Click"  />
                        </div>
					</div>
				</div>
		    </div>
        </div>
    </div>
    <div id="DIV_AddEditProduct" style="width:100%;border:0px solid #c0c0c0;padding-top:5px;padding-bottom:30px;" visible="false" align="center" runat="server">
        <div style="width:700px;" align="left">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        </div>
        <div id="Div1" style="width:700px;border:1px solid #c0c0c0;" align="left" runat="server">
            <div style="width:700px;" class="DataGridTitleBar">
			    Thêm/Cập nhật Sản Phẩm
		    </div>
            <div style="height:10px;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Thể loại sản phẩm : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:DropDownList ID="DDL_TheLoai" runat="server" Width="155px"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFV_DDL_CategoryName" runat="server" Display="Dynamic" ControlToValidate="DDL_TheLoai"
				ErrorMessage="Category Name must be select."><span style="color:Red;">(*)</span></asp:RequiredFieldValidator>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Tên Sản Phẩm : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_TenSanPham" runat="server" Width="150px" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_TB_NameProduct" runat="server" Display="Dynamic" ControlToValidate="TB_TenSanPham"
				ErrorMessage="User Name must be entered."><span style="color:Red;">(*)</span></asp:RequiredFieldValidator>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Mã Sản Phẩm : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_MaSanPham" runat="server" Width="150px" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RFV_TB_ProductCode" runat="server" Display="Dynamic" ControlToValidate="TB_MaSanPham"
				ErrorMessage="Product Code must be entered." ><span style="color:Red;">(*)</span></asp:RequiredFieldValidator>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Giá gốc : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_GiaGoc" runat="server" Width="150px" MaxLength="12"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Giá bán : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_GiaBan" runat="server" Width="150px" MaxLength="12"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                % Giảm giá : 
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_GiamGia" runat="server" Width="150px" MaxLength="12"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Số lượng có trong kho :
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_SoLuongCo" runat="server" Width="150px" MaxLength="12"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Số lượng đã bán
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_SoLuongBan" runat="server" Width="150px" MaxLength="12" ReadOnly="true" CssClass="ReadonlyTextRight"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Ảnh Sản Phẩm
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:FileUpload ID="FileUpload_Image" runat="server" Width="220px"/>
                <asp:Button ID="BT_Upload" runat="server" CausesValidation="false" Text="Upload" onclick="BT_Upload_Click" />
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;height:70px;">
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <div style="float:left;width:110px;">
                    <asp:Image ID="IMG_Upload" runat="server" Width="110px" Height="70px" BorderWidth="1"/>
                </div>
                <div style="float:left;width:240px;padding-top:48px;">
                    &nbsp;&nbsp;
                </div>
                <div style="clear:left;">
                </div>
            </div>
            <div style="clear:left;"></div>
            <div style="width:150px;padding:2px;float:left;">
                Mô tả sản phẩm
            </div>
            <div style="width:350px;padding:2px;float:left;">
                <asp:TextBox ID="TB_MoTa" runat="server" TextMode="MultiLine" Rows="3" Width="300px" MaxLength="300"></asp:TextBox>
            </div>
            <div style="clear:left;"></div>
            <div style="width:700px;padding-right:10px;">
                <div>Thông tin chi tiết :</div>
                <div style="border-bottom:1px solid black;">
                    <FCKeditorV2:FCKeditor ID="FCKeditor" BasePath="./fckeditor/" runat="server">
                    </FCKeditorV2:FCKeditor>
                </div>
            </div>
            <div style="clear:left;"></div>
            <div style="width:700px;padding-top:20px;padding-bottom:10px;" align="center">
                <div style="width:350px;float:left;" align="right">
                    <asp:Button ID="BT_SubmitProduct" runat="server" CssClass="ButtonText" 
                    Text="Chấp Nhận" onclick="BT_SubmitProduct_Click" />
                </div>
                <div style="width:350px;float:left;" align="left">
                    <asp:Button ID="BT_Cancel" runat="server" CssClass="ButtonText"  
                    CausesValidation="false" Text="Thoát" onclick="BT_Cancel_Click"/>
                </div>
                <div style="clear:left;"></div>
            </div>
        </div>
    </div>
    <div visible="false">
        <input id="HD_ID_Product" type="hidden" runat="server" value="0"/>
        <input id="HD_CategoryID_Product" type="hidden" runat="server" value="0"/>
        <input id="TB_PartImage" type="hidden" runat="server" value=""/>
    </div>
</asp:Content>