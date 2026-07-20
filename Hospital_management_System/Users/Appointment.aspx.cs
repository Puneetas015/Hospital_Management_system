using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital_management_System.Users
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btn_Appointmnet_Submit_Click(object sender, EventArgs e)
        {
            // 1. Required Validation Check (Backend Protection)
            string selectedDate = Request.Form["datepicke1"];

            if (string.IsNullOrEmpty(selectedDate))
            {
                // Agar date select nahi ki toh alert dikha kar executing yahi rok do
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a valid appointment date.');", true);
                return; // Aage ka code execute nahi hoga
            }

            // 2. Business Logic Execution Room
            // Yahan aap apna database entry ya save karne ka code likh sakte hain
            // selectedDate variable aapko "YYYY-MM-DD" format me milega.


            // 3. Clean Redirection (Without Thread Abort Exception)
            // Response.Redirect ka second parameter 'false' rakhne se control cleanly transfer hota hai 
            Response.Redirect("Loginpage.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }


    }
}