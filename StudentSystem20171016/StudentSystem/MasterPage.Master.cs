using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace StudentSystem
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //人機互動設計
        protected void HumanComputerBtn_Click(object sender, EventArgs e)
        {
            string str = HumanComputerBtn.Text.Trim();
            Session["CourseName"] = str;
            Response.Redirect("~/CourseStList.aspx");
        }
        //視窗程式設計
        protected void WindowsBtn_Click(object sender, EventArgs e)
        {
            string str = WindowsBtn.Text.Trim();
            Session["CourseName"] = str;
            Response.Redirect("~/CourseStList.aspx");
        }
        //程式設計一
        protected void ComputerProgrammingBtn_Click(object sender, EventArgs e)
        {
            string str = ComputerProgrammingBtn.Text.Trim();
            Session["CourseName"] = str;
            Response.Redirect("~/CourseStList.aspx");
        }
    }
}