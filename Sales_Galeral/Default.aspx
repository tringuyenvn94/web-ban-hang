<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<%--<div style=" background: none repeat scroll 0 0 #6A9FC7;border: 1px solid #4F504F;  border-radius: 5px 5px 5px 5px;
    bottom: 120px;   color: white;  font-family: arial;  font-size: 13px;  font-weight: bold;  height: 35x;   position: fixed;  right: 8px;
    text-align: center; width: 130px; padding: 5px;" clientidmode="Static" runat="Server" id="thongbao">
    Thêm sản phẩm vào <a href="ShoppingCart.aspx" style="font-family: arial; color: white;
    font-size: 13px;
    font-weight: bold;">Cart</a> thành công
</div>--%>

    <script type="text/javascript" src="client/js/nivo.slider.js"></script>
    <div id="tmnivoslider">
        <div id="slider">
            <a href="">
                <img src="client/slides/slide_00.jpg" alt="" title="#htmlcaption1" /></a> <a href="">
                    <img src="client/slides/slide_01.jpg" alt="" title="#htmlcaption2" /></a>
            <a href="">
                <img src="client/slides/slide_02.jpg" alt="" title="#htmlcaption3" /></a>
        </div>
        <div id="htmlcaption1" class="nivo-html-caption">
            <h2>
                best</h2>
            <h3>
                prices online</h3>
            <h4>
                guaranteed</h4>
            <h5>
            </h5>
            <a class="slide_btn" href="">click for details</a>
        </div>
        <div id="htmlcaption2" class="nivo-html-caption">
            <h2>
                best</h2>
            <h3>
                prices online</h3>
            <h4>
                guaranteed</h4>
            <h5>
            </h5>
            <a class="slide_btn" href="">click for details</a>
        </div>
        <div id="htmlcaption3" class="nivo-html-caption">
            <h2>
                best</h2>
            <h3>
                prices online</h3>
            <h4>
                guaranteed</h4>
            <h5>
            </h5>
            <a class="slide_btn" href="">click for details</a>
        </div>
    </div>
    <script type="text/javascript">

        jQuery(window).load(function () {
            jQuery('#slider').nivoSlider({
                effect: 'fold', //Specify sets like: 'fold,fade,sliceDown'
                slices: 10,
                animSpeed: 500, //Slide transition speed
                pauseTime: 5000,
                startSlide: 0, //Set starting Slide (0 index)
                directionNav: false, //Next & Prev
                directionNavHide: false, //Only show on hover
                controlNav: true, //1,2,3...
                controlNavThumbs: false, //Use thumbnails for Control Nav
                controlNavThumbsFromRel: false, //Use image rel for thumbs
                controlNavThumbsSearch: '.jpg', //Replace this with...
                controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
                keyboardNav: true, //Use left & right arrows
                pauseOnHover: true, //Stop animation while hovering
                manualAdvance: false, //Force manual transitions
                captionOpacity: 1.0, //Universal caption opacity
                beforeChange: function () { },
                afterChange: function () { },
                slideshowEnd: function () { } //Triggers after all slides have been shown
            });
        });

    </script>
    <!-- MODULE Home Dael Hot -->
    <div id="featured_products" style="padding-bottom:10px;">
        <h4 style="color:Yellow;">
            Deal Hot
        </h4>
        <div class="block_content" style="margin-left: -10px; margin-top: 10px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                     <asp:DataList ID="dtlHotProduct" runat="server" Width="970px" RepeatColumns="3" CellSpacing="10">
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
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="clr">
                                                </div>
                                            </div>
                                
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
                                                            <%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Sale").ToString()))%>
                                                        </div>
                                                    </div>
                                                    <div class="dealorig" id="giagoc" runat="Server">
                                                        <em>Giá gốc:&nbsp;</em><span><strike><%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Original").ToString()))%></strike></span></div>
                                                </div>
                                                <div class="totalbought">
                                                    <div class="bought">
                                                        Số người mua</div> 
                                                    <div class="bought-value">
                                                         <%# Eval("Quantity_Bought")%>
                                                    </div>
                                                </div>
                                                <asp:LinkButton ID="lbtnAdd" runat="server" OnClick="lbtnAdd_Click" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                            </div>
                                            <div class="clr"></div>
                                        </div>
                                        <div class="clr"></div>
                                        <div class="clr"></div>                               
                                        <div class="clr"></div>
                                        <!-- Plugins: AfterDisplay -->
                                        <!-- K2 Plugins: K2AfterDisplay -->
                                        <div class="clr"></div>
                                    </div>
                                    <!-- End K2 Item Layout -->
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- /MODULE Home Dael Hot -->
    <!-- MODULE Home Deal New -->
    <div id="new_product" style="padding-bottom:10px;">
        <h4 style="color:Aqua;">
            Deal New
        </h4>
        <div class="block_content" style="margin-left: -10px; margin-top: 10px;">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                     <asp:DataList ID="dtlDealNew" runat="server" Width="970px" RepeatColumns="3" CellSpacing="10">
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
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="clr">
                                                </div>
                                            </div>
                                            <!-- Item introtext -->
                                 
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
                                                    <div class="dealorig" id="giagoc" runat="Server">
                                                        <em>Giá gốc:&nbsp;</em><span><strike><%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Original").ToString()))%></strike></span></div>
                                                </div>
                                                <div class="totalbought">
                                                    <div class="bought">
                                                        Số người mua
                                                    </div> 
                                                    <div class="bought-value">
                                                         <%# Eval("Quantity_Bought")%>
                                                    </div>
                                                </div>
                                                <asp:LinkButton ID="lbtnAdd"  runat="server" OnClick="lbtnAdd_Click" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                            </div>
                                            <div class="clr"></div>
                                        </div>
                                        <div class="clr"></div>
                                        <div class="clr"></div>                               
                                        <div class="clr"></div>
                                        <!-- Plugins: AfterDisplay -->
                                        <!-- K2 Plugins: K2AfterDisplay -->
                                        <div class="clr"></div>
                                    </div>
                                    <!-- End K2 Item Layout -->
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- /MODULE Home Featured Products -->
    <!-- MODULE Home San Pham Thuong -->
    <div id="new_product" style="padding: 0">
        <h4 style="color:Lime;">
            Sản phẩm bán chạy
        </h4>
        <div class="block_content" style="margin-left: -10px; margin-top: 10px;">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                     <asp:DataList ID="dtlSanPhamThuong" runat="server" Width="970px" RepeatColumns="3" CellSpacing="10">
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
                                                    <div class="dealorig" id="giagoc" runat="Server">
                                                        <em>Giá gốc:&nbsp;</em><span><strike><%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Original").ToString()))%></strike></span></div>
                                                </div>
                                                <div class="totalbought">
                                                    <div class="bought">
                                                        Số người mua
                                                    </div> 
                                                    <div class="bought-value">
                                                         <%# Eval("Quantity_Bought")%>
                                                    </div>
                                                </div>
                                                <asp:LinkButton ID="lbtnAdd" runat="server" OnClick="lbtnAdd_Click" CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                            </div>
                                            <div class="clr"></div>
                                        </div>
                                        <div class="clr"></div>
                                        <div class="clr"></div>                               
                                        <div class="clr"></div>
                                        <!-- Plugins: AfterDisplay -->
                                        <!-- K2 Plugins: K2AfterDisplay -->
                                        <div class="clr"></div>
                                    </div>
                                    <!-- End K2 Item Layout -->
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <!-- /MODULE Home San Pham Thuong -->
</asp:Content>
