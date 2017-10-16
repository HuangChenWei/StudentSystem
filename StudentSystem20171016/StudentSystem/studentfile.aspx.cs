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
    public partial class studentfile : System.Web.UI.Page
    {
        //視窗程式設計
        public string str1 = "";
        //程式設計(一)
        public string str2 = "";
        //人機互動設計
        public string str3 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
                   WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);

            //-----------------個人檔案的資料table-----------------頭//

            //where 查詢的那筆資料  Select 要更改的筆資料
            SqlCommand cmd = new SqlCommand("Select * From Accounts Where UserName='" 
                + Convert.ToString(Session["UserName"]).Trim() + "' ", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        FullName.Text = String.Format("{0}", reader["FullName"]);
                        Department.Text = String.Format("{0}", reader["Department"]);
                        classtxt.Text = String.Format("{0}", reader["Class"]);
                        StudentID.Text = String.Format("{0}", reader["UserName"]);
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert(\'studentfile.cs 44行 No rows found. \');</script>");
                }
            }
            catch (Exception ex1)
            {
                Response.Write("<script language=javascript>alert(\'" + ex1.Message + "\');</script>");

            }
            finally
            {
                reader.Close();
            }
            //-----------------個人檔案的資料table-----------------尾//
            //-----------------學期和修課table-----------------頭//
            cmd = new SqlCommand("Select DisplayName From StudentCoursesList Where UserName='" 
                + Convert.ToString(Session["UserName"]).Trim() + "' ", con);

            SqlDataReader reader2 = cmd.ExecuteReader();
            try
            {
                if (reader2.HasRows)
                {
                    while (reader2.Read())
                    {
                        if (Convert.ToString(String.Format("{0}", reader2["DisplayName"])) == "視窗程式設計")
                        {
                            str1 = "視窗程式設計";
                            Page.ClientScript.RegisterStartupScript(Page.GetType(), 
                                "" + 1 + "", "<script language=JavaScript>addCourse()</script>");
                        }
                        if (Convert.ToString(String.Format("{0}", reader2["DisplayName"])) == "程式設計(一)")
                        {
                            str2 = "程式設計(一)";
                            Page.ClientScript.RegisterStartupScript(Page.GetType(), 
                                "" + 2 + "", "<script language=JavaScript>addCourse2()</script>");
                        }
                        if (Convert.ToString(String.Format("{0}", reader2["DisplayName"])) == "人機互動設計")
                        {
                            str3 = "人機互動設計";
                            Page.ClientScript.RegisterStartupScript(Page.GetType(), 
                                "" + 3 + "", "<script language=JavaScript>addCourse3()</script>");
                        }
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert(\' studentfile.cs 88行 No rows found. \');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert(\'" + ex.Message + "\');</script>");

            }
            finally
            {
                cmd.Dispose();
                con.Close();
                reader2.Close();
            }
            //-----------------學期和修課table-----------------尾//
        }

        //-----------------修改密碼button-----------------頭//
        protected void UpdatePassword_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
                   WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select Password From Accounts Where UserName='" 
                + Convert.ToString(Session["UserName"]).Trim() + "' ", con);

            try
            {
                if (oldpwd.Text == Convert.ToString(Session["Password"]) && newpwd.Text == checkpwd.Text)
                {
                    con.Open();
                    //依照Session的(帳號/學號)去找尋這筆帳號的密並UPDATE
                    cmd = new SqlCommand("UPDATE Accounts SET Password = @Password WHERE UserName='" 
                        + Convert.ToString(Session["UserName"]).Trim() + "' ", con);
                    cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = newpwd.Text.Trim();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script language=javascript>alert(\' 修改成功 \');</script>");
                }
            }
            catch (SqlException ex)
            {
                Response.Write("<script language=javascript>alert(\'" + ex.Message + "\');</script>");
            }
            finally
            {
                con.Close();
            }
        }
        //-----------------修改密碼button-----------------尾//

    }
}