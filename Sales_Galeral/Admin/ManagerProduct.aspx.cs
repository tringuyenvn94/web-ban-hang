using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ManagerProduct : System.Web.UI.Page
{
    ProductBAL ToolsAdmin = new ProductBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Product.Visible = true;
            Load_Grid_Products();
            Load_DDL_Category();
            Set_Attribute();
        }
    }

    public void Load_Grid_Products()
    {
        Grid_Product.DataSource = ToolsAdmin.Load_Product().Tables[0];
        Grid_Product.DataBind();
    }

    protected void Grid_Product_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Product.PageIndex = e.NewPageIndex;
        if (TB_SearchProduct.Text.Trim() == "")
        {
            Load_Grid_Products();
        }
        else
        {
            Load_SearchProduct_ByName();
        }
        DIV_AddEditProduct.Visible = false;
    }

    protected void On_DeleteProducts(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Product.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_Product(ID))
        {
            DIV_AddEditProduct.Visible = false;
            Load_Grid_Products();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVProduct()
    {
        DIV_AddEditProduct.Visible = false;
    }

    public void Set_Attribute()
    {
        TB_GiaBan.Attributes["onKeyPress"] = "javascript:return EnsureNumericKeyEntry(this.id);";
        TB_GiaGoc.Attributes["onKeyPress"] = "javascript:return EnsureNumericKeyEntry(this.id);";
        TB_GiamGia.Attributes["onKeyPress"] = "javascript:return EnsureNumericKeyEntry(this.id);";
        TB_SoLuongCo.Attributes["onKeyPress"] = "javascript:return EnsureNumericKeyEntry(this.id);";
        TB_SoLuongBan.Attributes["onKeyPress"] = "javascript:return EnsureNumericKeyEntry(this.id);";
    }

    public void set_Text_Product()
    {

        HD_ID_Product.Value = "0";
        DDL_TheLoai.SelectedIndex = 0;
        TB_TenSanPham.Text = "";
        TB_MaSanPham.Text = "";
        TB_GiaGoc.Text = "";
        TB_GiaBan.Text = "";
        TB_GiamGia.Text = "";
        TB_SoLuongCo.Text = "";
        TB_SoLuongBan.Text = "0";
        TB_PartImage.Value = "";
        IMG_Upload.ImageUrl = null;
        TB_MoTa.Text = "";
        FCKeditor.Value = "";
    }

    protected void OnRowData_Product(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteProduct");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Are you sure you want to delete this Record?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_Product(object sender, EventArgs e)
    {
        DIV_AddEditProduct.Visible = true;
        HD_ID_Product.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_ProductItem")).Text;
        HD_CategoryID_Product.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_CategoryIDItem")).Text;
        DDL_TheLoai.SelectedValue = HD_CategoryID_Product.Value;
        TB_TenSanPham.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_NameItem")).Text;
        TB_MaSanPham.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_ProductCodeItem")).Text;
        TB_GiaGoc.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_ManufactureItem")).Text;
        TB_GiaBan.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_PriceItem")).Text;
        TB_GiamGia.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_PriceItem")).Text;
        TB_SoLuongCo.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_QuantityInItem")).Text;
        TB_SoLuongBan.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_QuantityOutItem")).Text;
        TB_PartImage.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_LinkImageProductItem")).Text;
        IMG_Upload.ImageUrl = "../images/ImageProduct/" + TB_PartImage.Value;
        TB_MoTa.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_DescriptionItem")).Text;
        FCKeditor.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_DetailsItem")).Text;
    }

    protected void BT_AddProduct_Click(object sender, EventArgs e)
    {
        HD_ID_Product.Value = "0";
        DIV_AddEditProduct.Visible = true;
        set_Text_Product();
    }

    protected void BT_SubmitProduct_Click(object sender, EventArgs e)
    {
        int CategoryID = Convert.ToInt32(DDL_CategoryName.SelectedValue.ToString());
        if (Convert.ToInt32(ToolsAdmin.Load_ID_Parent_Categories(CategoryID).Tables[0].Rows[0][0].ToString()) == 0)
        {
            WebMsgBox.Show("You can't select CategoryName here ! Please Select again");
            DDL_CategoryName.SelectedValue = "";
            //CategoryID = Convert.ToInt32(DDL_CategoryName.SelectedValue.ToString());
        }
        else
        {
            string NameProduct = HtmlRemoval.StripTagsRegex(TB_NameProduct.Text.Trim());
            string ProductCode = HtmlRemoval.StripTagsRegex(TB_ProductCode.Text.Trim());
            string Manufacture = HtmlRemoval.StripTagsRegex(TB_Manufacture.Text.Trim());
            double PriceProduct;
            if (TB_PriceProduct.Text.Trim() == "")
            {
                PriceProduct = 0;
            }
            else
            {
                PriceProduct = Convert.ToDouble(TB_PriceProduct.Text.Trim());
            }
            int QuantityInProduct;
            if (TB_QuantityInProduct.Text.Trim() == "")
            {
                QuantityInProduct = 0;
            }
            else
            {
                QuantityInProduct = Convert.ToInt32(TB_QuantityInProduct.Text.Trim());
            }
            int QuantityOutProduct = 0;
            if (TB_QuantityOutProduct.Text.Trim() == "")
            {
                QuantityInProduct = 0;
            }
            else
            {
                QuantityOutProduct = Convert.ToInt32(TB_QuantityOutProduct.Text.Trim());
            }
            string Date_In;
            if (TB_Date_In.Text.Trim() == "")
            {
                Date_In = "00:00:00";
            }
            else
            {
                Date_In = HtmlRemoval.StripTagsRegex(TB_Date_In.Text.Trim());
            }
            string PartImage = TB_PartImage.Value.Trim();
            string DescriptionProduct = TB_DescriptionProduct.Text.Trim();
            string Details = FCKeditor.Value.Trim();
            if (Convert.ToInt32(HD_ID_Product.Value) != 0)
            {
                if (ToolsAdmin.Update_Product(Convert.ToInt32(HD_ID_Product.Value), CategoryID, NameProduct, ProductCode, Manufacture, PriceProduct, QuantityInProduct, QuantityOutProduct, Date_In, PartImage, DescriptionProduct, Details))
                {
                    Load_Grid_Products();
                }
                else
                {
                    WebMsgBox.Show("Error Update");
                }
            }
            else if (Convert.ToInt32(HD_ID_Product.Value) == 0)
            {
                if (ToolsAdmin.Insert_Product(Convert.ToInt32(HD_ID_Product.Value), CategoryID, NameProduct, ProductCode, Manufacture, PriceProduct, QuantityInProduct, 0, Date_In, PartImage, DescriptionProduct, Details))
                {
                    Load_Grid_Products();
                }
                else
                {
                    WebMsgBox.Show("Error Insert");
                }
            }
            TB_SearchProduct.Text = "";
            set_Hidden_DIVProduct();
        }
    }

    protected void BT_Upload_Click(object sender, EventArgs e)
    {
        string uploadPath = Server.MapPath("../images/ImageProduct/");
        if (FileUpload_Image.HasFile)
        {
            string filename = FileUpload_Image.FileName;
            string extension = System.IO.Path.GetExtension(filename);
            string savefile = uploadPath + "\\" + filename;
            try
            {
                FileUpload_Image.SaveAs(savefile);
                IMG_Upload.ImageUrl = "../images/ImageProduct/" + filename;
                TB_PartImage.Value = FileUpload_Image.FileName;
            }
            catch (Exception ex)
            {
                Trace.Write("-----Write File Error: \n" + ex.Message + "\n---------");
            }
        }
    }

    public void Load_DDL_Category()
    {
        DDL_CategoryName.Items.Clear();
        DataRow[] RootRow = ToolsAdmin.Load_DDL_Category().Tables[0].Select("ID_Parent = 0");
        foreach (DataRow row in RootRow)
        {
            DDL_CategoryName.Items.Add(new ListItem(row["Category_Name"].ToString(), row["ID"].ToString()));
            DataRow[] ChildRow = ToolsAdmin.Load_DDL_Category().Tables[0].Select("ID_Parent =" + row["ID"].ToString());
            foreach (DataRow childrow in ChildRow)
            {
                DDL_CategoryName.Items.Add(new ListItem("----" + childrow["Category_Name"].ToString(), childrow["ID"].ToString()));
            }
        }
        DDL_CategoryName.Items.Insert(0, "");
        DDL_CategoryName.Items[0].Value = "";
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVProduct();
        set_Text_Product();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Load_SearchProduct_ByName();
    }

    public void Load_SearchProduct_ByName()
    {
        string name = TB_SearchProduct.Text;
        Grid_Product.DataSource = ToolsAdmin.Load_SearchProduct_ByName(name).Tables[0];
        Grid_Product.DataBind();
    }
}