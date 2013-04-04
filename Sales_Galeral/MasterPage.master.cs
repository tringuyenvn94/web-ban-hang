using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Text;

public partial class MasterPage : System.Web.UI.MasterPage
{
    ClientProductBAL productBAL = new ClientProductBAL();
    ClientAccountBAL accountBAL = new ClientAccountBAL();
    LinkBAL ToolsAdmin = new LinkBAL();
    SupportOnlineBAL ToolsAdmin1 = new SupportOnlineBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["UName"] != null)
                username_querry.Value = Request.Cookies["UName"].Value;
            if (Request.Cookies["PWD"] != null)
                password_querry.Attributes.Add("value", Request.Cookies["PWD"].Value);
            if (Request.Cookies["UName"] != null && Request.Cookies["PWD"] != null)
                cbxRemember.Checked = true;
            Load_Lienket();
            Load_SupportOnline();
            DataListMenu.DataSource = productBAL.GetAllCategory();
            DataListMenu.DataBind();
        } 
      
        if (Session["UserClient"] != "" && Session["UserClient"] !=null)
        {
            MultiView1.ActiveViewIndex = 1;
            lbtn_Account.Text = Session["UserClient"].ToString();
        }
        else
        {
            MultiView1.ActiveViewIndex = 0;
        }
        ShopCart Cart = (ShopCart)Session["ShopCart"];
        if (Cart.Count > 0)
        {
            lbtn_Cart.Text = String.Format("Cart: ({0}) sản phẩm", Cart.TotalQuantity());
        }
        else
        {
            lbtn_Cart.Text = "CART:(EMPTY)";
        }
    }

    protected void lbtn_Register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
   
    protected void lbtn_Cart_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShoppingCart.aspx");
    }

    protected void lbtn_Account_Click(object sender, EventArgs e)
    {
        if (Session["IDClient"] != "")
        {
            Response.Redirect("User.aspx?id=" + Session["IDClient"].ToString());
        }
    }

    protected void lbtn_login_Click(object sender, EventArgs e)
    {
        string userName = username_querry.Value;
        string password = password_querry.Value;
        DataRow drow = accountBAL.AuthenticateAccount(userName, password);
        if (drow != null)
        {
            
            Session["UserClient"] = userName;
            Session["IDClient"] = drow["ID"].ToString();
            if (cbxRemember.Checked == true)
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
            FormsAuthentication.RedirectFromLoginPage(userName, false);
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

    protected void lbtn_Exit_Click(object sender, EventArgs e)
    {
        Session["UserClient"] = "";
        MultiView1.ActiveViewIndex = 0;
        Response.Redirect("Default.aspx");
    }

    public void Load_Lienket() {
        DTL_ShowLienKet.DataSource = ToolsAdmin.Load_Link().Tables[0];
        DTL_ShowLienKet.DataBind();
        DTL_ShowLienKet.Dispose();
    }

    public void Load_SupportOnline()
    {
        DTL_ShowOnline.DataSource = ToolsAdmin1.Load_SupportOnline().Tables[0];
        DTL_ShowOnline.DataBind();
        DTL_ShowOnline.Dispose();
    }
}
