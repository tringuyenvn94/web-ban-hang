using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

/// <summary>
/// Summary description for ClientBillDAL
/// </summary>
public class ClientBillDAL
{
    private ConnectClient connectDatabase = new ConnectClient();
    public DataTable dtblBill = new DataTable();
    public DataSet dsetBill = new DataSet();
    public SqlDataAdapter adapterBill;
	public ClientBillDAL()
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
        dsetBill.Clear();
        dsetBill = new DataSet();
        dtblBill.Clear();
        dtblBill = new DataTable();
    }

    /// <summary>
    /// Fill Table Bill From Database To DataTable
    /// </summary>
    /// <param name="commandSql">Command Procedure SQL</param>
    /// <returns>Data Table</returns>
    public DataTable FillData(SqlCommand commandSql)
    {
        ClearAllData();
        adapterBill = new SqlDataAdapter(commandSql);
        adapterBill.Fill(dsetBill);
        dtblBill = dsetBill.Tables[0];
        commandSql.Connection.Close();
        return dtblBill;
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
    public int InsertBill(int custID, DateTime datePurchase, string totalNamePr, int totalQtt, double totalMoney, int typePayment, bool statusPayment)
    {
        int idBill = -1;
        SqlConnection connect = connectDatabase.Connection();
        try
        {
            SqlCommand command = new SqlCommand("SP_Insert_Bill", connect);
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter prCustID = command.Parameters.Add("@Customer_ID", SqlDbType.Int);
            prCustID.Value = custID;
            SqlParameter prPassword = command.Parameters.Add("@Date_Purcharse", SqlDbType.DateTime);
            prPassword.Value = datePurchase;
            SqlParameter prName = command.Parameters.Add("@TotalNameProduct", SqlDbType.NVarChar);
            prName.Value = totalNamePr;
            SqlParameter prTotalQtt = command.Parameters.Add("@TotalQuantity", SqlDbType.Int);
            prTotalQtt.Value = totalQtt;
            SqlParameter prTotalMoney = command.Parameters.Add("@TotalMoney", SqlDbType.Float);
            prTotalMoney.Value = totalMoney;
            SqlParameter prTypePayment = command.Parameters.Add("@Type_Payment", SqlDbType.Int);
            prTypePayment.Value = typePayment;
            SqlParameter prPayment = command.Parameters.Add("@Status_Payment", SqlDbType.Bit);
            prPayment.Value = statusPayment;
            SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
            prID.Direction = ParameterDirection.Output;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                idBill = Int32.Parse(prID.Value.ToString());
                connect.Close();
                return idBill;
            }
            return idBill;
        }
        catch (System.Exception ex)
        {
            Debug.Print(ex.Message);
            return idBill;
        }

    }

    /// <summary>
    /// function get infor bill by Customer ID
    /// </summary>
    /// <param name="customerID"></param>
    /// <returns></returns>
    public DataTable GetBillByCustomerID(int customerID)
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetBill_ByID_CustomerID", connectDatabase.Connection());
        command.Parameters.AddWithValue("@Customer_ID", customerID);
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }
}