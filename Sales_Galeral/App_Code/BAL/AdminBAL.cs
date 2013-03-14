using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AdminBAL
/// </summary>
public class AdminBAL
{
	public AdminBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Admin
    public DataSet Load_Admin()
    {
        return new AdminDAL().Load_Admin();
    }

    //Update and Insert Admin
    public bool Update_Admin(int id, string usename, string pass)
    {
        return new AdminDAL().Update_Admin(id, usename, pass);
    }

    //Delete Admin By ID
    public bool Delete_Admin(int ID)
    {
        return new AdminDAL().Delete_Admin(ID);
    }
}