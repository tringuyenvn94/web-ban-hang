using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for LinkDAL
/// </summary>
public class LinkDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public LinkDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Link
    public DataSet Load_Link()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Link";
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

    //Update and Insert Link
    public bool Update_Link(int id, string Link)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_Link";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Link = command.Parameters.Add("@Link", SqlDbType.VarChar);
                pr_Link.Value = Link;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_Link";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Link = command.Parameters.Add("@Link", SqlDbType.VarChar);
                pr_Link.Value = Link;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Direction = ParameterDirection.Output;
                int row = command.ExecuteNonQuery();
                return true;
            }

        }
        catch (SqlException ex)
        {
            Console.WriteLine(ex.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }

    //Delete Link By ID
    public bool Delete_Link(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Link";
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
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            conn.Close_Connection();
        }
        return false;
    }
}