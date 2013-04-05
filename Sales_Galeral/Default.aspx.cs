using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    private ClientProductBAL productlManager = new ClientProductBAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dtlHotProduct.DataSource = productlManager.GetTopHotDataProduct();
            dtlHotProduct.DataBind();
            for (int i = 0; i < productlManager.GetTopHotDataProduct().Rows.Count; i++)
            {
                if (productlManager.GetTopHotDataProduct().Rows[i]["Price_Discount"].ToString().Equals("0"))
                {
                    ((Control)dtlHotProduct.Items[i].FindControl("giamgia")).Visible = false;
                    ((Control)dtlHotProduct.Items[i].FindControl("giagoc")).Visible = false;
                }
            }

            DataTable dtbletemp = productlManager.GetTopNewDataProduct();
            dtlDealNew.DataSource = dtbletemp;
            dtlDealNew.DataBind();
            for (int i = 0; i < dtbletemp.Rows.Count; i++)
            {
                if (dtbletemp.Rows[i]["Price_Discount"].ToString().Equals("0"))
                {
                    ((Control)dtlDealNew.Items[i].FindControl("giamgia")).Visible = false;
                    ((Control)dtlDealNew.Items[i].FindControl("giagoc")).Visible = false;
                }
            }

            dtlSanPhamThuong.DataSource = productlManager.Load_Top6_Thuong_Product();
            dtlSanPhamThuong.DataBind();
            for (int i = 0; i < productlManager.Load_Top6_Thuong_Product().Rows.Count; i++)
            {
                if (productlManager.Load_Top6_Thuong_Product().Rows[i]["Price_Discount"].ToString().Equals("0"))
                {
                    ((Control)dtlSanPhamThuong.Items[i].FindControl("giamgia")).Visible = false;
                    ((Control)dtlSanPhamThuong.Items[i].FindControl("giagoc")).Visible = false;
                }
            }
        }

    }

    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        ShopCart cart = (ShopCart)Session["ShopCart"];
        LinkButton lbtnAdd = (LinkButton)sender;
        int productID = int.Parse(lbtnAdd.CommandArgument);
        cart.Add(productID, 1);

        //Control c = this.Master.FindControl("thongbao");// "masterDiv"= the Id of the div.
        //c.Visible = false;//to set the div to be hidden.

        //     ((Control)Master.FindControl("thongbao")).Visible = true; 
        LinkButton quantity = (LinkButton)Master.FindControl("lbtn_Cart");
        quantity.Text = String.Format("Cart ({0}) item", cart.TotalQuantity());


    }


}