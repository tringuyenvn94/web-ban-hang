using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for BillDAL
/// </summary>
public class BillDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public BillDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Bill
    public DataSet Load_Bill()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Bill";
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

    //Load Data Shop Cart By Click Bill ID
    public DataSet Load_ShopCart_ByClickBillID(int ID)
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_ShopCart_ByClickBillID";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
            pr_ID.Value = ID;
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

    //Update Bill
    public bool Update_Bill(int ID, int Customer_ID, int Type_Payment_ID, string Date_Purcharse, string TotalNameProduct, int TotalQuantity, double TotalMoney, bool Status_Payment)
    {
        try
        {
            string commandText = "SP_Update_Bill";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter pr_Customer_ID = command.Parameters.Add("@Customer_ID", SqlDbType.Int);
            pr_Customer_ID.Value = Customer_ID;
            SqlParameter pr_Type_Payment_ID = command.Parameters.Add("@Type_Payment_ID", SqlDbType.Int);
            pr_Type_Payment_ID.Value = Type_Payment_ID;
            SqlParameter pr_Date_Purcharse = command.Parameters.Add("@Date_Purcharse", SqlDbType.VarChar);
            pr_Date_Purcharse.Value = Date_Purcharse;
            SqlParameter pr_TotalNameProduct = command.Parameters.Add("@TotalNameProduct", SqlDbType.NVarChar);
            pr_TotalNameProduct.Value = TotalNameProduct;
            SqlParameter pr_TotalQuantity = command.Parameters.Add("@TotalQuantity", SqlDbType.Int);
            pr_TotalQuantity.Value = TotalQuantity;
            SqlParameter pr_TotalMoney = command.Parameters.Add("@TotalMoney", SqlDbType.Float);
            pr_TotalMoney.Value = TotalMoney;
            SqlParameter pr_Status_Payment = command.Parameters.Add("@Status_Payment", SqlDbType.Bit);
            pr_Status_Payment.Value = Status_Payment;
            SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
            pr_ID.Value = ID;
            int row = command.ExecuteNonQuery();
            return true;
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

    //When Delete Bill,need delete Shop Cart
    public bool Delete_Bill(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Bill";
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

    //Delete Shop Cart By ID_Bill
    public bool Delete_ShopCart_ByIDBill(int ID)
    {
        try
        {
            string commandText = "SP_Delete_ShoppingCart_By_IDBIll";
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