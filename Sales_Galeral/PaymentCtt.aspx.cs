using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Configuration;

public partial class PaymentCtt : System.Web.UI.Page
{
    ClientProductBAL productBAL = new ClientProductBAL();
    ClientBillBAL billBAL = new ClientBillBAL();
    ClientAboutBAL aboutBAL = new ClientAboutBAL();
    static int tpPM = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request.QueryString["type"];
        if (type != null)
        {
            if (type.Equals("bank"))
            {
                lblTypePay.Text = "Chuyển khoản trực tiếp";
                tpPM = 1;
            }
            if (type.Equals("cash"))
            {
                lblTypePay.Text = "Thanh toán cho người giao hàng";
                tpPM = 2;
            }
            if (!IsPostBack)
            {
                loadDatabse();
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

    protected void btnContinuos_Click(object sender, EventArgs e)
    {
        pnlConfirm.Visible = false;
        pnlFinish.Visible = true;
        ShopCart Cart = (ShopCart)Session["ShopCart"];
        int idCustomer = Convert.ToInt32(Session["IDClient"].ToString());
        DateTime datePurchase = DateTime.Now;
        string allNameProduct = Cart.getAllNameProduct();
        int totalQuantity = Cart.TotalQuantity();
        double totalMoney = Cart.TotalAmount;
        bool status = false;
        int idBill = billBAL.InsertBill(idCustomer, datePurchase, allNameProduct, totalQuantity, totalMoney, tpPM, status);


        foreach (DataRow row in Cart.Rows)
        {
            int quantityOut = Convert.ToInt32(row["Quantity"].ToString());
            int idProduct = Convert.ToInt32(row["ID"].ToString());
            string namePr = row["Name"].ToString();
            double price = Convert.ToDouble(row["Price_Sale"].ToString());
            double ttPrice = Convert.ToDouble(row["Amount"].ToString());
            billBAL.InsertShopCart(idBill, namePr, price, quantityOut, ttPrice);
            productBAL.Update_Quantity(idProduct, quantityOut);
        }
        if (idBill != -1)
        {

            if (Session["UserClient"] != "" && Session["UserClient"] != null)
            {
                SendInforTransaction(Session["UserClient"].ToString(), idBill, datePurchase, allNameProduct, totalQuantity, totalMoney);
            }

        }

        Cart.RemoveAll();
        LinkButton quantity = (LinkButton)Master.FindControl("lbtn_Cart");
        quantity.Text = String.Format("Cart ({0}) item", Cart.TotalQuantity());
        lblInfo.Text = aboutBAL.GetAllType_Payment_By_ID(tpPM).Rows[0][2].ToString();
    }

    public void SendInforTransaction(string userName, int idBill, DateTime datePurchase, string allNameProduc, int totalQuantity, double totalMoney)
    {
        MailMessage feedBack = new MailMessage();
        feedBack.To.Add(ConfigurationManager.AppSettings["EmailComtact"].ToString());
        feedBack.From = new MailAddress(ConfigurationManager.AppSettings["EmailComtact"].ToString());
        feedBack.Subject = "Đơn hàng của khách: " + userName;
        feedBack.Body = "Tên khách hàng: " + userName + "<br /><br />Mã Số Bill: " + idBill.ToString() + "<br/> Ngày đặt hàng :" + datePurchase.ToShortDateString() +
                        "<br/> Danh sách sản phẩm: " + allNameProduc + "<br/>Tổng sô lượng sản phẩm: " + totalQuantity + "<br/> Tông số tiền: " + totalMoney.ToString() +
                        "<br/><b> Vui lòng kiểm tra hóa đơn để biết thêm chi tiết. ";
        feedBack.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
        smtp.Port = 587;
        smtp.EnableSsl = true;
        smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["EmailComtact"].ToString(), ConfigurationManager.AppSettings["PasswordEmailContact"].ToString());
        smtp.Send(feedBack);
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
                lblMessage.Text = "Quantity Out Of Range In Stock: " + quantityInstock.ToString();
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}