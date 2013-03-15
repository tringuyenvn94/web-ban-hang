using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for TypePaymentDAL
/// </summary>
public class TypePaymentDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public TypePaymentDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data TypePayment
    public DataSet Load_TypePayment()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Type_Payment";
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

    //Update and Insert TypePayment
    public bool Update_TypePayment(int id, string Info)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_Type_Payment";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Info = command.Parameters.Add("@Info", SqlDbType.NVarChar);
                pr_Info.Value = Info;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_Type_Payment";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Info = command.Parameters.Add("@Info", SqlDbType.NVarChar);
                pr_Info.Value = Info;
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
}