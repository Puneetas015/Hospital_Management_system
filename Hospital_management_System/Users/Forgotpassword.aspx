<%@ Page Title="ForgotPassword" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Forgotpassword.aspx.cs" Inherits="Hospital_management_System.Users.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="auth-wrapper">
        <div class="auth-card">
            <h1 class="auth-title">Forgot Password</h1>

            <div class="auth-field">
                <label for="txt_fpass_Email">Email</label>
                <asp:TextBox ID="txt_fpass_Email" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_fpass_mobile">Mobile</label>
                <asp:TextBox ID="txt_fpass_mobile" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_fpass_oldpass">Old Password</label>
                <asp:TextBox ID="txt_fpass_oldpass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-field">
                <label for="txt_fpass_newpass">New Password</label>
                <asp:TextBox ID="txt_fpass_newpass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="auth-actions">
                <asp:Button ID="btn_fpass" runat="server" Text="Reset Password" CssClass="btn btn-modern-primary" OnClick="btn_fpass_Click" />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="action-link action-edit" OnClick="LinkButton1_Click">Sign In</asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>
