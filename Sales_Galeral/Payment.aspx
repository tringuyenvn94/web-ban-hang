<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Payment.aspx.cs" Inherits="Payment" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <link href="client/css/StyleShowProduct.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="pnlRegis" runat="server">
        <img src="client/img_product/step1.png" style="margin-bottom: 20px;" />
        <div>
            <asp:Accordion ID="Accordion1" runat="server" SelectedIndex="0" HeaderCssClass="accordionHeader"
                HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent"
                FadeTransitions="false" FramesPerSecond="40" TransitionDuration="250" AutoSize="None"
                RequireOpenedPane="false" SuppressHeaderPostbacks="true">
                <Panes>
                    <asp:AccordionPane ID="accoPnlLogin" runat="server">
                        <Header>
                            <a href="" class="accordionLink">
                                <h4 style="margin-bottom: 20px; font-family: Arial; font-weight: bold; font-size: 1.2em;color:Blue;">
                                    Bạn đã có tài khoản? Xin mời đăng nhập!
                                </h4>
                            </a>
                        </Header>
                        <Content>
                            <table border="0" cellspacing="0" cellpadding="0" width="500px">
                                <tr>
                                    <td>
                                        User Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxUsername" Columns="25" runat="server" ValidationGroup="loginVLD" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn phải nhập User Name"
                                            Font-Bold="True" ControlToValidate="tbxUsername" ValidationGroup="loginVLD"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Password:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbxPassw" TextMode="Password" Columns="25" runat="server" ValidationGroup="loginVLD" />
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn phải nhập Password"
                                            Font-Bold="True" ControlToValidate="tbxPassw" ValidationGroup="loginVLD"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr style="margin-top:10px;">
                                    <td>
                                        <asp:Button OnClick="btnLogg_Click" ID="btnLogg" runat="server" CssClass="buttonlog" ValidationGroup="loginVLD" />
                                    </td>
                                    <td >
                                    <div style="margin-top:10px;">
                                        <asp:CheckBox ID="chkbxRMB" runat="server" Text="Remember Me" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </Content>
                    </asp:AccordionPane>
                    <asp:AccordionPane ID="AccordionPane1" runat="server">
                        <Header>
                            <a href="" class="accordionLink">
                                <h4 style="font-family: Arial; font-weight: bold; font-size: 1.2em;color:Blue;">
                                    Click vào đây nếu chưa có tài khoản
                                </h4>
                            </a>
                        </Header>
                        <Content>
                            <div style="height: auto; margin-bottom: 40px;">
                                <div style="margin-bottom: 40px; border-style: solid; border-width: 1px; margin: auto;
                                    margin-top: 50px; height: 700px; width: 800px; border-top-left-radius: 5px; border-top-right-radius: 5px;
                                    -moz-border-radius-topleft: 5px; -moz-border-radius-topright: 5px;">
                                    <div style="background-color: #1F292B; padding-left: 20px">
                                        <asp:Label ID="Label1" runat="server" Text="Đăng ký tài khoản" ForeColor="White"
                                            Font-Bold="True" Font-Size="14pt"></asp:Label></div>
                                 
                                            <div style="background-color: #E9E9E9; padding: 3px; padding-left: 20px">
                                                <asp:Label ID="lblAccountInfor" runat="server" Text="Thông tin tài khoản" Font-Size="10pt"
                                                    Font-Bold="True"></asp:Label>
                                            </div>
                                            <div id="regisaccount" style="margin-top: 10px; margin-left: 50px;">
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label3" runat="server" Text="Tên đăng nhập:" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 63px">
                                                        <asp:TextBox ID="txtUserName" runat="server" Columns="30" Height="25px" onkeyup=" usernameChecker(this.value);"
                                                            ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Yêu cầu nhập tên"
                                                            ForeColor="Red" ControlToValidate="txtUserName" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                    <li style="margin-left: -125px"><span id="spanAvailability"></span></li>
                                                </ul>
                                                <br />
                                                <hr style="width: 700px;" />
                                                <br />
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label4" runat="server" Text="Mật khẩu:" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 94px">
                                                        <asp:TextBox ID="txtPass" runat="server" Columns="30" Height="25px" TextMode="Password"
                                                            ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Yêu cầu nhập mật khẩu"
                                                            ForeColor="Red" ControlToValidate="txtPass" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label5" runat="server" Text="Xác nhận mật khẩu:" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 37px">
                                                        <asp:TextBox ID="txtConfirmPass" runat="server" Columns="30" Height="25px" TextMode="Password"
                                                            ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Yêu cầu nhập lại mật khẩu"
                                                            ControlToValidate="txtConfirmPass" ForeColor="Red" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                    <li style="margin-left: -125px">
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu xác thực sai"
                                                            ControlToCompare="txtPass" ControlToValidate="txtConfirmPass" ForeColor="Red"
                                                            SetFocusOnError="True" ValidationGroup="regis"></asp:CompareValidator>
                                                    </li>
                                                </ul>
                                                <br />
                                                <hr style="width: 700px;" />
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="Mã xác thực:" Font-Bold="True"></asp:Label>
                                                <br />
                                                <BotDetect:Captcha id="SampleCaptcha" runat="server" imagestyle="Jail" />
                                                <ul style="margin-top: 0px">
                                                    <li>
                                                        <asp:TextBox ID="CaptchaCodeTextBox" runat="server" Height="25px" ValidationGroup="regis" /></li>
                                                    <li style="margin-left: 20px">
                                                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Phải nhập mã xác thực"
                                                            ControlToValidate="CaptchaCodeTextBox" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                </ul>
                                                <br />
                                                <br />
                                            </div>
                                            <div style="background-color: #E9E9E9; padding: 3px; padding-left: 20px">
                                                <asp:Label ID="lblUserInfor" runat="server" Text="Thông tin cá nhân" Font-Size="10pt"
                                                    Font-Bold="True"></asp:Label>
                                            </div>
                                            <div id="inforuser" style="margin-top: 10px; margin-left: 50px;">
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label8" runat="server" Text="Tên:" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 104px">
                                                        <asp:TextBox ID="txtName" runat="server" Columns="30" Height="25px" ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Phải nhập tên"
                                                            ForeColor="Red" ControlToValidate="txtName" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label9" runat="server" Text="Giới tính" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 85px">
                                                        <asp:RadioButton ID="rdbMale" runat="server" GroupName="Gender" Text="Nam" Checked="True"
                                                            ValidationGroup="regis" />
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RadioButton ID="rdbFemale" runat="server" GroupName="Gender" Text="Nữ" ValidationGroup="regis" />
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label10" runat="server" Text="Số ĐT:" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 92px">
                                                        <asp:TextBox ID="txtPhone" runat="server" Columns="30" Height="25px" ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phải nhập số ĐT"
                                                            ForeColor="Red" ControlToValidate="txtPhone" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                    <li style="margin-left: -125px">

                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label11" runat="server" Text="Địa chỉ nhận hàng" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 89px">
                                                        <asp:TextBox ID="txtAddress" runat="server" Columns="30" Height="25px" ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator81" runat="server" ErrorMessage="Phải nhập địa chỉ"
                                                            ForeColor="Red" ControlToValidate="txtAddress" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li>
                                                        <asp:Label ID="Label12" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
                                                    </li>
                                                    <li style="margin-left: 94px">
                                                        <asp:TextBox ID="txtEmail" runat="server" Columns="30" Height="25px" onkeyup=" emailChecker(this.value);"
                                                            ValidationGroup="regis"></asp:TextBox>
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Phải nhập Email"
                                                            ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
                                                    </li>
                                                    <li style="margin-left: -125px">
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email không hợp lệ"
                                                            ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ForeColor="Red" SetFocusOnError="True" ValidationGroup="regis"></asp:RegularExpressionValidator>
                                                    </li>
                                                    <li style="margin-left: -125px"><span id="spanEmailAvailability"></span></li>
                                                </ul>
                                                <ul style="margin-left: 160px">
                                                    <li>
                                                        <asp:Button ID="btnSubmit" runat="server" CssClass="mouseButton" Text="Submit" BackColor="#000000"
                                                            BorderStyle="None" Font-Bold="True" ForeColor="White" Height="30px" Width="55px"
                                                            ValidationGroup="regis" OnClick="btnSubmit_Click" />
                                                    </li>
                                                    <li style="margin-left: 20px">
                                                        <asp:Button ID="btnClear" CssClass="mouseButton" runat="server" Text="Làm lại" BackColor="#000000"
                                                            BorderStyle="None" Font-Bold="True" ForeColor="White" Height="30px" Width="55px"
                                                            CausesValidation="False" OnClick="btnClear_Click" />
                                                    </li>
                                                </ul>
                                            </div>
                                 
                                 
                                </div>
                            </div>
                            <script type="text/javascript">
                                var usernameCheckerTimer;
                                var spanAvailability = $get("spanAvailability");
                                function usernameChecker(username) {
                                    clearTimeout(usernameCheckerTimer);
                                    if (username.length == 0)
                                        spanAvailability.innerHTML = "";
                                    else {
                                        spanAvailability.innerHTML = "<span style='color: #ccc;'>checking...</span>";
                                        usernameCheckerTimer = setTimeout("checkUsernameUsage('" + username + "');", 750);
                                    }
                                }

                                function checkUsernameUsage(username) {
                                    // initiate the ajax pagemethod call
                                    // upon completion, the OnSucceded callback will be executed
                                    PageMethods.IsUserAvailable(username, OnSucceeded);
                                }

                                // Callback function invoked on successful completion of the page method.
                                function OnSucceeded(result, userContext, methodName) {
                                    if (methodName == "IsUserAvailable") {
                                        if (result == true)
                                            spanAvailability.innerHTML = "<span style='color: DarkGreen;'>Available</span>";
                                        else
                                            spanAvailability.innerHTML = "<span style='color: Red;'>Unavailable</span>";
                                    }
                                }
                            </script>
                            <script type="text/javascript">
                                var emailCheckerTimer;
                                var spanEmailAvailability = $get("spanEmailAvailability");
                                function emailChecker(email) {
                                    clearTimeout(emailCheckerTimer);
                                    if (email.length == 0)
                                        spanEmailAvailability.innerHTML = "";
                                    else {
                                        spanEmailAvailability.innerHTML = "<span style='color: #ccc;'>checking...</span>";
                                        emailCheckerTimer = setTimeout("checkEmailUsage('" + email + "');", 750);
                                    }
                                }

                                function checkEmailUsage(email) {
                                    // initiate the ajax pagemethod call
                                    // upon completion, the OnSucceded callback will be executed
                                    PageMethods.IsEmailAvailable(email, OnSucceededEmail);
                                }

                                // Callback function invoked on successful completion of the page method.
                                function OnSucceededEmail(result, userContext, methodName) {
                                    if (methodName == "IsEmailAvailable") {
                                        if (result == true)
                                            spanEmailAvailability.innerHTML = "<span style='color: DarkGreen;'>Available</span>";
                                        else
                                            spanEmailAvailability.innerHTML = "<span style='color: Red;'>Unavailable</span>";
                                    }
                                }
                            </script>
                        </Content>
                    </asp:AccordionPane>
                </Panes>
            </asp:Accordion>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlPayment" runat="server">
        <img src="client/img_product/step2.png" style="margin-bottom: 20px;" />
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
            <asp:Label ID="Label2" runat="server" Text="Tổng tiền hàng:" Font-Bold="True"
                ForeColor="#333333"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTotalPrice" runat="server" CssClass="total-price"  Font-Bold="True" ForeColor="#5496B6"></asp:Label>       
    </div>
    <div style="clear:both;"></div>
    <h4 style="margin-bottom: 20px; font-family: Arial; font-weight: bold; font-size: 1.2em;color:Blue;">Vui lòng chọn một cách thanh toán</h4>
    <strong style="margin-left:10px;">Thanh Toán</strong>
    <ul>
    
    <li style="color:#FFFFFF; margin-top:10px;">
        <asp:RadioButtonList ID="rdobtList" runat="server" onselectedindexchanged="rdobtList_SelectedIndexChanged" 
           >
        </asp:RadioButtonList>
    </li>

    
    </ul>
      <div style=" margin-left: 728px; margin-top: 15px;">
            <asp:Button ID="btnContinuos" CssClass="mouseButton1" runat="server" 
                Text="Tiếp Tục" onclick="btnContinuos_Click"
              />
        </div>
    </asp:Panel>
</asp:Content>
