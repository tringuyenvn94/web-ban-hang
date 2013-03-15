using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for ShoppingCartDAL
/// </summary>
public class ShoppingCartDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public ShoppingCartDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Shopping Cart
    public DataSet Load_ShoppingCart()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_ShoppingCart";
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

    //Update and Insert Shopping Cart
    public bool Update_ShoppingCart(int id, int Bill_ID, string NameProduct, double PriceProduct, int Quantity, double TotalMoneyProduct)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_ShoppingCart";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Bill_ID = command.Parameters.Add("@Bill_ID", SqlDbType.Int);
                pr_Bill_ID.Value = Bill_ID;
                SqlParameter pr_NameProduct = command.Parameters.Add("@NameProduct", SqlDbType.NVarChar);
                pr_NameProduct.Value = NameProduct;
                SqlParameter pr_PriceProduct = command.Parameters.Add("@PriceProduct", SqlDbType.Float);
                pr_PriceProduct.Value = PriceProduct;
                SqlParameter pr_Quantity = command.Parameters.Add("@Quantity", SqlDbType.Int);
                pr_Quantity.Value = Quantity;
                SqlParameter pr_TotalMoneyProduct = command.Parameters.Add("@TotalMoneyProduct", SqlDbType.Float);
                pr_TotalMoneyProduct.Value = TotalMoneyProduct;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_ShoppingCart";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Bill_ID = command.Parameters.Add("@Bill_ID", SqlDbType.Int);
                pr_Bill_ID.Value = Bill_ID;
                SqlParameter pr_NameProduct = command.Parameters.Add("@NameProduct", SqlDbType.NVarChar);
                pr_NameProduct.Value = NameProduct;
                SqlParameter pr_PriceProduct = command.Parameters.Add("@PriceProduct", SqlDbType.Float);
                pr_PriceProduct.Value = PriceProduct;
                SqlParameter pr_Quantity = command.Parameters.Add("@Quantity", SqlDbType.Int);
                pr_Quantity.Value = Quantity;
                SqlParameter pr_TotalMoneyProduct = command.Parameters.Add("@TotalMoneyProduct", SqlDbType.Float);
                pr_TotalMoneyProduct.Value = TotalMoneyProduct;
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

    //Delete Shopping Cart By ID
    public bool Delete_ShoppingCart(int ID)
    {
        try
        {
            string commandText = "SP_Delete_ShoppingCart";
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
}