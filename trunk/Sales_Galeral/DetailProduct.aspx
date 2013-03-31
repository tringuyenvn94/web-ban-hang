<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DetailProduct.aspx.cs" Inherits="DetailProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="itemBody">
        <div class="itemFullText">
            <div id="center_column" class="center_column">
                <div style="float: left; width: 700px;">
            <p id="detail" style="text-align: justify;">
                <strong><span style="font-size: 12pt;"><strong>THÔNG TIN CHI TIẾT</strong> </span>
                </strong>
            </p>
            <div id="primary_block" class="clearfix">
                <!-- right infos-->
                <div id="pb-right-column">
                    <!-- product img-->
                    <div id="image-block" class="bordercolor">
                        <img src="Images/ImageProduct/image3.jpg" class="jqzoom" alt="images/1-thickbox_default.jpg"
                            id="bigpic" width="304" height="304" />
                    </div>
                </div>
                <!-- /right infos-->
                <!-- left infos-->
                <div id="pb-left-column">
                    <h1>
                        10k White Gold Black and White Diamond Ring</h1>
                    <!-- add to cart form-->
                    <div id="buy_block" class="bordercolor" action="" method="post">
                        <!-- prices -->
                        <div class="price bordercolor">
                            <span class="our_price_display"><span id="our_price_display" class="pricecolor">$116.06</span>
                            </span>
                            <p id="add_to_cart">
                                <a class="exclusive" href="">Add to cart</a>
                            </p>
                            <p id="quantity_wanted_p">
                                <input type="text" name="qty" id="quantity_wanted" class="text" value="1" size="2"
                                    maxlength="3" />
                                <label>
                                    Quantity:</label>
                            </p>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="short_description_block" class="bordercolor">
                            <div id="short_description_content" class="rte align_justify">
                                <p>
                                    Precious metals have always been a detector of prosperity and high social rank.
                                    Just remember that jewelry was always a very inaccessible good for ordinary people.
                                    Only kings and emperors, priests and pirates could own the jewelry. Ancients believed
                                    that precious stones have always had some magical power that is why jewelry was
                                    so rare and prohibitive. Probably we have inherited this weakness.</p>
                            </div>
                            <div class="clearblock">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /left infos-->
            </div>
            <!-- End #primary-->
            <div id="more_info_block">
                <ul id="more_info_tabs" class="idTabs idTabsShort ">
                    <li><a id="more_info_tab_more_info" class="selected" href="#idTab1">More info</a>
                    </li>
                </ul>
                <div id="more_info_sheets" class="bordercolor bgcolor">
                    <div id="idTab1" class="">
                        <div>
                            <p>
                                Precious metals have always been a detector of prosperity and high social rank.
                                Just remember that jewelry was always a very inaccessible good for ordinary people.
                                Only kings and emperors, priests and pirates could own the jewelry. Ancients believed
                                that precious stones have always had some magical power that is why jewelry was
                                so rare and prohibitive. Probably we have inherited this weakness.</p>
                            <p>
                                Just remember that jewelry was always a very inaccessible good for ordinary people.
                                Only kings and emperors, priests and pirates could own the jewelry. Ancients believed
                                that precious stones have always had some magical power that is why jewelry was
                                so rare and prohibitive. There are two types of jewelry - stones and metals. Obviously
                                both of them are unique because of their appearance.</p>
                        </div>
                    </div>
                </div>
            </div>
            <!--End  #more info-->
                    <p>
            </p>
            <p>
                <u><span style="font-size: 18px;"><strong>THÔNG TIN DOANH NGHIỆP</strong> </span>
                </u>
            </p>
            <p>
                <strong>Cửa hàng ThaiDeal</strong>
            </p>
            <p>
                <strong>Thái Nguyên:</strong> số 7, tổ 6, ngõ 105 đường Lương Ngọc Quyến, Thái Nguyên |<strong>Hotline:</strong> 0983.165.163
            </p>
            <p></p>
                    <div style="height: 380px; background-color:#E5E3DF; overflow: hidden; position: relative; width: 400px; background: none repeat scroll 0 0 #FFFFFF;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);">
                    <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0"
                        marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=210351912700930860644.0004d933b9683c145bde9&amp;ie=UTF8&amp;ll=21.595954,105.824436&amp;spn=0,0&amp;t=m&amp;iwloc=0004d933bd91208ca46f5&amp;output=embed">
                    </iframe>
                    <br />
                    <small>Xem <a href="https://maps.google.com/maps/ms?msa=0&amp;msid=210351912700930860644.0004d933b9683c145bde9&amp;ie=UTF8&amp;ll=21.595954,105.824436&amp;spn=0,0&amp;t=m&amp;iwloc=0004d933bd91208ca46f5&amp;source=embed"
                        style="color: #0000FF; text-align: left">Thai Deal</a> ở bản đồ lớn hơn</small>
                        </div>

            </div>
      
        	<div id="right_column" class="column">
		<!-- MODULE Block cart -->
		<div id="cart_block" class="block exclusive">
			<h4>
				<a href="">Cart</a>
			</h4>
			<div class="block_content">
				<!-- block list of products -->
				<div id="cart_block_list" class="expanded">
					<p  id="cart_block_no_products">No products</p>
					
					<div class="cart-prices">
						<div class="cart-prices-block">
							<span id="cart_block_shipping_cost" class="price">$0.00</span>
							<span>Shipping</span>
						</div>
						<div class="cart-prices-block">
							<span id="cart_block_total" class="price">$0.00</span>
							<span>Total</span>
						</div>
					</div>
					<p id="cart-buttons">
						<a href="" class="button_mini" title="Cart">Cart</a>
						<a href="" id="button_order_cart" class="exclusive" title="Check out"><span></span>Check out</a>
					</p>
				</div><!-- /block list of products -->
			</div>
		</div><!-- /MODULE Block cart -->

		<div id="new-products_block_right" class="block products_block">
			<h4><a href="" title="New products">New products</a></h4>
			<div class="block_content">
				<ul>
					<li class="bordercolor">
						<a class="products_block_img bordercolor" href="" title="">
							<img src="images/1-small_default.jpg" alt="" />
						</a>
						<div>
							<h5><a class="product_link" href="" title="10k White Gold Black and White Diamond Ring">10k White Gold Black...</a></h5>
							<p><a class="product_descr" href="" title="&lt;p&gt;Precious metals..."> Precious metals have always been a...</a></p>
						</div>
					</li>
					<li class="bordercolor">
						<a class="products_block_img bordercolor" href="" title=""><img src="images/7-small_default.jpg" alt="" /></a>
						<div>
							<h5><a class="product_link" href="" title="14k Two Tone Gold 6.0mm Wedding Band">14k Two Tone Gold...</a></h5>
							<p><a class="product_descr" href="" title="Just remember that jewelry...">Just remember that jewelry was always...</a></p>
						</div>
					</li>
					
					<li class="bordercolor">
						<h5><a class="product_link" href="" title="14k White Gold Diamond Sapphire Ring">14k White Gold Diamond...</a></h5>
						<p><a class="product_descr" href="" title="&lt;p&gt;Only kings and..."> Only kings and emperors, priests and...</a></p>
					</li>
					<li class="bordercolor">
						<h5><a class="product_link" href="" title="14K White Gold Diamond Wedding Band">14K White Gold Diamond...</a></h5>
						<p><a class="product_descr" href="" title="Ancients believed that...">Ancients believed that precious...</a></p>
					</li>
				</ul>
				<a href="" title="All new products" class="button_large">All new products</a>	
			</div>
		</div>
	</div>

             </div><!--End #center column-->
        </div>
        <!--End .itemFullText-->
        <div style="clear: both;"></div>
        
      
    </div>
    <!--End .itemBody-->
</asp:Content>
