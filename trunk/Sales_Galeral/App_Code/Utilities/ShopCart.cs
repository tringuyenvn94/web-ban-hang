using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ShopCart
/// </summary>
public class ShopCart : DataTable
{
    public ShopCart()
    {
        this.Columns.Add("ID", typeof(int)).DefaultValue = -1;
        this.Columns.Add("Name", typeof(string)).DefaultValue = "";
        this.Columns.Add("Product_Code", typeof(string)).DefaultValue = "";
        this.Columns.Add("Image", typeof(string)).DefaultValue = "";
        this.Columns.Add("Price_Sale", typeof(double)).DefaultValue = 0;
        this.Columns.Add("Quantity", typeof(int)).DefaultValue = 1;
        this.Columns.Add("Amount", typeof(double), "Price_Sale*Quantity");
        this.PrimaryKey = new DataColumn[] { this.Columns["ID"] };
    }

    public void Add(int productID, int quantity)
    {
        this.AddProduct(productID, quantity, false);
    }

    public void Update(int productID, int quantity)
    {
        this.AddProduct(productID, quantity, true);
    }

    public void Remove(int productID)
    {
        try
        {
            DataRow drow = this.Rows.Find(productID);

            this.Rows.Remove(drow);
        }
        catch
        {
            Console.WriteLine("Product not found !");
        }
    }
    public void RemoveAll()
    {
        try
        {
            for (int i = this.Rows.Count - 1; i >= 0; i--)
            {
                this.Rows.RemoveAt(i);
            }

        }
        catch
        {
            Console.WriteLine("Product not found !");
        }
    }

    public double TotalAmount
    {
        get
        {
            object value = this.Compute("SUM(Amount)", "");
            return value == DBNull.Value ? 0 : (double)value;
        }
    }

    public int TotalQuantity()
    {
        int totalPrice = 0;
        foreach (DataRow row in this.Rows)
        {
            totalPrice += Convert.ToInt32(row["Quantity"].ToString());

        }
        return totalPrice;

    }
    public int Count
    {
        get
        {
            return this.Rows.Count;
        }
    }

    public string getAllNameProduct()
    {
        string allName = "";
        for (int i = 0; i < this.Rows.Count; i++)
        {
            allName += this.Rows[i]["Name"].ToString();
            if (i < (this.Rows.Count - 1))
            {
                allName += ", ";
            }
        }

        return allName;
    }

    private void AddProduct(int productID, int quantity, bool Update)
    {
        try
        {
            DataRow Item = this.Rows.Find(productID);
            Item["Quantity"] = quantity + (Update ? 0 : (int)Item["Quantity"]);
        }
        catch
        {
            String sql = "SELECT ID, Name,Product_Code, Image, Price_Sale," + quantity + " as Quantity_In FROM Product WHERE ID=@ID";
            FunctionLibrary.Fill(this, sql, "@ID", productID);
        }
    }

}