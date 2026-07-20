<%@ Page Title="UpdateAppoinment" Language="C#" AutoEventWireup="true" MasterPageFile="~/Users/usermaster.Master" CodeBehind="UpdateAppoinment.aspx.cs" Inherits="Hospital_management_System.Users.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-appointments-page">

        <!-- Edit card: only rendered/visible once a row is selected from the list below -->
        <asp:Panel ID="Panel_UpdateForm" runat="server" Visible="false" CssClass="edit-card">
            <h3 class="card-heading">Update an Appointment</h3>
            <div class="edit-card-grid">
                <asp:DropDownList ID="DropDownList_Section" class="form-control mb-3" runat="server">
                    <asp:ListItem Value="Neurology">Neurology</asp:ListItem>
                    <asp:ListItem Value="Dentistry">Dentistry</asp:ListItem>
                    <asp:ListItem Value="Cardiology">Cardiology</asp:ListItem>
                    <asp:ListItem Value="Pediatrics">Pediatrics</asp:ListItem>
                    <asp:ListItem Value="Pulmonolog">Pulmonolog</asp:ListItem>
                    <asp:ListItem Value="Ophthalmolog">Ophthalmolog</asp:ListItem>
                    <asp:ListItem Value="Diagnostics">Diagnostics</asp:ListItem>
                </asp:DropDownList>

                <asp:TextBox ID="txt_Appoint_name" placeholder="Name" class="form-control mb-3" runat="server"></asp:TextBox>

                <asp:DropDownList ID="DropDownList_gender" class="form-control mb-3" runat="server">
                    <asp:ListItem Value="Gender">Gender</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>

                <asp:TextBox ID="txt_Apoint_Mobile" class="form-control mb-3" placeholder="Phone" runat="server"></asp:TextBox>

                <asp:TextBox ID="txt_Apoint_Email" class="form-control mb-3" placeholder="Email" runat="server"></asp:TextBox>

                <asp:TextBox ID="datepicke" class="form-control date mb-3" placeholder="Select Date (dd/MM/yyyy)" runat="server"></asp:TextBox>
            </div>

            <!-- Form ke andar real Update database button -->
            <asp:Button ID="btn_SaveChanges" runat="server" Text="Save Changes" CssClass="btn btn-modern-primary mt-2" OnClick="btn_Appointmnet_Update_Submit_Click" />
        </asp:Panel>

        <!-- Appointment list card -->
        <div class="list-card">
            <h3 class="card-heading">Appointment List</h3>
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" CssClass="modern-grid" DataKeyNames="AID" EnableModelValidation="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" AutoGenerateColumns="False" CellPadding="0" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Section" HeaderText="Section" SortExpression="Section" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Date" />

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <!-- CommandName="Select" se direct Form open karne ka system active hoga -->
                                <asp:LinkButton ID="lnkUpdate" runat="server" Text="Edit" CssClass="action-link action-edit" CommandName="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CssClass="action-link action-delete" OnClick="lnkDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this appointment?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
