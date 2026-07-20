<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Users/usermaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Hospital_management_System.Users.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Dark Mode Adaptability Layer Injection -->
    <style>
        .w3-contact h3, .w3-contact h4, .w3-contact h5, .w3-contact h6, .w3-contact label, .w3-contact p {
            color: inherit !important;
        }
        .w3-contact {
            color: var(--text-color, #333);
        }
        .wthree-cicon span {
            color: #007bff;
        }
        
        /* Default Light Mode State */
        .contact-detail-header {
            color: #007bff !important;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* Pure Dark Mode Override - Force Absolutely Everything to Crisp White */
        /* Note: Agar theme active hone par top wrapper element par body me '.dark' apply hota ho, toh bas .dark-mode ko .dark se replace kar lena */
        .dark-mode .w3-contact,
        .dark-mode .w3-contact * {
            color: #ffffff !important;
        }

        /* Hover effect color for links in dark mode */
        .dark-mode .w3-contact a:hover {
            color: #d1d1d1 !important;
            text-decoration: underline;
        }
    </style>

    <div>
        <!-- contact -->
        <section class="wthree-row w3-contact py-lg-5">
            <div class="container py-4">
                <div class="text-center wthree-title pb-sm-5 pb-3">
                    <h3 class="w3l-sub">Contact Us</h3>
                    <h4 class="sub-title py-3"></h4>
                </div>
                <!-- contact details -->
                <div class="row contact-form py-lg-5">
                    <!-- contact left grid -->
                    <div class="col-lg-6 px-lg-5 map contact-right">
                        <div class="address">
                            <h5 class="my-3 contact-detail-header">Contact info</h5>
                            <div class="row py-3 wthree-cicon align-items-center">
                                <span class="fas fa-envelope-open mr-3"></span>
                                <a href="mailto:punittiwari9427@gmail.com">punittiwari9427@gmail.com</a>
                            </div>
                            <div class="row py-3 wthree-cicon align-items-center">
                                <span class="fas fa-phone-volume mr-3"></span>
                                <h6>+91 7016717303</h6>
                            </div>
                            <div class="row py-3 wthree-cicon align-items-center">
                                <span class="fas fa-globe mr-3"></span>
                                <a href="#">contact@puneethospital.com</a>
                            </div>
                            <div class="row py-3 wthree-cicon align-items-center">
                                <span class="fas fa-map-marker mr-3"></span>
                                <h6>Surat, Gujarat</h6>
                            </div>
                        </div>
                    </div>
                    <!-- //contact left grid -->

                    <!-- contact right grid -->
                    <div class="col-lg-6 wthree-form-left mt-lg-0 mt-3">
                        <!-- contact form grid -->
                        <div class="contact-top1">
                            <h5 class="my-3 contact-detail-header">Send us a message</h5>
                            <form action="#" method="get" class="f-color pt-3">
                                <div class="form-group mb-3">
                                    <label for="txt_feedbake_name" class="mb-1">Name</label>
                                    <asp:TextBox ID="txt_feedbake_name" placeholder="Your Name" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group my-4">
                                    <label for="txt_feedbake_Email" class="mb-1">Email</label>
                                    <asp:TextBox ID="txt_feedbake_Email" placeholder="Enter Email ID" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="txt_feedbake_msg" class="mb-1">Your Message</label>
                                    <asp:TextBox ID="txt_feedbake_msg" class="form-control" rows="5" TextMode="MultiLine" placeholder="Message" runat="server" Height="106px"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Button ID="btn_feedbake_submit" class="btn btn-danger btn-block w-100" runat="server" Text="Send" OnClick="btn_feedbake_submit_Click" />
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- //contact right grid -->
                </div>
                <!-- //contact details -->
            </div>
        </section>
        <!-- //contact -->
    </div>
</asp:Content>