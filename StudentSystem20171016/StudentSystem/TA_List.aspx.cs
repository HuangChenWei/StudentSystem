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
            //SqlDataAdapter adapter = new SqlDataAdapter("Select UserName, CourseID, DisplayName From StudentCoursesList Where DisplayName='" + Course + "'", con);

            //DataTable dt = new DataTable();
            //adapter.Fill(dt);

            //dt2.Columns["Department"].ColumnName = "系名";
            SqlDataAdapter adapter = new SqlDataAdapter();
            //DataTable table = new DataTable();
            //---------------課程資訊Table---------------//
            adapter = new SqlDataAdapter(
                "Select Year, Semester, CourseID, DisplayName, Belong From Courses Where DisplayName='"
                + Course + "'", con);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dt.Columns["Year"].ColumnName = "學年";
            dt.Columns["Semester"].ColumnName = "學期";
            dt.Columns["CourseID"].ColumnName = "課號";
            dt.Columns["DisplayName"].ColumnName = "課程名稱";
            dt.Columns["Belong"].ColumnName = "教師姓名";
            //table.Columns.Add(new DataColumn("學期"));
            //table.Columns.Add(new DataColumn("課號"));
            //table.Columns.Add(new DataColumn("課程名稱"));
            //table.Columns.Add(new DataColumn("教師姓名"));
            //DataRow row = table.NewRow();
            //Session["term"] = Convert.ToString(dt3.Rows[0]["Year"]) + Convert.ToString(dt3.Rows[0]["Semester"]);
            //Session["CourseID"] = Convert.ToString(dt3.Rows[0]["CourseID"]);
            //row["學期"] = Convert.ToString(Session["term"]);
            //row["課號"] = Convert.ToString(Session["CourseID"]);
            //row["課程名稱"] = Convert.ToString(dt3.Rows[0]["DisplayName"]);
            //row["教師姓名"] = Convert.ToString(dt3.Rows[0]["Belong"]);
            //table.Rows.Add(row);

            //尋找這堂課的助教
            SqlDataAdapter adapter2 = new SqlDataAdapter("Select Type, UserName, DisplayName From StudentCoursesList Where Type=2 and DisplayName='" + Course + "'", con);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);
            //助教的學號
            string username = Convert.ToString(dt2.Rows[0]["UserName"]).Trim();
            //用學號去Accounts資料表找這名學生的資料
            SqlDataAdapter adapter3 = new SqlDataAdapter("Select Department, Class, UserName,FullName From Accounts Where UserName='" + username + "'", con);
            DataTable dt3 = new DataTable();
            adapter3.Fill(dt3);
            dt3.Columns["Department"].ColumnName = "系名";
            dt3.Columns["Class"].ColumnName = "班級";
            dt3.Columns["UserName"].ColumnName = "學號";
            dt3.Columns["FullName"].ColumnName = "姓名";
            GridView1.DataSource = dt3;
            GridView1.DataBind();
            CourseInformationGridView.DataSource = dt;
            CourseInformationGridView.DataBind();

        }
    }
}