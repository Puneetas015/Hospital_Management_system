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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        // Dedicated administrator account. Only this login is granted the "Admin" role,
        // which unlocks the Check Appointments screen via the session Role flag.
        private const string AdminUsername = "Puneetas015";
        private const string AdminPassword = "123456";

        protected void btn_login_b_Click(object sender, EventArgs e)
        {
            if (txt_login_username.Text == AdminUsername && txt_login_pass.Text == AdminPassword)
            {
                Session["Role"] = "Admin";
                Response.Redirect("UpdateAppoinment.aspx");
                return;
            }

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string str1 = "select * from UserTab where Uname = @Uname and Pass = @Pass";
                DataTable dt = new DataTable();
                using (SqlCommand cmd = new SqlCommand(str1, con))
                {
                    cmd.Parameters.AddWithValue("@Uname", txt_login_username.Text);
                    cmd.Parameters.AddWithValue("@Pass", txt_login_pass.Text);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        con.Open();

                        da.Fill(dt);
                    }
                }

                if (dt.Rows.Count > 0)
                {
                    Session["Role"] = "User";
                    Response.Redirect("MainAppoinment.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid username or password')</script>");
                }
            }
        }
    }
}