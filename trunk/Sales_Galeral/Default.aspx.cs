using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private ClientProductBAL productlManager = new ClientProductBAL();

    protected void Page_Load(object sender, EventArgs e)
    {
        dtlHotProduct.DataSource = productlManager.GetTopHotDataProduct();
        dtlHotProduct.DataBind();

        dtlDealNew.DataSource = productlManager.GetTopNewDataProduct();
        dtlDealNew.DataBind();
    }
    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        ShopCart cart = (ShopCart)Session["ShopCart"];
        LinkButton lbtnAdd = (LinkButton)sender;
        int productID = int.Parse(lbtnAdd.CommandArgument);
        cart.Add(productID, 1);
        LinkButton quantity = (LinkButton)Master.FindControl("lbtn_Cart");
        quantity.Text = String.Format("Cart ({0}) item", cart.TotalQuantity());
    }
    
   
}