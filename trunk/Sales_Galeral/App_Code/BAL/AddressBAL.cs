using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AddressBAL
/// </summary>
public class AddressBAL
{
	public AddressBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Address
    public DataSet Load_Address()
    {
        return new AddressDAL().Load_Address();
    }

    //Update and Insert Address
    public bool Update_Address(int id, string address, string phone)
    {
        return new AddressDAL().Update_Address(id, address, phone);
    }

    //Delete Address By ID
    public bool Delete_Address(int ID)
    {
        return new AddressDAL().Delete_Address(ID);
    }
}