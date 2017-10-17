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
    public partial class TA_List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Course = Convert.ToString(Session["CourseName"]).Trim();
            SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter("Select UserName, CourseID, DisplayName From StudentCoursesList Where DisplayName='" + Course + "'", con);

            DataTable dt = new DataTable();
            adapter.Fill(dt);


            SqlDataAdapter adapter3 = new SqlDataAdapter();
            DataTable table = new DataTable();
            //---------------課程資訊Table---------------//
            adapter3 = new SqlDataAdapter(
                "Select Belong, CourseID, Year, Semester, DisplayName From Courses Where DisplayName='"
                + Course + "'", con);
            DataTable dt3 = new DataTable();
            adapter3.Fill(dt3);
            table.Columns.Add(new DataColumn("學期"));
            table.Columns.Add(new DataColumn("課號"));
            table.Columns.Add(new DataColumn("課程名稱"));
            table.Columns.Add(new DataColumn("教師姓名"));
            DataRow row = table.NewRow();
            Session["term"] = Convert.ToString(dt3.Rows[0]["Year"]) + Convert.ToString(dt3.Rows[0]["Semester"]);
            Session["CourseID"] = Convert.ToString(dt3.Rows[0]["CourseID"]);
            row["學期"] = Convert.ToString(Session["term"]);
            row["課號"] = Convert.ToString(Session["CourseID"]);
            row["課程名稱"] = Convert.ToString(dt3.Rows[0]["DisplayName"]);
            row["教師姓名"] = Convert.ToString(dt3.Rows[0]["Belong"]);
            table.Rows.Add(row);
            CourseInformationGridView.DataSource = table;
            CourseInformationGridView.DataBind();
        }
    }
}