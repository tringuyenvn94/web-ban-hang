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
        dtlHotProduct.DataSource = productlManager.GetTopHotDataProduct();
        dtlHotProduct.DataBind();

        DataTable dtbletemp= productlManager.GetTopNewDataProduct();
        dtlDealNew.DataSource = dtbletemp;
        dtlDealNew.DataBind();
        for (int i = 0; i < dtbletemp.Rows.Count; i++)
        {
            if (dtbletemp.Rows[i]["Price_Discount"].ToString().Equals("0"))
            {
                ((Control)dtlDealNew.Items[i].FindControl("giamgia")).Visible = false;
              //  ((Image)myDataList.Items[itemIndex].FindControl("imageid")).ImageUrl = "~/images/someImage.jpg";
            }
        }
   

    }

    static string lbtn1;
    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        ShopCart cart = (ShopCart)Session["ShopCart"];
        LinkButton lbtnAdd = (LinkButton)sender;
        int productID = int.Parse(lbtnAdd.CommandArgument);
        cart.Add(productID, 1);
        LinkButton quantity = (LinkButton)Master.FindControl("lbtn_Cart");

        quantity.Text = String.Format("Cart ({0}) item", cart.TotalQuantity());
        lbtn1 = lbtnAdd.ID;// .Attributes["ID"].ToString(); ;\
        
    }

    [WebMethod]
    public static string GetLinkButton()
    {
        return lbtn1;
    }
}