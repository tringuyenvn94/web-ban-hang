using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagerAbout : System.Web.UI.Page
{
    AboutBAL ToolsAdmin = new AboutBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load_About();
        }
    }

    public void Load_About()
    {
        TB_TieuDe.Text = ToolsAdmin.Load_About().Tables[0].Rows[0][1].ToString();
        FCKeditor.Value = ToolsAdmin.Load_About().Tables[0].Rows[0][2].ToString();
    }

    protected void BT_SubmitAbout_Click(object sender, EventArgs e)
    {
        string tieude = HtmlRemoval.StripTagsRegex(TB_TieuDe.Text.Trim());
        string noidung = FCKeditor.Value.Trim();
        if (ToolsAdmin.Update_About(1, tieude, noidung))
        {
            Load_About();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
    }
}