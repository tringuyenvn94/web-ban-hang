﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for CategoryDAL
/// </summary>
public class CategoryDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public CategoryDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Category
    public DataSet Load_Category()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Category";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dset);
            return dset;
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return null;
    }

    //Delete Product when Delete Category
    public bool delete_Product_WhenDeleteCategory(int Cattegory_ID)
    {
        try
        {
            string commandText = "SP_Delete_Product_WhenDeleteCategory";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter prID = command.Parameters.Add("@Category_ID", SqlDbType.Int);
            prID.Value = Cattegory_ID;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                return true;
            }
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }

    //Delete Category
    public bool delete_Category(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Category";
            SqlCommand command = new SqlCommand(commandText, conn.Connect());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
            prID.Value = ID;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                return true;
            }
        }
        catch (SqlException e)
        {
            Console.Write(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }
}