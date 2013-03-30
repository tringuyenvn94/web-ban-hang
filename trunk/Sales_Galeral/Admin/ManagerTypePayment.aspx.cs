using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagerTypePayment : System.Web.UI.Page
{
    TypePaymentDAL ToolsAdmin = new TypePaymentDAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_TypePayment.Visible = true;
            Load_Grid_TypePayment();
        }
    }

    public void Load_Grid_TypePayment()
    {
        Grid_TypePayment.DataSource = ToolsAdmin.Load_TypePayment().Tables[0];
        Grid_TypePayment.DataBind();
    }

    protected void Grid_TypePayment_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_TypePayment.PageIndex = e.NewPageIndex;
        Load_Grid_TypePayment();
        DIV_AddEditTypePayment.Visible = false;
    }

    protected void On_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_TypePayment.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_TypePayment(ID))
        {
            DIV_AddEditTypePayment.Visible = false;
            Load_Grid_TypePayment();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVTypePayment()
    {
        DIV_AddEditTypePayment.Visible = false;
    }

    public void set_Text_TypePayment()
    {
        TB_LoaiThanhToan.Text = "";
        TB_NoiDung.Text = "";
    }

    protected void OnRowData_TypePayment(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_TypePayment(object sender, EventArgs e)
    {
        DIV_AddEditTypePayment.Visible = true;
        HD_ID_TypePayment.Value = ((Label)Grid_TypePayment.SelectedRow.FindControl("LBL_TypePaymentItem")).Text;
        TB_LoaiThanhToan.Text = ((Label)Grid_TypePayment.SelectedRow.FindControl("LBL_TitleInfoItem")).Text;
        TB_NoiDung.Text = ((Label)Grid_TypePayment.SelectedRow.FindControl("LBL_InfoItem")).Text;
    }

    protected void BT_SubmitTypePayment_Click(object sender, EventArgs e)
    {
        string info = TB_NoiDung.Text.Trim();
        string titleinfo = TB_LoaiThanhToan.Text.Trim();
        if (ToolsAdmin.Update_TypePayment(Convert.ToInt32(HD_ID_TypePayment.Value), titleinfo, info))
        {
            Load_Grid_TypePayment();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
        set_Hidden_DIVTypePayment();
    }

    protected void BT_AddTypePayment_Click1(object sender, EventArgs e)
    {
        HD_ID_TypePayment.Value = "0";
        DIV_AddEditTypePayment.Visible = true;
        set_Text_TypePayment();
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVTypePayment();
        set_Text_TypePayment();
    }
}