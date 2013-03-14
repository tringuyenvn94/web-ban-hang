using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CategoryBAL
/// </summary>
public class CategoryBAL
{
	public CategoryBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Category
    public DataSet Load_Category()
    {
        return new CategoryDAL().Load_Category();
    }

    //Update Categories
    public bool Update_Category(string Category_Name, int id)
    {
        return new CategoryDAL().Update_Category(Category_Name, id);
    }

    //Delete Product when Delete Category
    public bool delete_Product_WhenDeleteCategory(int Cattegory_ID)
    {
        return new CategoryDAL().delete_Product_WhenDeleteCategory(Cattegory_ID);
    }

    //Delete Category
    public bool delete_Category(int ID)
    {
        return new CategoryDAL().delete_Category(ID);
    }
}