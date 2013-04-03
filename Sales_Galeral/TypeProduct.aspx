<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TypeProduct.aspx.cs" Inherits="TypeProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 
        <div class="block_content" style="margin-left: -10px; margin-top: 10px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <asp:DataList ID="dtlTypeProduct" runat="server" Width="970px" RepeatColumns="3" 
                     CellSpacing="10">
                <ItemTemplate>
                    <div class="itemContainer">
                        <!-- style="width:32.0%;"-->
                        <div class="itemContainer-inner">
                            <!-- Start K2 Item Layout -->
                            <div class="catItemView groupPrimary">
                                <!-- Plugins: BeforeDisplay -->
                                <!-- K2 Plugins: K2BeforeDisplay -->
                                <div class="catItemBlogHeader">
                                    <!-- Item title -->
                                    <h3 class="catItemTitle" style="text-transform: none">
                                        <a href ='<%# "DetailProduct.aspx?idProduct="+Eval("ID") %>' title =' <%# Eval("Name")%>'>
                                           <%# Eval("Name")%> </a>
                                    </h3>
                                </div>
                                <!-- K2 Plugins: K2AfterDisplayTitle -->
                                <div class="catItemBody">
                                    <div class="ja-before-content">
                                        <div class="ja-before-inner clearfix">
                                            <div class="ja-social-toolbox-small">
                                                <div class="inner clearfix">
                                                    <!-- Plugins: AfterDisplayTitle -->
                                                </div>
                                            </div>
                                            <!-- Plugins: BeforeDisplayContent -->
                                        </div>
                                    </div>
                                    <!-- K2 Plugins: K2BeforeDisplayContent -->
                                    <!-- Item Image -->
                                    <div class="catItemImageBlock">
                                        <div class="deal-new-icon">
                                        </div>
                                        <span class="catItemImage"><a href='<%# "DetailProduct.aspx?idProduct="+Eval("ID") %>' title =' <%# Eval("Name")%>'>
                                            <img src='<%# "Images/ImageProduct/"+Eval("IMAGE")%>' alt='<%# Eval("Name")%>'
                                                style="width: 250px; height: auto;">
                                        </a></span>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="clr">
                                        </div>
                                    </div>
                                    <!-- Item introtext -->
                                    <%--    <div class="catItemIntroText">
                                Áo Thun Body Cổ Tim chất liệu co giãn, thiết kế trẻ trung, nam tính, giúp chàng
                                khoe trọn thể...
                                <div class="itemLinks">
                                    <div class="itemHitsTwitter">
                                        <div class="clr">
                                        </div>
                                    </div>
                                    <!-- Item social links -->
                                 
                                    <div class="clr">
                                    </div>
                                </div>
                            </div>--%>
                                    <div class="clr">
                                    </div>
                                    <!-- Plugins: AfterDisplayContent -->
                                    <!-- K2 Plugins: K2AfterDisplayContent -->
                                    <div id="lofdeals-detail-itemlist">
                                        <div class="saleoff-icon-itemlist" runat="Server" id="giamgia" visible="true">
                                            Giảm<br>
                                            <span> <%# Eval("Price_Discount")%> %</span>
                                        </div>
                                        <!-- Item extra fields -->
                                        <div class="price-buynow-itemlist">
                                            <div class="dealprice">
                                                <div>
                                                    <%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Sale").ToString()))%></div>
                                            </div>
                                            <div class="dealorig" id="giagoc" visible="true" runat="Server">
                                                <em>Giá gốc:&nbsp;</em><span><strike><%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Original").ToString()))%></strike></span>
                                                </div>
                                        </div>
                                        <div class="totalbought">
                                            <div class="bought">
                                                Số người mua</div> 
                                            <div class="bought-value">
                                                 <%# Eval("Quantity_Bought")%></div>
                                        </div>
                                      
                                        <asp:LinkButton ID="lbtnAdd" runat="server" OnClick="lbtnAdd_Click"
                                                        CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                      
                                       <%-- <a href="#">
                                            <img style="margin-left: 40px;" src="client/img_product/buy-now-button-image-yellow.png" /></a>--%>
                                    </div>
                                    <div class="clr">
                                    </div>
                                </div>
                                <div class="clr">
                                </div>
                                <div class="clr">
                                </div>                               
                                <div class="clr">
                                </div>
                                <!-- Plugins: AfterDisplay -->
                                <!-- K2 Plugins: K2AfterDisplay -->
                                <div class="clr">
                                </div>
                            </div>
                            <!-- End K2 Item Layout -->
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            </ContentTemplate>
            </asp:UpdatePanel>
       
    </div>
    <!-- /MODULE Home Dael Hot -->


</asp:Content>

