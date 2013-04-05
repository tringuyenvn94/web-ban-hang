using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AddressDAL
/// </summary>
public class AddressDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public AddressDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Address
    public DataSet Load_Address()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_AddressSale";
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

    //Update and Insert Address
    public bool Update_Address(int id, string address, string phone)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_AddressSale";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_address = command.Parameters.Add("@Address", SqlDbType.NVarChar);
                pr_address.Value = address;
                SqlParameter pr_phone = command.Parameters.Add("@Phone", SqlDbType.NVarChar);
                pr_phone.Value = phone;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_AddressSale";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_address = command.Parameters.Add("@Address", SqlDbType.NVarChar);
                pr_address.Value = address;
                SqlParameter pr_phone = command.Parameters.Add("@Phone", SqlDbType.NVarChar);
                pr_phone.Value = phone;
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

    //Delete Address By ID
    public bool Delete_Address(int ID)
    {
        try
        {
            string commandText = "SP_Delete_AddressSale";
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