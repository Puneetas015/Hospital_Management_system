<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Hospital_management_System.Users.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="auth-wrapper">
        <div class="auth-card">
            <h1 class="auth-title">Sign Up</h1>

            <p class="auth-user-id">Your new user ID: <asp:Label ID="lbl_rid" runat="server" Text="Label"></asp:Label></p>

            <div class="auth-field">
                <label for="txt_signup_username">Username</label>
                <asp:TextBox ID="txt_signup_username" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_signup_email">Email</label>
                <asp:TextBox ID="txt_signup_email" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_signup_mobile">Mobile No</label>
                <asp:TextBox ID="txt_signup_mobile" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_signup_pass">Password</label>
                <asp:TextBox ID="txt_signup_pass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_signup_cpass">Re-enter Password</label>
                <asp:TextBox ID="txt_signup_cpass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-meta-row">
                <span><asp:CheckBox ID="CheckBox1" runat="server" /> Remember me</span>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="action-link action-edit" OnClick="LinkButton1_Click">Sign In</asp:LinkButton>
            </div>

            <div class="auth-actions">
                <asp:Button ID="btn_login_b" runat="server" Text="Registration" CssClass="btn btn-modern-primary" OnClick="btn_login_b_Click" />
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="action-link action-edit" OnClick="LinkButton2_Click">Forgot Password</asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>
