using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DetailProduct : System.Web.UI.Page
{
   
    ClientProductBAL productBAL = new ClientProductBAL();
    DataTable dtableProduct = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        string idPr = Request.QueryString["idProduct"];
        if (idPr != null)
        {
            int idProduct = Convert.ToInt32(idPr);
            dtableProduct = productBAL.GetProductByID(idProduct);
            if (dtableProduct.Rows.Count > 0)
            {
                ShowValueProduct();               
              
            }
        }
        ShopCart cart = (ShopCart)Session["ShopCart"];
       if (cart.Count > 0)
            {
                lblQTtCart.Text = cart.TotalQuantity() + " sản phẩm";
                cart_block_total.Text = FunctionLibrary.DisplayPrice(cart.TotalAmount);

            }
            else
            {
                lblQTtCart.Text = "Không có sản phẩm nào";
                cart_block_total.Text = "0,00đ";
            }
       dtlNewPrd.DataSource = productBAL.GetTopNewDataProduct();
       dtlNewPrd.DataBind();
        
        
    }

    protected void ShowValueProduct()
    {
        lblNameProduct.Text = dtableProduct.Rows[0]["Name"].ToString();//column 2 is Name
        lblDescription.Text = dtableProduct.Rows[0]["Description"].ToString();
        double price = Convert.ToDouble(dtableProduct.Rows[0]["Price_Sale"].ToString());
        our_price_display.Text = FunctionLibrary.DisplayPrice(price);
        string nameImage = dtableProduct.Rows[0]["Image"].ToString();
        imgProduct.ImageUrl = "~//images//ImageProduct//" + nameImage;
        imgProduct.AlternateText = lblNameProduct.Text;
        lblDetails.Text = dtableProduct.Rows[0]["Details"].ToString();
    }
    protected void lbtnAdd_Click(object sender, EventArgs e)
    {
        ShopCart cart = (ShopCart)Session["ShopCart"];
        // LinkButton lbtnAdd = (LinkButton)sender;
        int productID = int.Parse(Request.QueryString["idProduct"].ToString());
        cart.Add(productID, Convert.ToInt32(tbxQtt.Text));
        LinkButton quantity = (LinkButton)Master.FindControl("lbtn_Cart");
        quantity.Text = String.Format("Shopping Cart ({0}) item", cart.TotalQuantity());
        lblQTtCart.Text = cart.TotalQuantity() + " sản phẩm";
        cart_block_total.Text = FunctionLibrary.DisplayPrice(cart.TotalAmount);
    }
}