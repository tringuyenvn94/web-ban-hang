using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ShoppingCartBAL
/// </summary>
public class ShoppingCartBAL
{
	public ShoppingCartBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Shopping Cart
    public DataSet Load_ShoppingCart()
    {
        return new ShoppingCartDAL().Load_ShoppingCart();
    }

    //Update and Insert Shopping Cart
    public bool Update_ShoppingCart(int id, int Bill_ID, string NameProduct, double PriceProduct, int Quantity, double TotalMoneyProduct)
    {
        return new ShoppingCartDAL().Update_ShoppingCart(id, Bill_ID, NameProduct, PriceProduct, Quantity, TotalMoneyProduct);
    }

    //Delete Shopping Cart By ID
    public bool Delete_ShoppingCart(int ID)
    {
        return new ShoppingCartDAL().Delete_ShoppingCart(ID);
    }
}