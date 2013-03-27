using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TypeProduct : System.Web.UI.Page
{
    ClientProductBAL pm = new ClientProductBAL();
    DataTable dtble = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = null;
        string cate = null;

        type = Request.QueryString["type"];
        if (type != null)
        {
            dtble.Clear();
            dtble = pm.LoadTypeProduct(Convert.ToInt32(type));
            dtlTypeProduct.DataSource = dtble;
            dtlTypeProduct.DataBind();
            type = null;
        }

        cate = Request.QueryString["categr"];
        if (cate != null)
        {
            dtble.Clear();
            dtble = pm.LoadProductByCate(Convert.ToInt32(cate));
            dtlTypeProduct.DataSource = dtble;
            dtlTypeProduct.DataBind();
            cate = null;
        }
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