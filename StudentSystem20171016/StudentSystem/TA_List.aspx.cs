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

            SqlDataAdapter adapter = new SqlDataAdapter();
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

            //尋找這堂課的助教
            SqlDataAdapter adapter2 = new SqlDataAdapter("Select Type, UserName, DisplayName From StudentCoursesList Where Type=2 and DisplayName='" + Course + "'", con);
            DataTable dt2 = new DataTable();
            adapter2.Fill(dt2);
            //助教的學號
            string username = "";
            //如果資料表裡有助教資料
            if (dt2.Rows.Count != 0)
            {
                username = Convert.ToString(dt2.Rows[0]["UserName"]).Trim();
            }
            //用學號去Accounts資料表找這名學生的資料
            DataTable dt3 = new DataTable();
            //如果資料表裡有助教資料
            if (username != "")
            {
                SqlDataAdapter adapter3 = new SqlDataAdapter("Select Department, Class, UserName,FullName From Accounts Where UserName='" + username + "'", con);
                adapter3.Fill(dt3);
                dt3.Columns["Department"].ColumnName = "系名";
                dt3.Columns["Class"].ColumnName = "班級";
                dt3.Columns["UserName"].ColumnName = "學號";
                dt3.Columns["FullName"].ColumnName = "姓名";
                GridView1.DataSource = dt3;
                GridView1.DataBind();
            }
            //沒有助教資料只顯示欄位
            else
            {
                dt3.Columns.Add(new DataColumn("系名"));
                dt3.Columns.Add(new DataColumn("班級"));
                dt3.Columns.Add(new DataColumn("學號"));
                dt3.Columns.Add(new DataColumn("姓名"));
                DataRow row = dt3.NewRow();
                row["系名"] = "";
                row["班級"] = "";
                row["學號"] = "";
                row["姓名"] = "";
                dt3.Rows.Add(row);
                GridView1.DataSource = dt3;
                GridView1.DataBind();
                GridView1.Rows[0].Visible = false;
            }
            CourseInformationGridView.DataSource = dt;
            CourseInformationGridView.DataBind();
            con.Close();
        }
        protected void SearchIDBtn_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=JavaScript>showModal();</script>");
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    //索引值
        //    //Session["id"] = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["ID"]);
        //    //建立資料庫連線
        //    SqlConnection con = new SqlConnection(
        //                       WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);

        //    SqlCommand cmd = null;
        //    //開啓資料庫連線
        //    con.Open();
        //    //cmd = new SqlCommand("insert into StudentFile (FullName) values(@FullName);SELECT @@IDENTITY", con);
        //    //建立SqlCommand查詢命令
        //    cmd = new SqlCommand("Insert Into Accounts (ID, FullName, UserName, Password, Department, Class) values (@ID, @FullName, @UserName, @Password, @Department, @Class)", con);
        //    cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = Convert.ToInt16(Session["id"]) + 1;
        //    cmd.Parameters.Add("@FullName", SqlDbType.NVarChar).Value = FullNameTextBox.Text;
        //    cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = UserNameTextBox.Text;
        //    cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = UserNameTextBox.Text;
        //    //cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 4).Value = TextBox3.Text;
        //    //cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 4).Value = TextBox5.Text;
        //    //cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 4).Value = TextBox6.Text;
        //    cmd.Parameters.Add("@Department", SqlDbType.NVarChar).Value = DepartmentSelect.Value;
        //    cmd.Parameters.Add("@Class", SqlDbType.NVarChar).Value = ClassSelect.Value;
        //    //cmd.Parameters.Add("@DisplayName", SqlDbType.NVarChar, 50).Value = CourseSelect.Value;
        //    cmd.ExecuteNonQuery();

        //    cmd.Dispose();
        //    con.Close();
        //    con.Dispose();
        //    //txtMsg.Text = string.Format("新增產品資料記錄{0}筆成功！", rows);
        //}
        //--------------建立用戶button--------------尾//
    }
}