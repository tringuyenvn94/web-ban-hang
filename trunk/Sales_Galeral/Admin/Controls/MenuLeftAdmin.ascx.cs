using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Controls_MenuLeftAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UseName"] != "")
        {
            LBL_Welcome.Visible = true;
            LBL_Welcome.Text = "Welcom " + Convert.ToString(Session["UseName"]);
            LBL_LogOut.Text = "Logout";
            LBL_LogOut.Visible = true;
        }
        else
        {
            LBL_Welcome.Visible = false;
            Response.Redirect("AdminLogin.aspx?");
        }
    }
}