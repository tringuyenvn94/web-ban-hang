using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentInfo : System.Web.UI.Page
{
    ClientAboutBAL ToolsAdmin = new ClientAboutBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadInforPayment();
        }
    }

    private void LoadInforPayment()
    {
        lblInfo.Text = ToolsAdmin.GetAllType_Payment().Rows[0][3].ToString();
    }
}