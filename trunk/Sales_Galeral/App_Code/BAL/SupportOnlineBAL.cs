using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for SupportOnlineBAL
/// </summary>
public class SupportOnlineBAL
{
	public SupportOnlineBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Support Online
    public DataSet Load_SupportOnline()
    {
        return new SupportOnlineDAL().Load_SupportOnline();
    }

    //Update and Insert Support Online
    public bool Update_SupportOnline(int id, string Name, string Yahoo, string PhoneSuppot)
    {
        return new SupportOnlineDAL().Update_SupportOnline(id, Name, Yahoo, PhoneSuppot);
    }

    //Delete Support Online By ID
    public bool Delete_SupportOnline(int ID)
    {
        return new SupportOnlineDAL().Delete_SupportOnline(ID);
    }
}