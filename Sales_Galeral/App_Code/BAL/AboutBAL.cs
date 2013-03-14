using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for AboutBAL
/// </summary>
public class AboutBAL
{
	public AboutBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data About
    public DataSet Load_About(){
        return new AboutDAL().Load_About();
    }

    //Update and Insert About
    public bool Update_About(int id, string title_about, string detail_about)
    {
        return new AboutDAL().Update_About(id, title_about, detail_about);
    }

    //Delete About By ID
    public bool Delete_About(int ID)
    {
        return new AboutDAL().Delete_About(ID);
    }
}