using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for ProductDAL
/// </summary>
public class ProductDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public ProductDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Product
    public DataSet Load_Product()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Product";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dset);
            return dset;
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return null;
    }

    //Update and Product
    public bool Update_Product(int id, int CategoryID, string Name, string ProductCode, double PriceOriginal, double PriceSale, double PriceDiscount, int QuantityIn, int QuantityBought, string Image, string Description, string Details, int Type)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_Product";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_CategoryID = command.Parameters.Add("@Category_ID", SqlDbType.Int);
                pr_CategoryID.Value = CategoryID;
                SqlParameter pr_ProductName = command.Parameters.Add("@Name", SqlDbType.NVarChar);
                pr_ProductName.Value = Name;
                SqlParameter pr_ProductCode = command.Parameters.Add("@Product_Code", SqlDbType.NVarChar);
                pr_ProductCode.Value = ProductCode;
                SqlParameter pr_PriceOriginal = command.Parameters.Add("@Price_Original", SqlDbType.Float);
                pr_PriceOriginal.Value = PriceOriginal;
                SqlParameter pr_PriceSale = command.Parameters.Add("@Price_Sale", SqlDbType.Float);
                pr_PriceSale.Value = PriceSale;
                SqlParameter pr_PriceDiscount = command.Parameters.Add("@Price_Discount", SqlDbType.Float);
                pr_PriceDiscount.Value = PriceDiscount;
                SqlParameter pr_QuantityIn = command.Parameters.Add("@Quantity_In", SqlDbType.Int);
                pr_QuantityIn.Value = QuantityIn;
                SqlParameter pr_QuantityBought = command.Parameters.Add("@Quantity_Bought", SqlDbType.Int);
                pr_QuantityBought.Value = QuantityBought;
                SqlParameter pr_Image = command.Parameters.Add("@Image", SqlDbType.NVarChar);
                pr_Image.Value = Image;
                SqlParameter pr_Description = command.Parameters.Add("@Description", SqlDbType.NVarChar);
                pr_Description.Value = Description;
                SqlParameter pr_Details = command.Parameters.Add("@Details", SqlDbType.NText);
                pr_Details.Value = Details;
                SqlParameter pr_Type = command.Parameters.Add("@TYPE", SqlDbType.Int);
                pr_Type.Value = Type;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
        }
        catch (SqlException ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }

    //Insert Product
    public bool Insert_Product(int id, int CategoryID, string Name, string ProductCode, double PriceOriginal, double PriceSale, double PriceDiscount, int QuantityIn, int QuantityBought, string Image, string Description, string Details, int Type)
    {
        try
        {
            if (id == 0)
            {
                string commandText = "SP_Insert_Product";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_CategoryID = command.Parameters.Add("@Category_ID", SqlDbType.Int);
                pr_CategoryID.Value = CategoryID;
                SqlParameter pr_ProductName = command.Parameters.Add("@Name", SqlDbType.NVarChar);
                pr_ProductName.Value = Name;
                SqlParameter pr_ProductCode = command.Parameters.Add("@Product_Code", SqlDbType.NVarChar);
                pr_ProductCode.Value = ProductCode;
                SqlParameter pr_PriceOriginal = command.Parameters.Add("@Price_Original", SqlDbType.Float);
                pr_PriceOriginal.Value = PriceOriginal;
                SqlParameter pr_PriceSale = command.Parameters.Add("@Price_Sale", SqlDbType.Float);
                pr_PriceSale.Value = PriceSale;
                SqlParameter pr_PriceDiscount = command.Parameters.Add("@Price_Discount", SqlDbType.Float);
                pr_PriceDiscount.Value = PriceDiscount;
                SqlParameter pr_QuantityIn = command.Parameters.Add("@Quantity_In", SqlDbType.Int);
                pr_QuantityIn.Value = QuantityIn;
                SqlParameter pr_QuantityBought = command.Parameters.Add("@Quantity_Bought", SqlDbType.Int);
                pr_QuantityBought.Value = QuantityBought;
                SqlParameter pr_Image = command.Parameters.Add("@Image", SqlDbType.NVarChar);
                pr_Image.Value = Image;
                SqlParameter pr_Description = command.Parameters.Add("@Description", SqlDbType.NVarChar);
                pr_Description.Value = Description;
                SqlParameter pr_Details = command.Parameters.Add("@Details", SqlDbType.NText);
                pr_Details.Value = Details;
                SqlParameter pr_Type = command.Parameters.Add("@TYPE", SqlDbType.Int);
                pr_Type.Value = Type;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Direction = ParameterDirection.Output;
                int row = command.ExecuteNonQuery();
                return true;
            }
        }
        catch (SqlException ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }

    //Delete Product By ID
    public bool Delete_Product(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Product";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
            prID.Value = ID;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                return true;
            }
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }

    //Load Dop Down Category for Product
    public DataSet Load_DDL_Category()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_Get_DDL_Category";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dset);
            return dset;
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return null;
    }
}