using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    ClientAboutBAL ToolsAdmin = new ClientAboutBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load_About();
        }
    }


    public void Load_About()
    {
        lblTitle_About.Text = ToolsAdmin.GetAllAbout().Rows[0][2].ToString();
        lblDetail_About.Text = ToolsAdmin.GetAllAbout().Rows[0][3].ToString();
    }

}

