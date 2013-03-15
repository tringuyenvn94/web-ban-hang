using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for SupportOnlineDAL
/// </summary>
public class SupportOnlineDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public SupportOnlineDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Support Online
    public DataSet Load_SupportOnline()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Support_Online";
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

    //Update and Insert Support Online
    public bool Update_SupportOnline(int id, string Name, string Yahoo, string PhoneSuppot)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_Support_Online";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Name = command.Parameters.Add("@Name", SqlDbType.NVarChar);
                pr_Name.Value = Name;
                SqlParameter pr_Yahoo = command.Parameters.Add("@Yahoo", SqlDbType.NVarChar);
                pr_Yahoo.Value = Yahoo;
                SqlParameter pr_PhoneSuppot = command.Parameters.Add("@PhoneSuppot", SqlDbType.NVarChar);
                pr_PhoneSuppot.Value = PhoneSuppot;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_Support_Online";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Name = command.Parameters.Add("@Name", SqlDbType.NVarChar);
                pr_Name.Value = Name;
                SqlParameter pr_Yahoo = command.Parameters.Add("@Yahoo", SqlDbType.NVarChar);
                pr_Yahoo.Value = Yahoo;
                SqlParameter pr_PhoneSuppot = command.Parameters.Add("@PhoneSuppot", SqlDbType.NVarChar);
                pr_PhoneSuppot.Value = PhoneSuppot;
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

    //Delete Support Online By ID
    public bool Delete_SupportOnline(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Support_Online";
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