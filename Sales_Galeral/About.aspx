<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;"></div>
    <p style="text-align: center;">
        <span style="font-size:24pt; color: #0066cc;">
            <strong>
            <asp:Label ID="lblTitle_About" runat="server" Text="Label" Font-Bold="True" Font-Size="22"></asp:Label>
            </strong>
        </span>
    </p>
    <div>
        <asp:Label ID="lblDetail_About" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>

