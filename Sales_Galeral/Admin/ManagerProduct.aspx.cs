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
    CategoryBAL ToolsAdmin1 = new CategoryBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    public int category_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Product.Visible = true;
            Load_Grid_Products();
            Load_DDL_Category();
            Load_DDL_SearchCategory();
            Load_DDL_Type();
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
<<<<<<< .mine
        if (category_id == 0)
=======
        if (Convert.ToInt32(HD_Select_CategoryID.Value) == 0)
>>>>>>> .r27
        {
            Load_Grid_Products();
        }
        else
        {
            Load_SearchProduct_ByCategory();
        }
        DIV_AddEditProduct.Visible = false;
    }

    protected void On_DeleteProducts(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Product.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_Product(ID))
        {
            DIV_AddEditProduct.Visible = false;
            if (Convert.ToInt32(HD_Select_CategoryID.Value) == 0)
            {
                Load_Grid_Products();
            }
            else
            {
                Load_SearchProduct_ByCategory();
            }
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

        TB_GiaGoc.Attributes["onChange"] = "javascript:return Calculator_GiaBan();";
        TB_GiamGia.Attributes.Add("OnChange", "javascript:return Calculator_GiaBan();");
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
        DDL_Type.SelectedIndex = 0;
    }

    protected void OnRowData_Product(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteProduct");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
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
        TB_GiaGoc.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_PriceOriginalItem")).Text;
        TB_GiaBan.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_PriceSaleItem")).Text;
        TB_GiamGia.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_PriceDiscountItem")).Text;
        TB_SoLuongCo.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_QuantityInItem")).Text;
        TB_SoLuongBan.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_QuantityBoughtItem")).Text;
        TB_PartImage.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_LinkImageProductItem")).Text;
        IMG_Upload.ImageUrl = "../Images/ImageProduct/" + TB_PartImage.Value;
        TB_MoTa.Text = ((Label)Grid_Product.SelectedRow.FindControl("LBL_DescriptionItem")).Text;
        FCKeditor.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_DetailsItem")).Text;
        HD_TypeID_Product.Value = ((Label)Grid_Product.SelectedRow.FindControl("LBL_TypeItem")).Text;
        DDL_Type.SelectedValue = HD_TypeID_Product.Value;
    }

    protected void BT_AddProduct_Click(object sender, EventArgs e)
    {
        HD_ID_Product.Value = "0";
        DIV_AddEditProduct.Visible = true;
        set_Text_Product();

        DDL_TheLoai.SelectedValue = Convert.ToString(HD_Select_CategoryID.Value);
        //WebMsgBox.Show(Convert.ToString(category_id));
    }

    protected void BT_SubmitProduct_Click(object sender, EventArgs e)
    {
        int CategoryID = Convert.ToInt32(DDL_TheLoai.SelectedValue.ToString());
<<<<<<< .mine
        string NameProduct = HtmlRemoval.StripTagsRegex(TB_TenSanPham.Text.Trim());
        string ProductCode = HtmlRemoval.StripTagsRegex(TB_MaSanPham.Text.Trim());
        float GiaGoc;
        if (TB_GiaGoc.Text.Trim() == "")
=======
        if (CategoryID == 0)
>>>>>>> .r27
        {
            WebMsgBox.Show("Bạn phải chọn thể loại sản phẩm");
            LBL_Cate.Visible = true;
            DDL_TheLoai.SelectedValue = "0";
        }
        else
        {
<<<<<<< .mine
            GiaGoc = Convert.ToInt32(TB_GiaGoc.Text.Trim());
        }
        float GiaBan;
        if (TB_GiaBan.Text.Trim() == "")
        {
            GiaBan = 0;
        }
        else
        {
            GiaBan = Convert.ToInt32(TB_GiaBan.Text.Trim());
        }
        int GiamGia;
        if (TB_GiamGia.Text.Trim() == "")
        {
            GiamGia = 0;
        }
        else
        {
            GiamGia = Convert.ToInt32(TB_GiamGia.Text.Trim());
        }
        int QuantityInProduct;
        if (TB_SoLuongCo.Text.Trim() == "")
        {
            QuantityInProduct = 0;
        }
        else
        {
            QuantityInProduct = Convert.ToInt32(TB_SoLuongCo.Text.Trim());
        }
        int QuantitySalesProduct = 0;
        if (TB_SoLuongBan.Text.Trim() == "")
        {
            QuantitySalesProduct = 0;
        }
        else
        {
            QuantitySalesProduct = Convert.ToInt32(TB_SoLuongBan.Text.Trim());
        }
        string PartImage = TB_PartImage.Value.Trim();
        string DescriptionProduct = TB_MoTa.Text.Trim();
        string Details = FCKeditor.Value.Trim();
        int Type = Convert.ToInt32(DDL_Type.SelectedValue.ToString());
        if (Convert.ToInt32(HD_ID_Product.Value) != 0)
        {
            if (ToolsAdmin.Update_Product(Convert.ToInt32(HD_ID_Product.Value), CategoryID, NameProduct, ProductCode, GiaGoc, GiaBan, GiamGia, QuantityInProduct, QuantitySalesProduct, PartImage, DescriptionProduct, Details, Type))
=======
            LBL_Cate.Visible = false;
            string NameProduct = HtmlRemoval.StripTagsRegex(TB_TenSanPham.Text.Trim());
            string ProductCode = HtmlRemoval.StripTagsRegex(TB_MaSanPham.Text.Trim());
            double GiaGoc;
            if (TB_GiaGoc.Text.Trim() == "")
>>>>>>> .r27
            {
                GiaGoc = 0;
            }
            else
            {
                GiaGoc = Convert.ToDouble(TB_GiaGoc.Text.Trim());
            }
            double GiaBan;
            if (TB_GiaBan.Text.Trim() == "")
            {
                GiaBan = 0;
            }
            else
            {
                GiaBan = Convert.ToDouble(TB_GiaBan.Text.Trim());
            }
            int GiamGia;
            if (TB_GiamGia.Text.Trim() == "")
            {
                GiamGia = 0;
            }
            else
            {
                GiamGia = Convert.ToInt32(TB_GiamGia.Text.Trim());
            }
            int QuantityInProduct;
            if (TB_SoLuongCo.Text.Trim() == "")
            {
                QuantityInProduct = 0;
            }
            else
            {
                QuantityInProduct = Convert.ToInt32(TB_SoLuongCo.Text.Trim());
            }
            int QuantitySalesProduct = 0;
            if (TB_SoLuongBan.Text.Trim() == "")
            {
                QuantitySalesProduct = 0;
            }
            else
            {
                QuantitySalesProduct = Convert.ToInt32(TB_SoLuongBan.Text.Trim());
            }
            string PartImage = TB_PartImage.Value.Trim();
            string DescriptionProduct = TB_MoTa.Text.Trim();
            string Details = FCKeditor.Value.Trim();
            int Type = Convert.ToInt32(DDL_Type.SelectedValue.ToString());
            if (Convert.ToInt32(HD_ID_Product.Value) != 0)
            {
                if (ToolsAdmin.Update_Product(Convert.ToInt32(HD_ID_Product.Value), CategoryID, NameProduct, ProductCode, GiaGoc, GiaBan, GiamGia, QuantityInProduct, QuantitySalesProduct, PartImage, DescriptionProduct, Details, Type))
                {
                    HD_Select_CategoryID.Value = DDL_SearchCategory.SelectedValue;
                    if (Convert.ToInt32(HD_Select_CategoryID.Value) == 0)
                    {
                        set_Text_Product();
                        DIV_AddEditProduct.Visible = false;
                        Load_Grid_Products();
                    }
                    else
                    {
                        set_Text_Product();
                        DIV_AddEditProduct.Visible = false;
                        Load_SearchProduct_ByCategory();
                    }
                }
                else
                {
                    WebMsgBox.Show("Error Update");
                }
            }
            else if (Convert.ToInt32(HD_ID_Product.Value) == 0)
            {
                if (ToolsAdmin.Insert_Product(Convert.ToInt32(HD_ID_Product.Value), CategoryID, NameProduct, ProductCode, GiaGoc, GiaBan, GiamGia, QuantityInProduct, QuantitySalesProduct, PartImage, DescriptionProduct, Details, Type))
                {
                    HD_Select_CategoryID.Value = DDL_SearchCategory.SelectedValue;
                    if (Convert.ToInt32(HD_Select_CategoryID.Value) == 0)
                    {
                        set_Text_Product();
                        DIV_AddEditProduct.Visible = false;
                        Load_Grid_Products();
                    }
                    else
                    {
                        set_Text_Product();
                        DIV_AddEditProduct.Visible = false;
                        Load_SearchProduct_ByCategory();
                    }
                }
                else
                {
                    WebMsgBox.Show("Error Insert");
                }
            }
            //TB_SearchProduct.Text = "";
            set_Hidden_DIVProduct();
        }
<<<<<<< .mine
        //TB_SearchProduct.Text = "";
        set_Hidden_DIVProduct();
=======
>>>>>>> .r27
    }

    protected void BT_Upload_Click(object sender, EventArgs e)
    {
        string uploadPath = Server.MapPath("../Images/ImageProduct/");
        if (FileUpload_Image.HasFile)
        {
            string filename = FileUpload_Image.FileName;
            string extension = System.IO.Path.GetExtension(filename);
            string savefile = uploadPath + "\\" + filename;
            try
            {
                FileUpload_Image.SaveAs(savefile);
                IMG_Upload.ImageUrl = "../Images/ImageProduct/" + filename;
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
        DDL_TheLoai.Items.Clear();
        DDL_TheLoai.DataSource = ToolsAdmin1.Load_Category().Tables[0];
        DDL_TheLoai.DataValueField = "ID";
        DDL_TheLoai.DataTextField = "Category_Name";
        DDL_TheLoai.DataBind();
        DDL_TheLoai.Items.Insert(0, "");
        DDL_TheLoai.Items[0].Value = "0";
    }

    public void Load_DDL_SearchCategory()
    {
        DDL_SearchCategory.Items.Clear();
        DDL_SearchCategory.DataSource = ToolsAdmin1.Load_Category().Tables[0];
        DDL_SearchCategory.DataValueField = "ID";
        DDL_SearchCategory.DataTextField = "Category_Name";
        DDL_SearchCategory.DataBind();
        DDL_SearchCategory.Items.Insert(0, "");
        DDL_SearchCategory.Items[0].Value = "0";
    }

    public void Load_DDL_Type()
    {
        //DDL_Type.Items.Clear();
        DDL_Type.Items.Insert(0, "Hot");
        DDL_Type.Items[0].Value = "0";
        DDL_Type.Items.Insert(1, "New");
        DDL_Type.Items[1].Value = "1";
        DDL_Type.Items.Insert(2, "Normal");
        DDL_Type.Items[2].Value = "2";
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVProduct();
        set_Text_Product();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
<<<<<<< .mine
        category_id = Convert.ToInt32(DDL_SearchCategory.SelectedValue);
        if (category_id == 0)
        {
            Load_Grid_Products();
        }
        else
        {
            Load_SearchProduct_ByCategory();
        }
=======
        HD_Select_CategoryID.Value = DDL_SearchCategory.SelectedValue;
        if (Convert.ToInt32(HD_Select_CategoryID.Value) == 0)
        {
            set_Text_Product();
            DIV_AddEditProduct.Visible = false;
            Load_Grid_Products();
        }
        else
        {
            set_Text_Product();
            DIV_AddEditProduct.Visible = false;
            Load_SearchProduct_ByCategory();
        }
>>>>>>> .r27
    }

    public void Load_SearchProduct_ByCategory()
    {
<<<<<<< .mine
        Grid_Product.DataSource = ToolsAdmin.Load_SearchProduct_ByName(category_id).Tables[0];
=======
        Grid_Product.DataSource = ToolsAdmin.Load_SearchProduct_ByName(Convert.ToInt32(HD_Select_CategoryID.Value)).Tables[0];
>>>>>>> .r27
        Grid_Product.DataBind();
    }
}