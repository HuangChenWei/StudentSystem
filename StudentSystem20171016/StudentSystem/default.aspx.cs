using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows.Forms;



namespace StudentSystem
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
                   WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);

            SqlDataAdapter ad = new SqlDataAdapter(
                        "SELECT ID FROM Accounts", con);

            DataTable dt = new DataTable();
            ad.Fill(dt);
            //紀錄流水號
            Session["id"] = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["ID"]);
            ////TextBox1.Text = Convert.ToString(dt.Rows.Count + 1);
            //String UserName = Convert.ToString(dt.Rows[dt.Rows.Count - 1]["UserName"]);
            //String YourID = Convert.ToString(dt.Rows[dt.Rows.Count - 1]["YourID"]);
            //String Password = Convert.ToString(dt.Rows[dt.Rows.Count - 1]["Password"]);
            //String Email = Convert.ToString(dt.Rows[dt.Rows.Count - 1]["Email"]);
            //String PhoneNumber = Convert.ToString(dt.Rows[dt.Rows.Count - 1]["PhoneNumber"]);
            //String Gender = Convert.ToString(dt.Rows[dt.Rows.Count - 1]["Gender"]);
            //Response.Write("最後一筆ID資料: " + count);
            //    Response.Write("<script language=javascript>alert(\'"
            //        + count + " " + UserName + " " + YourID + " "
            //        + Password + " " + Email + " " + PhoneNumber + " "
            //        + Gender + "\');</script>");
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(
                   WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Select UserName, Password From Accounts", con);
            con.Open();

            //string num = Convert.ToString(cmd.ExecuteScalar());
            SqlDataReader reader = cmd.ExecuteReader();
            /*顯示DB yourid跟password*/
            //Response.Write("<script language=javascript>alert(\'" + String.Format("{0},{1}", reader["YourID"], reader["Password"]) + "\');</script>");

            try
            {
                while (reader.Read())
                {
                    if (userid.Text == String.Format("{0}", reader["UserName"]).Trim() && userpasswd.Text == String.Format("{0}", reader["Password"]).Trim())
                    {
                        Session["UserName"] = String.Format("{0}", reader["UserName"]).Trim();
                        Session["Password"] = String.Format("{0}", reader["Password"]).Trim();
                        //Response.Write("<script language='javascript'>alert('login ok');</script>");
                        Session["login"] = "OK";
                        Response.Redirect("~/contect.aspx");
                    }
                    //if (userid.Text != String.Format("{0}", reader["UserName"]).Trim() && userpasswd.Text != String.Format("{0}", reader["Password"]).Trim())
                    //{
                    //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=JavaScript>showModal();</script>");
                    //}
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                //Console.WriteLine("<script language=javascript>alert(\'" + "The process failed: {0}", ex.ToString() + "\');</script>");
            }
            finally
            {
                con.Close();
                reader.Close();
            }

        }
        //--------------建立用戶button--------------頭//
        protected void Button2_Click(object sender, EventArgs e)
        {
            //索引值
            //Session["id"] = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["ID"]);
            //建立資料庫連線
            SqlConnection con = new SqlConnection(
                               WebConfigurationManager.ConnectionStrings["myDB"].ConnectionString);

            SqlCommand cmd = null;
            //開啓資料庫連線
            con.Open();
            //cmd = new SqlCommand("insert into StudentFile (FullName) values(@FullName);SELECT @@IDENTITY", con);
            //建立SqlCommand查詢命令
            cmd = new SqlCommand("Insert Into Accounts (ID, FullName, UserName, Password, Department, Class) values (@ID, @FullName, @UserName, @Password, @Department, @Class)", con);
            cmd.Parameters.Add("@ID", SqlDbType.NVarChar).Value = Convert.ToInt16(Session["id"]) + 1;
            cmd.Parameters.Add("@FullName", SqlDbType.NVarChar).Value = FullNameTextBox.Text;
            cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = UserNameTextBox.Text;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = UserNameTextBox.Text;
            //cmd.Parameters.Add("@Password", SqlDbType.NVarChar, 4).Value = TextBox3.Text;
            //cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 4).Value = TextBox5.Text;
            //cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 4).Value = TextBox6.Text;
            cmd.Parameters.Add("@Department", SqlDbType.NVarChar).Value = DepartmentSelect.Value;
            cmd.Parameters.Add("@Class", SqlDbType.NVarChar).Value = ClassSelect.Value;
            //cmd.Parameters.Add("@DisplayName", SqlDbType.NVarChar, 50).Value = CourseSelect.Value;
            cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();
            con.Dispose();
            //txtMsg.Text = string.Format("新增產品資料記錄{0}筆成功！", rows);
        }
        //--------------建立用戶button--------------尾//
    }
}