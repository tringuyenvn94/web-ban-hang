using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for LinkBAL
/// </summary>
public class LinkBAL
{
	public LinkBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Link
    public DataSet Load_Link()
    {
        return new LinkDAL().Load_Link();
    }

    //Update and Insert Link
    public bool Update_Link(int id, string Link, string Images)
    {
        return new LinkDAL().Update_Link(id, Link, Images);
    }

    //Delete Link By ID
    public bool Delete_Link(int ID)
    {
        return new LinkDAL().Delete_Link(ID);
    }
}