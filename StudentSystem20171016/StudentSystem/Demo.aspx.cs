using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentSystem
{
    public partial class Demo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Convert.ToString(Session["login"]) == "OK")
            {
                //Response.Redirect("~/default.aspx");
                //Response.Write("Sussess");

                //Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('第四種彈出框');</script>");
                //Response.Write("<script language=javascript>alert(\'" + Session["login"] + "\');</script>");
                Session["login"] = "";
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }

        }
    }
}