using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ProductBAL
/// </summary>
public class ProductBAL
{
	public ProductBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Product
    public DataSet Load_Product()
    {
        return new ProductDAL().Load_Product();
    }

    //Update and Product
    public bool Update_Product(int id, int CategoryID, string Name, string ProductCode, double PriceOriginal, double PriceSale, int PriceDiscount, int QuantityIn, int QuantityBought, string Image, string Description, string Details, int Type)
    {
        return new ProductDAL().Update_Product(id, CategoryID, Name, ProductCode, PriceOriginal, PriceSale, PriceDiscount, QuantityIn, QuantityBought, Image, Description, Details, Type);
    }

    //Insert Product
    public bool Insert_Product(int id, int CategoryID, string Name, string ProductCode, double PriceOriginal, double PriceSale, int PriceDiscount, int QuantityIn, int QuantityBought, string Image, string Description, string Details, int Type)
    {
        return new ProductDAL().Insert_Product(id, CategoryID, Name, ProductCode, PriceOriginal, PriceSale, PriceDiscount, QuantityIn, QuantityBought, Image, Description, Details, Type);
    }

    //Delete Product By ID
    public bool Delete_Product(int ID)
    {
        return new ProductDAL().Delete_Product(ID);
    }

    //Load Dop Down Category for Product
    public DataSet Load_DDL_Category()
    {
        return new ProductDAL().Load_DDL_Category();
    }

    //Search By Name Product
    public DataSet Load_SearchProduct_ByName(int Category_ID)
    {
        return new ProductDAL().Load_SearchProduct_ByName(Category_ID);
    }
}