using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace StudentSystem
{
    public partial class ComputerProgramming_I_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string str = "程式設計(一)";
            SqlConnection con = new SqlConnection(
                   WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            SqlDataAdapter adapter = new SqlDataAdapter(
                "SELECT * FROM Courses Where DisplayName='"
                + str + "' ", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}