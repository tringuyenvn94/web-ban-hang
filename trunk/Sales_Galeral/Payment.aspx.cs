using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Text;
using System.Web.Services;

public partial class Payment : System.Web.UI.Page
{
    ClientProductBAL productBAL = new ClientProductBAL();
   static ClientAccountBAL accountBAL = new ClientAccountBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserClient"] == "")
        {
            pnlPayment.Visible = false;
            pnlRegis.Visible = true;
        }
        else
        {
            pnlPayment.Visible = true;
            pnlRegis.Visible = false;
        }
       
            loadDatabse();
            bindRdioList();
      
    }

    private void bindRdioList()
    {
        rdobtList.DataSource = productBAL.GetTypePayment();
        rdobtList.DataTextField = "Title_Info";
        rdobtList.DataValueField = "ID";
        rdobtList.DataBind();
        if (rdobtList.Items.Count > 0) {
            rdobtList.Items[0].Selected = true;
        }
    }

    protected void btnLogg_Click(object sender, EventArgs e)
    {
        string userName = tbxUsername.Text;
        string password = tbxPassw.Text;
        DataRow drow = accountBAL.AuthenticateAccount(userName, password);
        if (drow != null)
        {

            Session["UserClient"] = userName;
            Session["IDClient"] = drow["ID"].ToString();
            if (chkbxRMB.Checked == true)
            {
                Response.Cookies["UName"].Value = userName;
                Response.Cookies["PWD"].Value = password;
                Response.Cookies["UName"].Expires = DateTime.Now.AddMonths(2);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddMonths(2);

            }
            else
            {
                Response.Cookies["UName"].Expires = DateTime.Now.AddMonths(-1);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddMonths(-1);
            }
            pnlPayment.Visible = true;
            pnlRegis.Visible = false;

        }
        else
        {
            ShowPopUpMsg("Tên đăng nhập hoặc mật khẩu sai.");
        }
    }
    private void ShowPopUpMsg(string psmsg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(psmsg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtPass.Text = "";
        txtConfirmPass.Text = "";
        txtName.Text = "";
        rdbMale.Checked = true;
        txtPhone.Text = "";
        txtAddress.Text = "";
        txtEmail.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            // validate the Captcha to check we're not dealing with a bot
            bool isHuman = SampleCaptcha.Validate(CaptchaCodeTextBox.Text);
            CaptchaCodeTextBox.Text = null; // clear previous user input
            if (!isHuman)
            {
                // TODO: Captcha validation failed, show error message  
                lblError.Text = "Incorrect";
            }
            else
            { // TODO: Captcha validation passed, proceed with protected action  
                string userName = txtUserName.Text;
                string name = txtName.Text;
                bool gender = Getgender();
                string phone = txtPhone.Text;
                string address = txtAddress.Text;
                string email = txtEmail.Text;
                if (IsUserAvailable(userName) == true && IsEmailAvailable(email) == true)
                {
                    string pass = EnscryptionPassword();
                    if (pass != "null")
                    {
                        int idCustomer = accountBAL.InsertCustomer(userName, pass, name, gender, phone, address, email);
                      
                        Session["UserClient"] = userName;
                        Session["IDClient"] = idCustomer;
                    }

                }
                else if (IsUserAvailable(userName) == false)
                {
                    lblAccountInfor.ForeColor = System.Drawing.Color.Red;
                    lblAccountInfor.Text = "Tên đăng nhập đã tồn tại";
                }
                else if (IsEmailAvailable(email) == false)
                {
                    lblUserInfor.ForeColor = System.Drawing.Color.Red;
                    lblUserInfor.Text = "Email đã tồn tại";
                }
            }
        }
    }
    public string EnscryptionPassword()
    {
        if (txtPass.Text.Equals(txtConfirmPass.Text))
        {
            return new Encryption().Encrypt(FunctionLibrary.KEY_ENSCRYPTION, txtPass.Text.ToString());
        }
        return "null";
    }

    public bool Getgender()
    {
        if (rdbFemale.Checked)
        {
            return false;
        }
        return true;
    }

    [WebMethod]
    public static bool IsUserAvailable(string userName)
    {
        if (accountBAL.CheckUserName(userName) == true)
            return true;
        return false;
    }

    [WebMethod]
    public static bool IsEmailAvailable(string email)
    {
        if (accountBAL.CheckEmail(email) == true)
            return true;
        return false;
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

    protected void loadDatabse()
    {
        ShopCart Cart = (ShopCart)Session["ShopCart"];
        grvItemShopping.DataSource = Cart;
        grvItemShopping.DataBind();
        lblTotalPrice.Text = FunctionLibrary.DisplayPrice(Cart.TotalAmount);
    }
    protected void btnContinuos_Click(object sender, EventArgs e)
    {


        if (selectRDO.Equals("1"))
        {
            Response.Redirect("PaymentCtt.aspx?type=bank");
        }
        if (selectRDO.Equals("2"))
        {
            Response.Redirect("PaymentCtt.aspx?type=cash");
        }
        
    }

    static string selectRDO="";
    protected void rdobtList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdobtList.SelectedIndex == 0)
        {
            selectRDO="1";
        }
        if (rdobtList.SelectedIndex == 1)
        {
            selectRDO = "2";
        }
    }
}