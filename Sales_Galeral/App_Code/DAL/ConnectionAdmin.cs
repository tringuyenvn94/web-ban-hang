using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for Connection
/// </summary>
public class ConnectionAdmin
{
    public SqlConnection conn;
    public ConnectionAdmin()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public SqlConnection Connect()
    {
        string conStr = WebConfigurationManager.ConnectionStrings["Group03_Project"].ConnectionString;
        conn = new SqlConnection(conStr);
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }
        return conn;
    }

    public void Close_Connection()
    {
        if (conn.State == ConnectionState.Open) conn.Close();
        conn.Dispose();
    }
}