using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClientAboutBAL
/// </summary>
public class ClientAboutBAL
{
    ClientAboutDAL aboutDAL = new ClientAboutDAL();
	public ClientAboutBAL()
	{
		//
		// TODO: Add constructor logic here
		//getAbour
	}

    public DataTable GetAllAbout()
    {
        return aboutDAL.GetAllAbout();
    }

    public DataTable GetAllType_Payment()
    {
        return aboutDAL.GetAllType_Payment();
    }

    public DataTable GetAllType_Payment_By_ID(int id)
    {
        return aboutDAL.GetAllType_Payment_By_ID(id);
    }

}