using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ManagerAdmin : System.Web.UI.Page
{
    AdminBAL ToolsAdmin = new AdminBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Admin.Visible = true;
            Load_Grid_Admin();
        }
    }

    public void Load_Grid_Admin()
    {
        Grid_Admin.DataSource = ToolsAdmin.Load_Admin().Tables[0];
        Grid_Admin.DataBind();
    }

    protected void Grid_Admin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Admin.PageIndex = e.NewPageIndex;
        Load_Grid_Admin();
        DIV_AddEditAdmin.Visible = false;
    }

    protected void On_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Admin.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_Admin(ID))
        {
            DIV_AddEditAdmin.Visible = false;
            Load_Grid_Admin();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVAdmin()
    {
        DIV_AddEditAdmin.Visible = false;
    }

    public void set_Text_Admin()
    {
        TB_UseNameAdmin.Text = "";
        TB_PassAdmin.Text = "";
    }

    protected void OnRowData_Admin(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteAdmin");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this Record?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_Admin(object sender, EventArgs e)
    {
        DIV_AddEditAdmin.Visible = true;
        HD_ID_Admin.Value = ((Label)Grid_Admin.SelectedRow.FindControl("LBL_AdminItem")).Text;
        TB_UseNameAdmin.Text = ((Label)Grid_Admin.SelectedRow.FindControl("LBL_UseNameItem")).Text;
        TB_PassAdmin.Text = ((Label)Grid_Admin.SelectedRow.FindControl("LBL_PasswordItem")).Text;
    }

    protected void BT_SubmitAdmin_Click(object sender, EventArgs e)
    {
        string usename = HtmlRemoval.StripTagsRegex(TB_UseNameAdmin.Text.Trim());
        string pass = Encryption.Encrypt(TB_PassAdmin.Text.Trim(), TB_PassAdmin.Text.Trim());
        if (ToolsAdmin.Update_Admin(Convert.ToInt32(HD_ID_Admin.Value), usename, pass))
        {
            Load_Grid_Admin();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
        set_Hidden_DIVAdmin();
    }

    protected void BT_AddAdmin_Click1(object sender, EventArgs e)
    {
        HD_ID_Admin.Value = "0";
        DIV_AddEditAdmin.Visible = true;
        set_Text_Admin();
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVAdmin();
        set_Text_Admin();
    }
}