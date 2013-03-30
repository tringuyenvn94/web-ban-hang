using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_AdminLogin : System.Web.UI.Page
{
    AdminBAL ToolsAdmin = new AdminBAL();
    Encryption Encryption = new Encryption();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BT_Login_Click(object sender, EventArgs e)
    {
        string usename = TB_UseName.Text.Trim();
        string pass = TB_Password.Text.Trim();
        string EncryptionPass = Encryption.Encrypt(pass, pass);
        DataTable dtable = ToolsAdmin.Load_Admin().Tables[0];
        bool flag = false;
        for (int i = 0; i < dtable.Rows.Count; i++)
        {
            if (EncryptionPass.Equals(dtable.Rows[i][3].ToString()) && usename.Equals(dtable.Rows[i][2].ToString()))
            {
                flag = true;
            }
        }
        if (flag == true)
        {
            Session["UseName"] = usename;
            Response.Redirect("Admin.aspx");
        }
        else
        {
            LBL_Info.Visible = true;
            LBL_Info.Text = "UseName or Password is not correct !";
            TB_UseName.Focus();
        }
    }

    protected void BT_Reset_Click(object sender, EventArgs e)
    {
        TB_UseName.Text = "";
        TB_Password.Text = "";
        LBL_Info.Visible = false;
    }
}