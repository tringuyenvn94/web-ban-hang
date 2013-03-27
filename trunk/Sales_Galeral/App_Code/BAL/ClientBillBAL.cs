using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClientBillBAL
/// </summary>
public class ClientBillBAL
{
    ClientBillDAL billDAL = new ClientBillDAL();
	public ClientBillBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Function Insert Bill To database return -1 if Fail
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
        int idBill = billDAL.InsertBill(custID, datePurchase, totalNamePr, totalQtt, totalMoney, typePayment, statusPayment);
        if (idBill != -1)
        {
            return idBill;
        }
        return -1;
    }

    /// <summary>
    /// function get infor bill by Customer ID
    /// </summary>
    /// <param name="customerID"></param>
    /// <returns></returns>
    public DataTable GetBillByCustomerID(int customerID)
    {
        return billDAL.GetBillByCustomerID(customerID);
    }
}