using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ManagerCustomer : System.Web.UI.Page
{
    CustomerBAL ToolsAdmin = new CustomerBAL();
    Encryption Encryption = new Encryption();
    Description Description = new Description();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Account.Visible = true;
            Load_Grid_Account();
        }
    }

    public void Load_Grid_Account()
    {
        Grid_Account.DataSource = ToolsAdmin.Load_Customer().Tables[0];
        Grid_Account.DataBind();
    }
<<<<<<< .mine

    protected void Grid_Account_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Account.PageIndex = e.NewPageIndex;
        Load_Grid_Account();
    }

    protected void On_RowDeleteAccount(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Account.DataKeys[e.RowIndex].Value.ToString());
        ToolsAdmin.Delete_ShopCartWhenDeleteBill(ID);
        ToolsAdmin.Delete_BillWhenDeleteCustomer(ID);
        if (ToolsAdmin.Delete_Customer(ID))
        {
            Load_Grid_Account();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    protected void OnRowData_Account(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteAccount");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");

            Label Gender = (Label)e.Row.FindControl("LBL_AccountGender");
            DataRowView dtr = (DataRowView)e.Row.DataItem;
            bool nt = (bool)dtr["Gender"];
            if (nt == true)
            {
                Gender.Text = "Nam";
            }
            else
            {
                Gender.Text = "Nữ";
            }
        }
    }

    protected void OnRowSelected_Account(object sender, EventArgs e)
    {
        HD_ID_Account.Value = ((Label)Grid_Account.SelectedRow.FindControl("LBL_AccountItem")).Text;
    }
=======

    protected void Grid_Account_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Account.PageIndex = e.NewPageIndex;
        if (HD_Name.Value == "")
        {
            Load_Grid_Account();
        }
        else
        {
            Load_SearchAccount_ByName();
        }
    }

    protected void On_RowDeleteAccount(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Account.DataKeys[e.RowIndex].Value.ToString());
        ToolsAdmin.Delete_ShopCartWhenDeleteBill(ID);
        ToolsAdmin.Delete_BillWhenDeleteCustomer(ID);
        if (ToolsAdmin.Delete_Customer(ID))
        {
            if (HD_Name.Value == "")
            {
                Load_Grid_Account();
            }
            else
            {
                Load_SearchAccount_ByName();
            }
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    protected void OnRowData_Account(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteAccount");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");

            Label Gender = (Label)e.Row.FindControl("LBL_AccountGender");
            DataRowView dtr = (DataRowView)e.Row.DataItem;
            bool nt = (bool)dtr["Gender"];
            if (nt == true)
            {
                Gender.Text = "Nam";
            }
            else
            {
                Gender.Text = "Nữ";
            }
        }
    }

    protected void OnRowSelected_Account(object sender, EventArgs e)
    {
        HD_ID_Account.Value = ((Label)Grid_Account.SelectedRow.FindControl("LBL_AccountItem")).Text;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        HD_Name.Value = TB_SearchName.Text;
        if (HD_Name.Value == "")
        {
            Load_Grid_Account();
        }
        else
        {
            Load_SearchAccount_ByName();
        }
    }

    public void Load_SearchAccount_ByName()
    {
        Grid_Account.DataSource = ToolsAdmin.Load_SearchCustomer_ByName(HD_Name.Value).Tables[0];
        Grid_Account.DataBind();
    }
>>>>>>> .r27
}