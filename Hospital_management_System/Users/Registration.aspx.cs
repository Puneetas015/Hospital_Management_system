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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
   
        SqlCommand cmd;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id1 = 1;

                string str1 = "select max(ID) as Id from UserTab";
                da = new SqlDataAdapter(str1, con);
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["Id"] != DBNull.Value)
                {
                    id1 = int.Parse(ds.Tables[0].Rows[0]["Id"].ToString());
                    id1++;
                }

                lbl_rid.Text = id1.ToString();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forgotpassword.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loginpage.aspx");
        }

        protected void btn_login_b_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();

                string str = "insert into UserTab (ID, Uname, Email, Mobile, Pass) values (@Id, @Uname, @Email, @Mobile, @Pass)";
                cmd = new SqlCommand(str, con);
                cmd.Parameters.AddWithValue("@Id", int.Parse(lbl_rid.Text));
                cmd.Parameters.AddWithValue("@Uname", txt_signup_username.Text);
                cmd.Parameters.AddWithValue("@Email", txt_signup_email.Text);
                cmd.Parameters.AddWithValue("@Mobile", txt_signup_mobile.Text);
                cmd.Parameters.AddWithValue("@Pass", txt_signup_pass.Text);
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Registration Success..')</script>");
            }
            catch(Exception exx)
            {
                Response.Write(exx.ToString());
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}