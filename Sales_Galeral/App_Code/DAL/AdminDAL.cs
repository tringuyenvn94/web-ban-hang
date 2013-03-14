using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AdminDAL
/// </summary>
public class AdminDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public AdminDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Admin
    public DataSet Load_Admin()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Admin";
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

    //Update and Insert Admin
    public bool Update_Admin(int id, string usename, string pass)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_Admin";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_UseName = command.Parameters.Add("@UseName", SqlDbType.VarChar);
                pr_UseName.Value = usename;
                SqlParameter pr_Pass = command.Parameters.Add("@Password", SqlDbType.VarChar);
                pr_Pass.Value = pass;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_Admin";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_UseName = command.Parameters.Add("@UseName", SqlDbType.VarChar);
                pr_UseName.Value = usename;
                SqlParameter pr_Pass = command.Parameters.Add("@Password", SqlDbType.VarChar);
                pr_Pass.Value = pass;
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

    //Delete Admin By ID
    public bool Delete_Admin(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Admin";
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