using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagerSupportOnline : System.Web.UI.Page
{
    SupportOnlineBAL ToolsAdmin = new SupportOnlineBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_SupportOnline.Visible = true;
            Load_Grid_SupportOnline();
        }
    }

    public void Load_Grid_SupportOnline()
    {
        Grid_SupportOnline.DataSource = ToolsAdmin.Load_SupportOnline().Tables[0];
        Grid_SupportOnline.DataBind();
    }

    protected void Grid_SupportOnline_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_SupportOnline.PageIndex = e.NewPageIndex;
        Load_Grid_SupportOnline();
        DIV_AddEditSupportOnline.Visible = false;
    }

    protected void On_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_SupportOnline.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_SupportOnline(ID))
        {
            DIV_AddEditSupportOnline.Visible = false;
            Load_Grid_SupportOnline();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVSupportOnline()
    {
        DIV_AddEditSupportOnline.Visible = false;
    }

    public void set_Text_SupportOnline()
    {
        TB_NameSupportOnline.Text = "";
        TB_YahooSupportOnline.Text = "";
        TB_PhoneSupport.Text = "";
    }

    protected void OnRowData_SupportOnline(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteSupportOnline");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_SupportOnline(object sender, EventArgs e)
    {
        DIV_AddEditSupportOnline.Visible = true;
        HD_ID_SupportOnline.Value = ((Label)Grid_SupportOnline.SelectedRow.FindControl("LBL_SupportOnlineItem")).Text;
        TB_NameSupportOnline.Text = ((Label)Grid_SupportOnline.SelectedRow.FindControl("LBL_NameItem")).Text;
        TB_YahooSupportOnline.Text = ((Label)Grid_SupportOnline.SelectedRow.FindControl("LBL_YahooItem")).Text;
        TB_PhoneSupport.Text = ((Label)Grid_SupportOnline.SelectedRow.FindControl("LBL_PhoneSuppotItem")).Text;
    }

    protected void BT_SubmitSupportOnline_Click(object sender, EventArgs e)
    {
        string name = HtmlRemoval.StripTagsRegex(TB_NameSupportOnline.Text.Trim());
        string yahoo = HtmlRemoval.StripTagsRegex(TB_YahooSupportOnline.Text.Trim());
        string phone = HtmlRemoval.StripTagsRegex(TB_PhoneSupport.Text.Trim());
        if (ToolsAdmin.Update_SupportOnline(Convert.ToInt32(HD_ID_SupportOnline.Value), name, yahoo, phone))
        {
            Load_Grid_SupportOnline();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
        set_Hidden_DIVSupportOnline();
    }

    protected void BT_AddSupportOnline_Click1(object sender, EventArgs e)
    {
        HD_ID_SupportOnline.Value = "0";
        DIV_AddEditSupportOnline.Visible = true;
        set_Text_SupportOnline();
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVSupportOnline();
        set_Text_SupportOnline();
    }
}