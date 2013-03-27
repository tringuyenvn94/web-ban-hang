using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

/// <summary>
/// Summary description for ClientShopCartDAL
/// </summary>
public class ClientShopCartDAL
{
    private ConnectClient connectDatabase = new ConnectClient();
    public DataTable dtblShopcart = new DataTable();
    public DataSet dsetShopcart = new DataSet();
    public SqlDataAdapter adapterShopcart;

	public ClientShopCartDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   

    /// <summary>
    /// Clear All Data In Dataset and DataTable
    /// </summary>
    /// <returns> </returns>
    public void ClearAllData()
    {
        dsetShopcart.Clear();
        dsetShopcart = new DataSet();
        dtblShopcart.Clear();
        dtblShopcart = new DataTable();
    }

    /// <summary>
    /// Fill Table Shopping Cart From Database To DataTable
    /// </summary>
    /// <param name="commandSql">Command Procedure SQL</param>
    /// <returns>Data Table</returns>
    public DataTable FillData(SqlCommand commandSql)
    {
        ClearAllData();
        adapterShopcart = new SqlDataAdapter(commandSql);
        adapterShopcart.Fill(dsetShopcart);
        dtblShopcart = dsetShopcart.Tables[0];
        commandSql.Connection.Close();
        return dtblShopcart;
    }

    /// <summary>
    /// Function Insert Bill To database
    /// </summary>
    /// <param name="custID"></param>
    /// <param name="datePurchase"></param>
    /// <param name="totalNamePr"></param>
    /// <param name="totalQtt"></param>
    /// <param name="totalMoney"></param>
    /// <param name="typePayment"></param>
    /// <param name="statusPayment"></param>
    /// <returns></returns>
    //public bool InsertShopcart(int idBill,int idProduct, string nameProduct, int quantity, double totalMoney)
    //{
    //    SqlConnection connect = connectDatabase.Connection();
    //    try
    //    {
    //        SqlCommand command = new SqlCommand("SP_Insert_ShoppingCart", connect);
    //        command.CommandType = CommandType.StoredProcedure;
    //        SqlParameter prBillID = command.Parameters.Add("@ID_Bill", SqlDbType.Int);
    //        prBillID.Value = idBill;
    //        SqlParameter prBillPr = command.Parameters.Add("@ID_Product", SqlDbType.Int);
    //        prBillPr.Value = idProduct;
    //        SqlParameter prnameProduct = command.Parameters.Add("@NameProduct", SqlDbType.NVarChar);
    //        prnameProduct.Value = nameProduct;
    //        SqlParameter prquantity = command.Parameters.Add("@Quantity", SqlDbType.Int);
    //        prquantity.Value = quantity;
         
    //        SqlParameter prTotalMoney = command.Parameters.Add("@TotalMoney", SqlDbType.Float);
    //        prTotalMoney.Value = totalMoney;
         
    //        SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
    //        prID.Direction = ParameterDirection.Output;
    //        int row = command.ExecuteNonQuery();
    //        if (row > 0)
    //        {
    //            idBill = Int32.Parse(prID.Value.ToString());                
    //            connect.Close();
    //            return true;
    //        }
    //        return true;
    //    }
    //    catch (System.Exception ex)
    //    {
    //        Debug.Print(ex.Message);
    //        return false;
    //    }

    //}

    //public bool UpdateStatusPayment(int idBill, bool statusPayment)
    //{
    //    SqlConnection connect = connectDatabase.Connection();
    //    try
    //    {
    //        SqlCommand command = new SqlCommand("SP_Update_Bill_Status_Payment", connect);
    //        command.CommandType = CommandType.StoredProcedure;
    //        SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
    //        prID.Value = idBill;
    //        SqlParameter prStatus = command.Parameters.Add("@Status_Payment", SqlDbType.Bit);
    //        prStatus.Value = statusPayment;
            
    //        int row = command.ExecuteNonQuery();
    //        if (row > 0)
    //        {
    //            connect.Close();
    //            return true;
    //        }
    //        return true;
    //    }
    //    catch (System.Exception ex)
    //    {
    //        Debug.Print(ex.Message);
    //        return false;
    //    }
    //}
    /// <summary>
    /// Get Infro Shopping Cart by ID Bill
    /// </summary>
    /// <param name="billID"></param>
    /// <returns></returns>
    //public DataTable GetShopCartBiBillID(int billID)
    //{
    //    DataTable dtlTemp = new DataTable();
    //    SqlCommand command = new SqlCommand("SP_GetShopCart_ByIDBill", connectDatabase.Connection());
    //    command.Parameters.AddWithValue("@BillID", billID);
    //    command.CommandType = CommandType.StoredProcedure;
    //    return dtlTemp = this.FillData(command);
    //}
}