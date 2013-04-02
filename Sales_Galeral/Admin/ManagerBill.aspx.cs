using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
<<<<<<< .mine
using System.Data;
=======
using System.Data;
using System.Globalization;
>>>>>>> .r27

public partial class Admin_ManagerBill : System.Web.UI.Page
{
    BillBAL ToolsAdmin = new BillBAL();
    Encryption Encryption = new Encryption();
    Description Description = new Description();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Bill.Visible = true;
            Load_Grid_Bill();
        }
    }

    public void Load_Grid_Bill()
    {
        Grid_Bill.DataSource = ToolsAdmin.Load_Bill().Tables[0];
        Grid_Bill.DataBind();
    }
<<<<<<< .mine

    protected void Grid_Bill_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Bill.PageIndex = e.NewPageIndex;
        Load_Grid_Bill();
    }

    protected void On_DeleteBill(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Bill.DataKeys[e.RowIndex].Value.ToString());
        ToolsAdmin.Delete_ShopCart_ByIDBill(ID);
        if (ToolsAdmin.Delete_Bill(ID))
        {
            DIV_ShopCart.Visible = false;
            Load_Grid_Bill();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVBill()
    {
        DIV_Bill.Visible = false;
    }

    protected void OnRowData_Bill(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteBill");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");

            Label Date = (Label)e.Row.FindControl("LBL_BillDatePurcharseItem");
            DataRowView dtr = (DataRowView)e.Row.DataItem;
            DateTime nt = (DateTime)dtr["Date_Purcharse"];
            Date.Text = nt.ToShortDateString();
        }
    }

    protected void OnRowSelected_Bill(object sender, EventArgs e)
    {
        DIV_ShopCart.Visible = true;
        HD_ID_Bill.Value = ((Label)Grid_Bill.SelectedRow.FindControl("LBL_BillItem_BillID")).Text;
        LBL_FullName.Text = "Tên : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillNameItem")).Text;
        LBL_Address.Text = "Địa chỉ : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillAddressItem")).Text;
        LBL_Phone.Text = "Điện thoại : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillPhoneItem")).Text;
        LBL_Email.Text = "Email : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillEmailItem")).Text;
        if (((Label)Grid_Bill.SelectedRow.FindControl("LBLBillGenderItem")).Text.Equals("True"))
        {
            LBL_Gender.Text = "Giới Tính : Nam";
        }
        else {
            LBL_Gender.Text = "Giới Tính : Nữ";
        }
        LBL_TONG.Text = "TỔNG : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBL_BillTotalMoneyItem")).Text;
        LBL_Display.Visible = false;
        Load_Grid_ShopCart();
    }

    //=====================================ShopCart==========================================================================

    public void Load_Grid_ShopCart()
    {

        Grid_ShopCart.DataSource = ToolsAdmin.Load_ShopCart_ByClickBillID(Convert.ToInt32(HD_ID_Bill.Value)).Tables[0];
        Grid_ShopCart.DataBind();
    }

    protected void Grid_ShopCart_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_ShopCart.PageIndex = e.NewPageIndex;
        Load_Grid_ShopCart();
    }

    protected void OnRowData_ShopCart(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void BT_Close_Click(object sender, EventArgs e)
    {
        DIV_ShopCart.Visible = false;
        HD_ID_Bill.Value = "";
    }

    protected void BT_UpdateStatusPayment_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < Grid_Bill.Rows.Count; i++)
        {
            Label lb = (Label)Grid_Bill.Rows[i].FindControl("LBL_BillItem_BillID");
            int ID = Convert.ToInt32(lb.Text);
            CheckBox cb = (CheckBox)Grid_Bill.Rows[i].FindControl("CHKB_Payment");
            bool StatusPayment = cb.Checked;
            ToolsAdmin.Update_Status_Payment(ID, StatusPayment);
        }
        DIV_ShopCart.Visible = false;
        LBL_Display.Visible = true;
        LBL_Display.Text = "Update Success";
        Load_Grid_Bill();
    }
=======

    protected void Grid_Bill_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Bill.PageIndex = e.NewPageIndex;
        if (HD_DateFrom.Value == "" || HD_DateTo.Value == "")
        {
            Load_Grid_Bill();
        }
        if (HD_DateFrom.Value != "" || HD_DateTo.Value != "")
        {
            Load_Grid_Bill();
        }
        if (HD_DateFrom.Value != "" && HD_DateTo.Value != "")
        {
            Load_SearchBill_Date();
        }
    }

    protected void On_DeleteBill(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Bill.DataKeys[e.RowIndex].Value.ToString());
        ToolsAdmin.Delete_ShopCart_ByIDBill(ID);
        if (ToolsAdmin.Delete_Bill(ID))
        {
            DIV_ShopCart.Visible = false;
            if (HD_DateFrom.Value == "" || HD_DateTo.Value == "")
            {
                Load_Grid_Bill();
            }
            if (HD_DateFrom.Value != "" || HD_DateTo.Value != "")
            {
                Load_Grid_Bill();
            }
            if (HD_DateFrom.Value != "" && HD_DateTo.Value != "")
            {
                Load_SearchBill_Date();
            }
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVBill()
    {
        DIV_Bill.Visible = false;
    }

    protected void OnRowData_Bill(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteBill");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");

            Label Date = (Label)e.Row.FindControl("LBL_BillDatePurcharseItem");
            DataRowView dtr = (DataRowView)e.Row.DataItem;
            DateTime nt = (DateTime)dtr["Date_Purcharse"];
            Date.Text = nt.ToString("dd/MM/yyyy");
        }
    }

    protected void OnRowSelected_Bill(object sender, EventArgs e)
    {
        DIV_ShopCart.Visible = true;
        HD_ID_Bill.Value = ((Label)Grid_Bill.SelectedRow.FindControl("LBL_BillItem_BillID")).Text;
        LBL_FullName.Text = "Tên : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillNameItem")).Text;
        LBL_Address.Text = "Địa chỉ : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillAddressItem")).Text;
        LBL_Phone.Text = "Điện thoại : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillPhoneItem")).Text;
        LBL_Email.Text = "Email : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBLBillEmailItem")).Text;
        if (((Label)Grid_Bill.SelectedRow.FindControl("LBLBillGenderItem")).Text.Equals("True"))
        {
            LBL_Gender.Text = "Giới Tính : Nam";
        }
        else {
            LBL_Gender.Text = "Giới Tính : Nữ";
        }
        LBL_TONG.Text = "TỔNG : " + ((Label)Grid_Bill.SelectedRow.FindControl("LBL_BillTotalMoneyItem")).Text;
        LBL_Display.Visible = false;
        Load_Grid_ShopCart();
    }

    //=====================================ShopCart==========================================================================

    public void Load_Grid_ShopCart()
    {

        Grid_ShopCart.DataSource = ToolsAdmin.Load_ShopCart_ByClickBillID(Convert.ToInt32(HD_ID_Bill.Value)).Tables[0];
        Grid_ShopCart.DataBind();
    }

    protected void Grid_ShopCart_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_ShopCart.PageIndex = e.NewPageIndex;
        Load_Grid_ShopCart();
    }

    protected void OnRowData_ShopCart(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void BT_Close_Click(object sender, EventArgs e)
    {
        DIV_ShopCart.Visible = false;
        HD_ID_Bill.Value = "";
    }

    protected void BT_UpdateStatusPayment_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < Grid_Bill.Rows.Count; i++)
        {
            Label lb = (Label)Grid_Bill.Rows[i].FindControl("LBL_BillItem_BillID");
            int ID = Convert.ToInt32(lb.Text);
            CheckBox cb = (CheckBox)Grid_Bill.Rows[i].FindControl("CHKB_Payment");
            bool StatusPayment = cb.Checked;
            ToolsAdmin.Update_Status_Payment(ID, StatusPayment);
        }
        DIV_ShopCart.Visible = false;
        LBL_Display.Visible = true;
        LBL_Display.Text = "Update Success";
        if (HD_DateFrom.Value == "" || HD_DateTo.Value == "")
        {
            Load_Grid_Bill();
        }
        if (HD_DateFrom.Value != "" || HD_DateTo.Value != "")
        {
            Load_Grid_Bill();
        }
        if (HD_DateFrom.Value != "" && HD_DateTo.Value != "")
        {
            Load_SearchBill_Date();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        HD_DateFrom.Value = TB_DateFrom.Text.Trim();
        HD_DateTo.Value = TB_DateTo.Text.Trim();

        if (HD_DateFrom.Value == "" || HD_DateTo.Value == "")
        {
            Load_Grid_Bill();
        }
        if (HD_DateFrom.Value != "" || HD_DateTo.Value != "")
        {
            Load_Grid_Bill();
        }
        if (HD_DateFrom.Value != "" && HD_DateTo.Value != "")
        {
            Load_SearchBill_Date();
        }
    }

    public void Load_SearchBill_Date()
    {
        DateTime nt = Convert.ToDateTime(HD_DateFrom.Value);
        DateTime nt1 = Convert.ToDateTime(HD_DateTo.Value);
        Grid_Bill.DataSource = ToolsAdmin.Load_SearchBill_ByDate(nt.ToString("yyyy/dd/MM"), nt1.ToString("yyyy/dd/MM")).Tables[0];
        Grid_Bill.DataBind();
    }
>>>>>>> .r27
}