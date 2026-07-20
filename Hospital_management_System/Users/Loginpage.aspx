<%@ Page Title="Loginpage" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="Hospital_management_System.Users.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="auth-wrapper">
        <div class="auth-card">
            <h1 class="auth-title">Sign In</h1>

            <div class="auth-field">
                <label for="txt_login_username">Username</label>
                <asp:TextBox ID="txt_login_username" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_login_pass">Password</label>
                <asp:TextBox ID="txt_login_pass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-meta-row">
                <span><asp:CheckBox ID="CheckBox1" runat="server" /> Remember me</span>
            </div>

            <div class="auth-actions">
                <asp:Button ID="btn_login_b" runat="server" Text="Login" CssClass="btn btn-modern-primary" OnClick="btn_login_b_Click" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="action-link action-edit" OnClick="LinkButton1_Click">Sign Up</asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>
