<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DetailProduct.aspx.cs" Inherits="DetailProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <script src="client/js/jquery.zoom.js" type="text/javascript"></script>
    <link href="client/css/ZoomStyle.css" rel="stylesheet" type="text/css" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <script type="text/javascript">
      $(document).ready(function () {
          $('#ex1').zoom();
          $('#ex2').zoom({ grab: true });
      });
    </script>
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
    <div class="itemBody">
        <div class="itemFullText">
            <div id="center_column" class="center_column">
                <div style="float: left; width: 700px;">
            <p id="detail" style="text-align: justify;">
                <strong><span style="font-size: 12pt;"><strong>THÔNG TIN CHI TIẾT</strong> </span>
                </strong>
            </p>
             <p id="messageStatus" runat="Server" visible="false" style="background-color: #68C5C3;
                margin: 20px auto; width: 685px;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="White" Font-Size="14pt" Text="" />
            </p>
            <div id="primary_block" class="clearfix">
                <!-- right infos-->
                <div id="pb-right-column">
                    <!-- product img-->
                    <div id="image-block" class="bordercolor">
                    <span class='zoom' id='ex1'>
                        <asp:Image ID="imgProduct" runat="server" CssClass="jqzoom" Width="304" Height="304" />
                      <%--  <img src="Images/ImageProduct/image3.jpg" class="jqzoom" alt="images/1-thickbox_default.jpg"
                            id="bigpic" width="304" height="304" />--%>
                    </span>
                    </div>
                </div>
                <!-- /right infos-->
                <!-- left infos-->
                <div id="pb-left-column">
             
                        <asp:Label ID="lblNameProduct" CssClass="lblnameproduct" runat="server" Text="Demo asvcdsvsd sdvsdv dvsd" ></asp:Label>

                    <!-- add to cart form-->
                    <div id="buy_block" class="bordercolor" action="" method="post">
                        <!-- prices -->
                        <div class="price bordercolor">
                            <span class="our_price_display">
                                <asp:Label ID="our_price_display" runat="server" CssClass="pricecolor" Text="$116.06"></asp:Label>
                           <%-- <span id="our_price_display" class="pricecolor">$116.06</span>--%>
                            </span>
                            <p id="add_to_cart">
                  <%--              <a class="exclusive" href="">Add to cart</a>--%>
                                <asp:LinkButton ID="lbtnAdd" CssClass="exclusive" runat="server" 
                                    onclick="lbtnAdd_Click">Thêm vào Cart</asp:LinkButton>
                            </p>
                            <p id="quantity_wanted_p">
                                <asp:TextBox ID="tbxQtt" runat="server" CssClass="text" MaxLength="3" Width="25px">1</asp:TextBox>
                              <%--  <input type="text" name="qty" id="quantity_wanted" class="text" value="1" size="2"
                                    maxlength="3" />--%>
                                <label>
                                    Số lượng:</label>
                            </p>
                        </div>
                        <div class="clear">
                        </div>
                        <div id="short_description_block" class="bordercolor">
                            <div id="short_description_content" class="rte align_justify">
                                <p>
                                    <asp:Label ID="lblDescription" runat="server" Text="Precious metals have always been a detector of prosperity and high social rank.
                                    Just remember that jewelry was always a very inaccessible good for ordinary people.
                                    Only kings and emperors, priests and pirates could own the jewelry. Ancients believed
                                    that precious stones have always had some magical power that is why jewelry was
                                    so rare and prohibitive. Probably we have inherited this weakness."></asp:Label>
                                </p>
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
                                <asp:Label ID="lblDetails" runat="server" Text=" Precious metals have always been a detector of prosperity and high social rank.
                                Just remember that jewelry was always a very inaccessible good for ordinary people.
                                Only kings and emperors, priests and pirates could own the jewelry. Ancients believed
                                that precious stones have always had some magical power that is why jewelry was
                                so rare and prohibitive. Probably we have inherited this weakness."></asp:Label>
                               
                                </p>
                        
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
				<a href="ShoppingCart.aspx">Cart</a>
			</h4>
			<div class="block_content">
				<!-- block list of products -->
				<div id="cart_block_list" class="expanded">
					<p  id="cart_block_no_products">
                        <asp:Label ID="lblQTtCart" runat="server" Text="Label"></asp:Label>
                    </p>
					
					<div class="cart-prices">						
						<div class="cart-prices-block">
                            <asp:Label ID="cart_block_total" runat="server" Text="0,00đ"></asp:Label>
							<%--<span id="cart_block_total" class="price">$0.00</span>--%>
							<span>Total</span>
						</div>
					</div>
					<p id="cart-buttons">
						<a href="ShoppingCart.aspx" class="button_mini" title="Cart">Cart</a>
						<a href="Payment.aspx" id="button_order_cart" class="exclusive" title="Check out"><span></span>Check out</a>
					</p>
				</div><!-- /block list of products -->
			</div>
		</div><!-- /MODULE Block cart -->

		<div id="new-products_block_right" class="block products_block">
			<h4><a href="" title="New products">Sản phẩm mới</a></h4>
			<div class="block_content">
				<ul>
                        <asp:datalist runat="Server" ID="dtlNewPrd">
                            <ItemTemplate>
                                   <li class="bordercolor" style="border-color: #DDDDDD !important; border-style: solid; border-width: 1px 0 0; clear: both; margin: 0;">
						                <a class="products_block_img bordercolor" href="" title="">
							                <img style=" width: 65px; height: 50px;"src='<%# "Images/ImageProduct/"+Eval("IMAGE")%>' title =' <%# Eval("Name")%>'/>
						                </a>
						                <div>
							                <h5><a class="product_link" href="<%# "DetailProduct.aspx?idProduct="+Eval("ID") %>" title=" <%# Eval("Name")%>"> <%# Eval("Name")%></a></h5>
							                <p><%# FunctionLibrary.DisplayPrice(double.Parse(DataBinder.Eval(Container.DataItem, "Price_Sale").ToString()))%></p>
						                </div>
					             </li>
                            </ItemTemplate>
                        </asp:datalist>					
				</ul>
				<a href="TypeProduct.aspx?type=1" title="All new products" class="button_large">All new products</a>	
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
