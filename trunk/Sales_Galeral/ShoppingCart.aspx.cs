using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingCart : System.Web.UI.Page
{
    ClientProductBAL productBAL = new ClientProductBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        loadDatabse();
    }

    protected void grvProductCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "removeItemInCart")
        {
            ShopCart Cart = (ShopCart)Session["ShopCart"];
            int id = Convert.ToInt32(e.CommandArgument);
            Cart.Remove(id);
            loadDatabse();
            Response.Redirect(Request.Url.ToString());
        }
        else if (e.CommandName == "updateQuantityInCart")
        {
            ShopCart Cart = (ShopCart)Session["ShopCart"];
            int idProduct = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            TextBox txtsn = ((TextBox)row.FindControl("tbxQuantity"));
            int quantity = Convert.ToInt32(txtsn.Text);
            int quantityInstock = productBAL.CompareQuantityInAndOut(idProduct, quantity);
            if (quantityInstock == -1) //-1 neu so luong mua < so luong con trong kho
            {
                Cart.Update(idProduct, quantity);
                loadDatabse();
                Response.Redirect(Request.Url.ToString());
            }
            else
            {
                messageStatus.Visible = true;
                lblMessage.Text = "Số lượng trong kho còn: " + quantityInstock.ToString() + " !Vui lòng chọn lại";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void loadDatabse()
    {
        ShopCart Cart = (ShopCart)Session["ShopCart"];
        grvItemShopping.DataSource = Cart;
        grvItemShopping.DataBind();
        lblTotalPrice.Text = FunctionLibrary.DisplayPrice(Cart.TotalAmount);
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx");
    }
}