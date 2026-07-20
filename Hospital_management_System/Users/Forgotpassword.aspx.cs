using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hospital_management_System.Users
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loginpage.aspx");
        }

        protected void btn_fpass_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                DataTable dt = new DataTable();

                try
                {
                    con.Open();

                    string str = "select Email, Mobile from UserTab where Email = @Email and Mobile = @Mobile";
                    using (SqlCommand selectCmd = new SqlCommand(str, con))
                    {
                        selectCmd.Parameters.AddWithValue("@Email", txt_fpass_Email.Text);
                        selectCmd.Parameters.AddWithValue("@Mobile", txt_fpass_mobile.Text);

                        using (SqlDataAdapter da = new SqlDataAdapter(selectCmd))
                        {
                            da.Fill(dt);
                        }
                    }

                    if (dt.Rows.Count > 0)
                    {
                        string str1 = "update UserTab set Pass = @NewPass where Email = @Email and Mobile = @Mobile and Pass = @OldPass";
                        using (SqlCommand cmd = new SqlCommand(str1, con))
                        {
                            cmd.Parameters.AddWithValue("@NewPass", txt_fpass_newpass.Text);
                            cmd.Parameters.AddWithValue("@Email", txt_fpass_Email.Text);
                            cmd.Parameters.AddWithValue("@Mobile", txt_fpass_mobile.Text);
                            cmd.Parameters.AddWithValue("@OldPass", txt_fpass_oldpass.Text);
                            cmd.ExecuteNonQuery();
                        }

                        Response.Write("<script>alert('Forgot Password Successfully')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('No matching account found. Please check your email, mobile and old password.')</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }
    }
}