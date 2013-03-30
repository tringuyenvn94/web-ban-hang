using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for CustomerBAL
/// </summary>
public class CustomerBAL
{
	public CustomerBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Customer
    public DataSet Load_Customer()
    {
        return new CustomerDAL().Load_Customer();
    }

    //Search By Name Customer
    public DataSet Load_SearchCustomer_ByName(string name)
    {
        return new CustomerDAL().Load_SearchCustomer_ByName(name);
    }

    //Update Customer
    public bool Update_Customer(int id, string usename, string pass, string name, bool gender, string phone, string address, string email)
    {
        return new CustomerDAL().Update_Customer(id, usename, pass, name, gender, phone, address, email);
    }

    //Delete Bill when delete Customer
    public bool Delete_BillWhenDeleteCustomer(int ID)
    {
        return new CustomerDAL().Delete_BillWhenDeleteCustomer(ID);
    }

    //Delete ShopCart when Delete Bill
    public bool Delete_ShopCartWhenDeleteBill(int ID)
    {
        return new CustomerDAL().Delete_ShopCartWhenDeleteBill(ID);
    }

    //Delete Customer
    public bool Delete_Customer(int ID)
    {
        return new CustomerDAL().Delete_Customer(ID);
    }
}