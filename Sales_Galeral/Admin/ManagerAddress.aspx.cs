using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagerAddress : System.Web.UI.Page
{
    AddressBAL ToolsAdmin = new AddressBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Address.Visible = true;
            Load_Grid_Address();
        }
    }

    public void Load_Grid_Address()
    {
        Grid_Address.DataSource = ToolsAdmin.Load_Address().Tables[0];
        Grid_Address.DataBind();
    }

    protected void Grid_Address_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Address.PageIndex = e.NewPageIndex;
        Load_Grid_Address();
        DIV_AddEditAddress.Visible = false;
    }

    protected void On_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Address.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_Address(ID))
        {
            DIV_AddEditAddress.Visible = false;
            Load_Grid_Address();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVAddress()
    {
        DIV_AddEditAddress.Visible = false;
    }

    public void set_Text_Address()
    {
        TB_Address.Text = "";
        TB_PhoneSupport.Text = "";
    }

    protected void OnRowData_Address(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteAddress");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_Address(object sender, EventArgs e)
    {
        DIV_AddEditAddress.Visible = true;
        HD_ID_Address.Value = ((Label)Grid_Address.SelectedRow.FindControl("LBL_AddressItemID")).Text;
        TB_Address.Text = ((Label)Grid_Address.SelectedRow.FindControl("LBL_AddressItem")).Text;
        TB_PhoneSupport.Text = ((Label)Grid_Address.SelectedRow.FindControl("LBL_PhoneItem")).Text;
    }

    protected void BT_SubmitAddress_Click(object sender, EventArgs e)
    {
        string address = HtmlRemoval.StripTagsRegex(TB_Address.Text.Trim());
        string phone = HtmlRemoval.StripTagsRegex(TB_PhoneSupport.Text.Trim());
        if (ToolsAdmin.Update_Address(Convert.ToInt32(HD_ID_Address.Value), address, phone))
        {
            Load_Grid_Address();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
        set_Hidden_DIVAddress();
    }

    protected void BT_AddAddress_Click1(object sender, EventArgs e)
    {
        HD_ID_Address.Value = "0";
        DIV_AddEditAddress.Visible = true;
        set_Text_Address();
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVAddress();
        set_Text_Address();
    }
}