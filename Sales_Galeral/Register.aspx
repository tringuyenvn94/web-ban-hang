<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="client/css/StyleShowProduct.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           
    <%--   <asp:ScriptManager ID="ScriptManager2" runat="server" EnablePageMethods="true" />--%>
    <div style="height: auto; margin-bottom: 40px;">

        <div style="margin-bottom:40px; border-style: solid; border-width: 1px; margin: auto; margin-top: 50px;
            height: 700px; width: 800px; border-top-left-radius: 5px; border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px; -moz-border-radius-topright: 5px;">
            <div style="background-color: #1F292B; padding-left: 20px">
                <asp:Label ID="Label1" runat="server" Text="Đăng ký tài khoản" 
                    ForeColor="White" Font-Bold="True"
                    Font-Size="14pt"></asp:Label></div>
            <asp:MultiView ID="mtviewRegister" runat="server">
                <asp:View ID="viewInformationRegister" runat="server">
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
                                <asp:TextBox ID="txtUserName" runat="server" Columns="30" Height="25px" 
                                    onkeyup=" usernameChecker(this.value);" ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Yêu cầu nhập tên"
                                    ForeColor="Red" ControlToValidate="txtUserName" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="txtPass" runat="server" Columns="30" Height="25px" 
                                    TextMode="Password" ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Yêu cầu nhập mật khẩu"
                                    ForeColor="Red" ControlToValidate="txtPass" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <asp:Label ID="Label5" runat="server" Text="Xác nhận mật khẩu:" 
                                    Font-Bold="True"></asp:Label>
                            </li>
                            <li style="margin-left: 37px">
                                <asp:TextBox ID="txtConfirmPass" runat="server" Columns="30" Height="25px" 
                                    TextMode="Password" ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Yêu cầu nhập lại mật khẩu"
                                    ControlToValidate="txtConfirmPass" ForeColor="Red" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
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
                        <BotDetect:Captcha ID="SampleCaptcha" runat="server" ImageStyle="Jail" />
                        <ul style="margin-top: 0px">
                            <li>
                                <asp:TextBox ID="CaptchaCodeTextBox" runat="server" Height="25px" 
                                    ValidationGroup="regis" /></li>
                            <li style="margin-left: 20px">
                                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Phải nhập mã xác thực"
                                    ControlToValidate="CaptchaCodeTextBox" ForeColor="Red" 
                                    SetFocusOnError="True" ValidationGroup="regis"></asp:RequiredFieldValidator>
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
                                <asp:TextBox ID="txtName" runat="server" Columns="30" Height="25px" 
                                    ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phải nhập tên"
                                    ForeColor="Red" ControlToValidate="txtName" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <asp:Label ID="Label9" runat="server" Text="Giới tính" Font-Bold="True"></asp:Label>
                            </li>
                            <li style="margin-left: 85px">
                                <asp:RadioButton ID="rdbMale" runat="server" GroupName="Gender" Text="Nam" 
                                    Checked="True" ValidationGroup="regis" />
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RadioButton ID="rdbFemale" runat="server" GroupName="Gender" Text="Nữ" 
                                    ValidationGroup="regis" />
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <asp:Label ID="Label10" runat="server" Text="Số ĐT:" Font-Bold="True"></asp:Label>
                            </li>
                            <li style="margin-left: 92px">
                                <asp:TextBox ID="txtPhone" runat="server" Columns="30" Height="25px" 
                                    ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phải nhập số ĐT"
                                    ForeColor="Red" ControlToValidate="txtPhone" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
                            </li>
                            <li style="margin-left: -125px">
                          
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <asp:Label ID="Label11" runat="server" Text="Địa chỉ nhận hàng" Font-Bold="True"></asp:Label>
                            </li>
                            <li style="margin-left: 27px">
                                <asp:TextBox ID="txtAddress" runat="server" Columns="30" Height="25px" 
                                    ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Phải nhập địa chỉ"
                                    ForeColor="Red" ControlToValidate="txtAddress" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <asp:Label ID="Label12" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
                            </li>
                            <li style="margin-left: 94px">
                                <asp:TextBox ID="txtEmail" runat="server" Columns="30" Height="25px" 
                                    onkeyup=" emailChecker(this.value);" ValidationGroup="regis"></asp:TextBox>
                            </li>
                            <li style="margin-left: 20px">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Phải nhập Email"
                                    ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="True" 
                                    ValidationGroup="regis"></asp:RequiredFieldValidator>
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
                                <asp:Button ID="btnSubmit" runat="server"  CssClass="mouseButton" Text="Submit" 
                                    BackColor="#000000" BorderStyle="None"
                                    Font-Bold="True" ForeColor="White" Height="30px" Width="55px" 
                                    ValidationGroup="regis" onclick="btnSubmit_Click" />
                            </li>
                            
                                <li style="margin-left: 20px">
                                    <asp:Button ID="btnClear"  CssClass="mouseButton" runat="server" Text="Làm lại" 
                                        BackColor="#000000" BorderStyle="None"
                                        Font-Bold="True" ForeColor="White" Height="30px" Width="55px" 
                                        CausesValidation="False" onclick="btnClear_Click" />
                                </li>
                            
                        </ul>
                    </div>
                </asp:View>
                <!--End viewInformationRegister-->
                <asp:View ID="viewSuccessRegister" runat="server">
                    <div style="background-color: #E9E9E9; padding: 3px; padding-left: 20px">
                        <asp:Label ID="Label13" runat="server" Text="Hoàn tất đăng ký tài khoản !" Font-Size="10pt"
                            Font-Bold="True"></asp:Label>
                    </div>
                    <div style="margin-top: 10px; margin-left: 50px;">
                        <p>
                            Bạn đã đăng ký thành công,  
                            <asp:LinkButton ID="lkbtnHere" runat="server">click vào đây</asp:LinkButton>
                            để quay về Trang chủ
                        </p>
                    </div>
                </asp:View>
                <!--End viewSuccessRegister-->
            </asp:MultiView>
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
        
</asp:Content>

