using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BillBAL
/// </summary>
public class BillBAL
{
	public BillBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Bill
    public DataSet Load_Bill()
    {
        return new BillDAL().Load_Bill();
    }

    //Load Data Shop Cart By Click Bill ID
    public DataSet Load_ShopCart_ByClickBillID(int ID)
    {
        return new BillDAL().Load_ShopCart_ByClickBillID(ID);
    }

    //Update Bill
    public bool Update_Bill(int ID, int Customer_ID, int Type_Payment_ID, string Date_Purcharse, string TotalNameProduct, int TotalQuantity, double TotalMoney, bool Status_Payment)
    {
        return new BillDAL().Update_Bill(ID, Customer_ID, Type_Payment_ID, Date_Purcharse, TotalNameProduct, TotalQuantity, TotalMoney, Status_Payment);
    }

    //When Delete Bill,need delete Shop Cart
    public bool Delete_Bill(int ID)
    {
        return new BillDAL().Delete_Bill(ID);
    }

    //Delete Shop Cart By ID_Bill
    public bool Delete_ShopCart_ByIDBill(int ID)
    {
        return new BillDAL().Delete_ShopCart_ByIDBill(ID);
    }
}