using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_System.Users
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd;
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        protected void Page_Load(object sender, EventArgs e)
        {
            // Guard clause: block anonymous/non-admin access even if the URL is typed directly.
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Users/Loginpage.aspx");
                return;
            }

            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from AppontTab", con);
                DataTable dtbl1 = new DataTable();
                da.Fill(dtbl1);
                GridView1.DataSource = dtbl1;
                GridView1.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkDelete = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lnkDelete.NamingContainer;
            int rowId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("DELETE FROM AppontTab WHERE AID = @AID", connection);
                command.Parameters.AddWithValue("@AID", rowId);
                connection.Open();
                command.ExecuteNonQuery();
                Response.Write("<script>alert('Appointment Deleted')</script>");
            }

            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Loads the selected appointment's data into the edit form fields above the grid.
            Panel_UpdateForm.Visible = true;

            // 2. Selected row se data fields uthakar textboxes mein daalna hai
            GridViewRow row = GridView1.SelectedRow;

            DropDownList_Section.SelectedValue = row.Cells[0].Text;
            txt_Appoint_name.Text = row.Cells[1].Text;
            DropDownList_gender.SelectedValue = row.Cells[2].Text;
            txt_Apoint_Mobile.Text = row.Cells[3].Text;
            txt_Apoint_Email.Text = row.Cells[4].Text;

            // Date column se clean string lena
            datepicke.Text = row.Cells[5].Text.Replace(" 12:00:00 AM", "");
        }
        protected void btn_Appointmnet_Update_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();

                // 1. GridView ki selected row se direct primary key (AID) nikalna
                int rowId = Convert.ToInt32(GridView1.SelectedValue);

                string str = "update AppontTab set Section = @Section, Name = @Name, Gender = @Gender, Mobile = @Mobile, Email = @Email, Date = @Date where AID = @AID";
                cmd = new SqlCommand(str, con);

                // 2. Form se naye values uthana
                cmd.Parameters.AddWithValue("@Section", DropDownList_Section.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Name", txt_Appoint_name.Text);
                cmd.Parameters.AddWithValue("@Gender", DropDownList_gender.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@Mobile", txt_Apoint_Mobile.Text);
                cmd.Parameters.AddWithValue("@Email", txt_Apoint_Email.Text);

                // 3. Strict Date Conversion logic (Jo humne pehle fix kiya tha)
                DateTime updateDate = DateTime.ParseExact(datepicke.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                cmd.Parameters.AddWithValue("@Date", updateDate);

                cmd.Parameters.AddWithValue("@AID", rowId);

                // 4. Query execute karna
                cmd.ExecuteNonQuery();

                Response.Write("<script>alert('Appointment Updated Successfully')</script>");
                con.Close();

                // 5. Update hone ke baad form ko wapas hide karna aur GridView refresh karna
                Panel_UpdateForm.Visible = false;

                // Agar aapke paas database reload karne ka koi function hai (jaise gridbind() ya show()), 
                // toh use yahan call kar sakte hain taaki updated data turant list mein dikhe.
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}

