using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClientProductBAL
/// </summary>
public class ClientProductBAL
{
    ClientProductDAL productDAL = new ClientProductDAL();
	public ClientProductBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Load all records Product from database
    /// </summary>
    /// <returns></returns>
    public System.Data.DataTable GetAllDataProduct()
    {
        return productDAL.GetAllDataProduct();
    }

    /// <summary>
    /// Load all records Product from database
    /// </summary>
    /// <returns></returns>
    public System.Data.DataTable GetTopHotDataProduct()
    {
        return productDAL.Load_Top6_Hot_Product();
    }

    /// <summary>
    /// Load all records Product from database
    /// </summary>
    /// <returns></returns>
    public System.Data.DataTable LoadTypeProduct(int type)
    {
        return productDAL.LoadTypeProduct(type);
    }


    public System.Data.DataTable LoadProductByCate(int cate)
    {
        return productDAL.LoadProductByCate(cate);
    }

    /// <summary>
    /// Load all records Product from database
    /// </summary>
    /// <returns></returns>
    public System.Data.DataTable GetTopNewDataProduct()
    {
        return productDAL.Load_Top6_New_Product();
    }

    /// <summary>
    /// Load all records Category from database
    /// </summary>
    /// <returns></returns>
    public System.Data.DataTable GetAllCategory()
    {
        return productDAL.GetAllCategory();
    }

    /// <summary>
    /// Compare Quantity_In and Quantity_Out of Product
    /// </summary>
    /// <param name="id"> id parent category</param>
    /// <returns></returns>
    public int CompareQuantityInAndOut(int idProduct, int quantityOut)
    {
        int quantityIn = -1;
        DataTable dtbleTemp = productDAL.GetProductByID(idProduct);
        quantityIn = Convert.ToInt32(dtbleTemp.Rows[0][6].ToString());
        if (quantityIn < quantityOut)
        {
            return quantityIn;
        }
        return -1;
    }

    public System.Data.DataTable GetTypePayment()
    {
        return productDAL.GetTypePayment();
    }


    /// <summary>
    /// Get record Product by ID
    /// </summary>
    /// <param name="idProduct"></param>
    /// <returns></returns>
    public DataTable GetProductByID(int idProduct)
    {
        return productDAL.GetProductByID(idProduct);
    }


     public int Update_Quantity(int id, int quantity)
    {
        return productDAL.Update_Quantity(id, quantity);
    }
}