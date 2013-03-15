using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagerCategory : System.Web.UI.Page
{
    CategoryBAL ToolsAdmin = new CategoryBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Category.Visible = true;
            Load_Grid_Category();
        }
    }

    public void Load_Grid_Category()
    {
        Grid_Category.DataSource = ToolsAdmin.Load_Category().Tables[0];
        Grid_Category.DataBind();
    }

    protected void Grid_Category_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Category.PageIndex = e.NewPageIndex;
        Load_Grid_Category();
        DIV_AddEditCategory.Visible = false;
    }

    protected void On_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Category.DataKeys[e.RowIndex].Value.ToString());
        ToolsAdmin.delete_Product_WhenDeleteCategory(ID);
        if (ToolsAdmin.delete_Category(ID))
        {
            DIV_AddEditCategory.Visible = false;
            Load_Grid_Category();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVCategory()
    {
        DIV_AddEditCategory.Visible = false;
    }

    public void set_Text_Category()
    {
        TB_CategoryName.Text = "";
    }

    protected void OnRowData_Category(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteCategory");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_Category(object sender, EventArgs e)
    {
        DIV_AddEditCategory.Visible = true;
        HD_ID_Category.Value = ((Label)Grid_Category.SelectedRow.FindControl("LBL_CategoryItem")).Text;
        TB_CategoryName.Text = ((Label)Grid_Category.SelectedRow.FindControl("LBL_CategoryNameItem")).Text;
    }

    protected void BT_SubmitCategory_Click(object sender, EventArgs e)
    {
        string catename = HtmlRemoval.StripTagsRegex(TB_CategoryName.Text.Trim());
        if (ToolsAdmin.Update_Category(catename,Convert.ToInt32(HD_ID_Category.Value)))
        {
            Load_Grid_Category();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
        set_Hidden_DIVCategory();
    }

    protected void BT_AddCategory_Click1(object sender, EventArgs e)
    {
        HD_ID_Category.Value = "0";
        DIV_AddEditCategory.Visible = true;
        set_Text_Category();
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVCategory();
        set_Text_Category();
    }
}