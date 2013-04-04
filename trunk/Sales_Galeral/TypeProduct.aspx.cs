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
    string type = null;
    string cate = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        type = Request.QueryString["type"];
        cate = Request.QueryString["categr"];
        if(!IsPostBack){
            Load_Product_type();
            Load_Product_cate();
        }
    }

    public void Load_Product_type() {
        int total;
        int pageview;
        int pagesize = 2;
        int du;
        int CurrentPage = 1;
        if (Request.QueryString["page"] == null) CurrentPage = 1;
        else CurrentPage = Convert.ToInt32(Request.QueryString["page"]);

        if (type != null)
        {
            dtble.Clear();
            dtble = pm.LoadTypeProduct(Convert.ToInt32(type), pagesize, CurrentPage);
            dtlTypeProduct.DataSource = dtble;
            dtlTypeProduct.DataBind();
            dtlTypeProduct.Dispose();
            total = get_Total_Product_Type();

            if (total > 0)
            {
                //tinh so trang hien thi pageview
                if (total % pagesize == 0) du = 0;
                else du = 1;
                pageview = total / pagesize + du;
                // hien thi so trang neu >1
                if (pageview > 1)
                {
                    List_Page(pageview, CurrentPage,Convert.ToInt32(type));
                }
            }

            for (int i = 0; i < dtble.Rows.Count; i++)
            {
                if (dtble.Rows[i]["Price_Discount"].ToString().Equals("0"))
                {
                    ((Control)dtlTypeProduct.Items[i].FindControl("giamgia")).Visible = false;
                    ((Control)dtlTypeProduct.Items[i].FindControl("giagoc")).Visible = false;
                }
            }
            type = null;
        }
    }

    public void Load_Product_cate() {
        int total;
        int pageview;
        int pagesize = 2;
        int du;
        int CurrentPage = 1;
        if (Request.QueryString["page"] == null) CurrentPage = 1;
        else CurrentPage = Convert.ToInt32(Request.QueryString["page"]);

        if (cate != null)
        {
            dtble.Clear();
            dtble = pm.LoadProductByCate(Convert.ToInt32(cate), pagesize, CurrentPage);
            dtlTypeProduct.DataSource = dtble;
            dtlTypeProduct.DataBind();

            total = get_Total_Product_Cate();

            if (total > 0)
            {
                //tinh so trang hien thi pageview
                if (total % pagesize == 0) du = 0;
                else du = 1;
                pageview = total / pagesize + du;
                // hien thi so trang neu >1
                if (pageview > 1)
                {
                    List_Page_1(pageview, CurrentPage, Convert.ToInt32(type));
                }
            }

            for (int i = 0; i < dtble.Rows.Count; i++)
            {
                if (dtble.Rows[i]["Price_Discount"].ToString().Equals("0"))
                {
                    ((Control)dtlTypeProduct.Items[i].FindControl("giamgia")).Visible = false;
                    ((Control)dtlTypeProduct.Items[i].FindControl("giagoc")).Visible = false;
                }
            }
            type = null;
            cate = null;
        }
    }

    private void List_Page(int iPageCount, int iCurrentPage, int id)
    {
        string chuoi = "Trang : ";
        int iSpace;
        int iQuickPage = 4; // so trang cho phep hien tren thanh phan tang
        int iStart;
        int iEnd;

        if (iCurrentPage % iQuickPage > 0) iSpace = (iCurrentPage / iQuickPage) + 1;
        else iSpace = (iCurrentPage / iQuickPage);

        if (iPageCount < iSpace * iQuickPage) iEnd = (iSpace * iQuickPage) - ((iSpace * iQuickPage) - iPageCount);
        else iEnd = (iSpace * iQuickPage);

        if (iEnd < iQuickPage) iStart = 1;
        else iStart = (iEnd - iQuickPage) + 1;

        if (iCurrentPage > iQuickPage)
        {
            if (iStart - 1 == iCurrentPage) chuoi += "<<<";
            else chuoi += "&nbsp;<a href =TypeProduct.aspx?type=" + type + "&page=" + (iStart - 1) + " onmouseover=window.status='';return true;><<<</a>";
        }

        for (int i = iStart; i <= iEnd; i++)
        {
            if (i == iCurrentPage) chuoi += "&nbsp;" + i;
            else chuoi += "&nbsp;<a class='PageLink'  href=TypeProduct.aspx?type=" + type + "&page=" + i + ">" + i + "</a>";
        }

        if (iCurrentPage < iPageCount && iEnd < iPageCount)
        {
            if (iCurrentPage == iEnd + 1) chuoi = "&nbsp;" + chuoi + ">>>";
            else chuoi += "&nbsp;<a href=TypeProduct.aspx?type=" + type + "&page=" + (iEnd + 1) + ">>>></a>";
        }
        LTR_page.Text = chuoi;
    }

    private void List_Page_1(int iPageCount, int iCurrentPage, int id)
    {
        string chuoi = "Trang : ";
        int iSpace;
        int iQuickPage = 4; // so trang cho phep hien tren thanh phan tang
        int iStart;
        int iEnd;

        if (iCurrentPage % iQuickPage > 0) iSpace = (iCurrentPage / iQuickPage) + 1;
        else iSpace = (iCurrentPage / iQuickPage);

        if (iPageCount < iSpace * iQuickPage) iEnd = (iSpace * iQuickPage) - ((iSpace * iQuickPage) - iPageCount);
        else iEnd = (iSpace * iQuickPage);

        if (iEnd < iQuickPage) iStart = 1;
        else iStart = (iEnd - iQuickPage) + 1;

        if (iCurrentPage > iQuickPage)
        {
            if (iStart - 1 == iCurrentPage) chuoi += "<<<";
            else chuoi += "&nbsp;<a href =TypeProduct.aspx?categr=" + cate + "&page=" + (iStart - 1) + " onmouseover=window.status='';return true;><<<</a>";
        }

        for (int i = iStart; i <= iEnd; i++)
        {
            if (i == iCurrentPage) chuoi += "&nbsp;" + i;
            else chuoi += "&nbsp;<a class='PageLink'  href=TypeProduct.aspx?categr=" + cate + "&page=" + i + ">" + i + "</a>";
        }

        if (iCurrentPage < iPageCount && iEnd < iPageCount)
        {
            if (iCurrentPage == iEnd + 1) chuoi = "&nbsp;" + chuoi + ">>>";
            else chuoi += "&nbsp;<a href=TypeProduct.aspx?categr=" + cate + "&page=" + (iEnd + 1) + ">>>></a>";
        }
        LTR_page_1.Text = chuoi;
    }

    public int get_Total_Product_Type()
    {
        return pm.get_Total_Product_Type(Convert.ToInt32(type));
    }

    public int get_Total_Product_Cate()
    {
        return pm.get_Total_Product_Cate(Convert.ToInt32(cate));
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