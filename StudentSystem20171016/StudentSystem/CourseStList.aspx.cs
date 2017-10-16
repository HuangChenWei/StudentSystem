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
    public partial class CourseStList : System.Web.UI.Page
    {
        public int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string Course = "人機互動設計";
            string Course = Convert.ToString(Session["CourseName"]).Trim();
            string UserName = "";
            SqlConnection con = new SqlConnection(
                   WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            con.Open();


            //----Select 有修人機互動設計的學生學號----//
            SqlDataAdapter adapter = new SqlDataAdapter("Select UserName, CourseID, DisplayName From StudentCoursesList Where DisplayName='" + Course + "'", con);
            SqlDataAdapter adapter2 = new SqlDataAdapter();
            SqlDataAdapter adapter3 = new SqlDataAdapter();
            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();
            adapter.Fill(dt);

            //---------------修課人數---------------//
            RowCount = dt.Rows.Count;

            DataTable table = new DataTable();

            //------用學號select StudentFile資料------//
            for (int i = 0; i < RowCount; i++)
            {
                UserName = Convert.ToString(dt.Rows[i]["UserName"]);
                adapter2 = new SqlDataAdapter(
                    "Select Department, Class, UserName,"
                    + "FullName From Accounts Where type = 1 And UserName='"
                    + UserName + "'", con);
                adapter2.Fill(dt2);
            }

            //---------------課程資訊Table---------------//
            adapter3 = new SqlDataAdapter(
                   "Select term From Accounts Where UserName='"
                   + UserName + "'", con);
            DataTable dt3 = new DataTable();
            adapter3.Fill(dt3);
            table.Columns.Add(new DataColumn("學期"));
            table.Columns.Add(new DataColumn("課號"));
            table.Columns.Add(new DataColumn("課程名稱"));
            table.Columns.Add(new DataColumn("教師姓名"));
            DataRow row = table.NewRow();
            Session["term"] = Convert.ToString(dt3.Rows[0]["term"]);
            Session["CourseID"] = Convert.ToString(dt.Rows[0]["CourseID"]);
            row["學期"] = Convert.ToString(Session["term"]);
            row["課號"] = Convert.ToString(Session["CourseID"]);
            row["課程名稱"] = Course;
            row["教師姓名"] = "周志岳";
            table.Rows.Add(row);
            CourseInformationGridView.DataSource = table;
            CourseInformationGridView.DataBind();

            //--------------修改欄位名--------------//
            //dt2.Columns["Department"].ColumnName = "系名";
            //dt2.Columns["Class"].ColumnName = "班級";
            //dt2.Columns["UserName"].ColumnName = "學號";
            //dt2.Columns["FullName"].ColumnName = "姓名";
            StudentListGridView.DataSource = dt2;
            StudentListGridView.DataBind();
        }
    }
}