using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Web.Configuration;

/// <summary>
/// Summary description for ConnectClient
/// </summary>
public class ConnectClient
{
    public String connectToDatabase = WebConfigurationManager.ConnectionStrings["Cliet_Connect"].ConnectionString;
	public ConnectClient()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public SqlConnection Connection()
    {
        try
        {
            SqlConnection connectionLink = new SqlConnection(connectToDatabase);
            if (connectionLink.State == System.Data.ConnectionState.Closed)
            {
                connectionLink.Open();
            }
            return connectionLink;
        }
        catch (System.Exception ex)
        {
            Debug.Print(ex.Message);
            return null;
        }

    }
}