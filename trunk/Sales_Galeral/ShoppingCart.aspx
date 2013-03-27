<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="client/css/StyleShowProduct.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="ContentShoppingCart" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">
    <%-- <div style="width: 690px; height: 550px; position: relative; top: 30px; left: 10px">--%>
    <div style="background-color: #FAFAD2; background-position: left 5px; background-repeat: no-repeat; border-color: #AACCAA; border-style: dotted none;  border-width: 1px 0;
    color: black; font-weight: 900;  margin: 1pt 1pt 1em 1em;  padding: 0.5em 1em 1.5em 48px;  background-image: url('client/img_product/information.png');">
       
            <b>Thông tin</b> : Sản phẩm đã được thêm vào giỏ.
            <br>
       
    </div>
    <h2 style="line-height: 1.2; font-family: Arial,sans-serif;font-size: 150%; font-weight: bold">Giỏ hàng</h2>
     <p id="messageStatus" runat="Server" visible="false" style="background-color: #68C5C3;
                margin: 20px auto; width: 685px;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="White" Font-Size="14pt" Text="" />
            </p>
    <div id="ContentShopCart" style="margin-top: 20px;">
        <asp:GridView ID="grvItemShopping" runat="server" AutoGenerateColumns="False" BackColor="White"
            CellSpacing="2" CellPadding="4" ForeColor="Black"
            Width="100%" OnRowCommand="grvProductCart_RowCommand" DataKeyNames="ID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" ControlStyle-CssClass="sectiontableentry1" HeaderText="Tên sản phẩm" ItemStyle-Width="500px">
<ControlStyle CssClass="sectiontableentry1"></ControlStyle>

<ItemStyle Width="450px"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Product_Code" HeaderText="Mã sản phẩm" />
                <asp:TemplateField HeaderText="Đơn giá">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Sale").ToString()))%>'></asp:Label></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Price_Sale") %>'></asp:TextBox></EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Số lượng/Cập nhật" FooterStyle-Width="20px">
                    <ItemTemplate>
                        <asp:TextBox ID="tbxQuantity" runat="server" Text='<%# Bind("Quantity") %>' Width="60px"
                            Style="margin-top: -2px; height: 18px; float: left;" />                        
                        <div style="margin-left: 5px; float: left; margin-top: 5px; width: 10px;">
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("ID") %>'
                                CommandName="updateQuantityInCart" ImageUrl="~/client/img/update_quantity_cart.png"
                                ToolTip="Cập nhật số lượng" />
                        </div>
                        <span onclick="return confirm('Bạn muốn xóa?')" />
                        <div style="margin-left: 20px; float: left; margin-top: 5px; margin-bottom: 5px;">
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("ID") %>'
                                ImageUrl="~/client/img/remove_from_cart.png" CommandName="removeItemInCart" ToolTip="Xóa sản phẩm khỏi giỏ hàng" />
                        </div>
                    </ItemTemplate>

            <FooterStyle Width="20px"></FooterStyle>

                    <ItemStyle Width="20%" />
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxQuantity" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox></EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thành tiền">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text=' <%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "AMOUNT").ToString())) %>'></asp:Label></ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:TextBox></EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#6A9FC7" Font-Bold="True" ForeColor="White" Height="30px"
                Font-Size="15px" CssClass="sectiontableheader" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#6A9FC7" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </div>
    <div id="CartTotals" style="float: right; margin-top: 10px;">       
            <asp:Label ID="Label3" runat="server" Text="Tổng tiền hàng:" Font-Bold="True"
                ForeColor="#333333"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotalPrice" runat="server" CssClass="total-price"  Font-Bold="True" ForeColor="#5496B6"></asp:Label>       
    </div>
    <div style="clear:both;"></div>
   
        <div style=" margin-left: 728px; margin-top: 15px;">
            <asp:Button ID="btnCheckOut" CssClass="mouseButton1" runat="server" Text="Thanh Toán Tiền"
               OnClick="btnCheckOut_Click" />
        </div>
</asp:Content>
