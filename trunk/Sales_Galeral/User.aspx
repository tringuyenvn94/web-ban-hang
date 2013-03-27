<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="client/css/StyleShowProduct.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div style="border-left: 1px solid white; width: 600px; position: relative; left: 20px;
                                        top: 10px;">
                                        <div style="margin-left: 60px">
                                            <div style="background-color: #6A9FC7; border-top-left-radius: 5px; border-top-right-radius: 5px;
                                                -moz-border-radius-topleft: 5px; -moz-border-radius-topright: 5px; padding-left: 20px;">
                                                <asp:Label ID="Label2" runat="server" Text="Thông tin của tôi" Font-Bold="True" Font-Size="14pt"
                                                    ForeColor="White"></asp:Label>
                                            </div>
                                            <div style="background-color: #E9E9E9; padding: 3px; padding-left: 20px">
                                                <asp:Label ID="Label4" runat="server" Text="Change Password" Font-Size="10" Font-Bold="True"></asp:Label>
                   
                                                <asp:Label ID="lblMessErrorGetPass" runat="server" ForeColor="Red" 
                                                    Visible="False"></asp:Label>
                   
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" 
                                                    ValidationGroup="update" />
                   
                                            </div>
                                            <div id="regisaccount">
                                            <ul style="margin-top: 20px">
                                                <li>
                                                    <asp:Label ID="Label5" runat="server" Text="Old Password" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 51px">
                                                    <asp:TextBox ID="tbxOldPassword" runat="server" TextMode="Password" 
                                                        Height="25px" ValidationGroup="update"></asp:TextBox>
                                                </li>
                                                <li>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ErrorMessage="Old Password Is Missing" Display="Dynamic" ForeColor="Red" 
                                                         ControlToValidate="tbxOldPassword" ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                                </li>
                   
                                            </ul>
                                            <ul style="margin-top: 10px">
                                                <li>
                                                    <asp:Label ID="Label6" runat="server" Text="New Password" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 45px">
                                                    <asp:TextBox ID="tbxNewPass" runat="server" TextMode="Password" Height="25px" 
                                                        ValidationGroup="update"></asp:TextBox>
                         
                                                </li>
                                                <li style="margin-left: 10px">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ControlToValidate="tbxNewPass" Display="Dynamic" 
                                                    ErrorMessage="New Password Is Missing" ForeColor="Red" 
                                                        ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                                </li>
                                                <li style="margin-left: 0px;">
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="New Password confirm not equal"
                                                                ControlToCompare="tbxNewPass" ForeColor="Red"
                                                                SetFocusOnError="True" ControlToValidate="tbxConfirm" Display="Dynamic" 
                                                                ValidationGroup="update">(*)</asp:CompareValidator>
                                                        </li>
                   
                                            </ul>
                                            <ul style="margin-top: 10px">
                                                <li>
                                                    <asp:Label ID="Label7" runat="server" Text="Confirm Password" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 25px">
                                                    <asp:TextBox ID="tbxConfirm" runat="server" TextMode="Password" Height="25px" 
                                                        ValidationGroup="update"></asp:TextBox>
                                                </li>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ControlToValidate="tbxConfirm" Display="Dynamic" 
                                                    ErrorMessage="Confirm Pass Is Missing" ForeColor="Red" 
                                                        ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                            </ul>
                                            <div style="background-color: #E9E9E9; padding: 3px; padding-left: 20px; margin-top: 30px">
                                                <asp:Label ID="Label8" runat="server" Text="Change User Information" Font-Size="10"
                                                    Font-Bold="True"></asp:Label>
                                            </div>
                                            <ul style="margin-top: 20px">
                                                <li>
                                                    <asp:Label ID="Label9" runat="server" Text="Name:" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 36px">
                                                    <asp:TextBox ID="tbxName" runat="server" Columns="30" Height="25px" 
                                                        ValidationGroup="update"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ControlToValidate="tbxName" Display="Dynamic" 
                                                    ErrorMessage="Name Is Missing" ForeColor="Red" ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="margin-top: 10px">
                                                <li>
                                                    <asp:Label ID="Label10" runat="server" Text="Gender:" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 29px">
                                                    <asp:RadioButton ID="rdbMale" runat="server" GroupName="Gender" Text="Male" 
                                                        Checked="True" ValidationGroup="update" />
                                                </li>
                                                <li style="margin-left: 20px">
                                                    <asp:RadioButton ID="rdbFemale" runat="server" GroupName="Gender" Text="Female" 
                                                        ValidationGroup="update" />
                                                </li>
                                            </ul>
                                            <ul style="margin-top: 10px">
                                                <li>
                                                    <asp:Label ID="Label11" runat="server" Text="Phone:" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 32px">
                                                    <asp:TextBox ID="tbxPhone" runat="server" Height="25px" 
                                                        ValidationGroup="update"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                    ControlToValidate="tbxPhone" Display="Dynamic" 
                                                    ErrorMessage="Phone Is Missing" ForeColor="Red" ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="margin-top: 10px">
                                                <li>
                                                    <asp:Label ID="Label12" runat="server" Text="Address:" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 20px">
                                                    <asp:TextBox ID="tbxAddress" runat="server" Rows="5" Columns="5"
                                                        TextMode="MultiLine" ValidationGroup="update"></asp:TextBox>
                      
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                    ControlToValidate="tbxAddress" Display="Dynamic" 
                                                    ErrorMessage="Phone Is Missing" ForeColor="Red" ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                                </li>
                                            </ul>
                                            <ul style="margin-top: 10px">
                                                <li>
                                                    <asp:Label ID="Label13" runat="server" Text="Email:" Font-Bold="True"></asp:Label>
                                                </li>
                                                <li style="margin-left: 37px">
                                                    <asp:TextBox ID="tbxEmail" runat="server" Columns="30" Height="25px" 
                                                        onkeyup=" emailChecker(this.value);" ValidationGroup="update"></asp:TextBox>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                    ControlToValidate="tbxEmail" Display="Dynamic" 
                                                    ErrorMessage="Phone Is Missing" ForeColor="Red" ValidationGroup="update">(*)</asp:RequiredFieldValidator>
                                                </li>
                                                <li style="margin-left: -125px"><span id="spanEmailAvailability"></span></li>
                                            </ul>
                                            <ul style="margin-left: 175px; margin-top: 10px">
                                                <li>
                                                    <asp:Button ID="btnSubmit" CssClass="mouseButton" runat="server" Text="Submit" 
                                                        BackColor="#000000" BorderStyle="None"
                                                        Font-Bold="True" ForeColor="White" Height="30px" Width="55px" 
                                                        onclick="btnSubmit_Click" ValidationGroup="update" />
                                                </li>

                                                <li style="margin-left: 20px">
                                                    <asp:Button ID="btnClear" CssClass="mouseButton" runat="server" Text="Clear" BackColor="#000000" BorderStyle="None"
                                                        Font-Bold="True" ForeColor="White" Height="30px" Width="55px" />
                                                </li>
                                            </ul>
                                            </div>
                                        </div>
                                    </div>

</asp:Content>

