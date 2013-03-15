using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for CustomerDAL
/// </summary>
public class CustomerDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public CustomerDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data Customer
    public DataSet Load_Customer()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_Customer";
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

    //Update Customer
    public bool Update_Customer(int id, string usename, string pass, string name, bool gender, string phone, string address, string email)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_Customer";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_UseName = command.Parameters.Add("@UseName", SqlDbType.NVarChar);
                pr_UseName.Value = usename;
                SqlParameter pr_Pass = command.Parameters.Add("@Password", SqlDbType.NVarChar);
                pr_Pass.Value = pass;
                SqlParameter pr_Name = command.Parameters.Add("@Name", SqlDbType.NVarChar);
                pr_Name.Value = name;
                SqlParameter pr_Gender = command.Parameters.Add("@Gender", SqlDbType.Bit);
                pr_Gender.Value = gender;
                SqlParameter pr_Phone = command.Parameters.Add("@Phone", SqlDbType.NVarChar);
                pr_Phone.Value = phone;
                SqlParameter pr_Address = command.Parameters.Add("@Address", SqlDbType.NVarChar);
                pr_Address.Value = address;
                SqlParameter pr_Email = command.Parameters.Add("@Email", SqlDbType.NVarChar);
                pr_Email.Value = email;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_Customer";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_UseName = command.Parameters.Add("@UseName", SqlDbType.NVarChar);
                pr_UseName.Value = usename;
                SqlParameter pr_Pass = command.Parameters.Add("@Password", SqlDbType.NVarChar);
                pr_Pass.Value = pass;
                SqlParameter pr_Name = command.Parameters.Add("@Name", SqlDbType.NVarChar);
                pr_Name.Value = name;
                SqlParameter pr_Gender = command.Parameters.Add("@Gender", SqlDbType.Bit);
                pr_Gender.Value = gender;
                SqlParameter pr_Phone = command.Parameters.Add("@Phone", SqlDbType.NVarChar);
                pr_Phone.Value = phone;
                SqlParameter pr_Address = command.Parameters.Add("@Address", SqlDbType.NVarChar);
                pr_Address.Value = address;
                SqlParameter pr_Email = command.Parameters.Add("@Email", SqlDbType.NVarChar);
                pr_Email.Value = email;
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

    //Delete Bill when delete Customer
    public bool Delete_BillWhenDeleteCustomer(int ID)
    {
        try
        {
            string commandText = "SP_DeleteBillWhenDeleteCustomer";
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

    //Delete ShopCart when Delete Bill
    public bool Delete_ShopCartWhenDeleteBill(int ID)
    {
        try
        {
            string commandText = "SP_DeleteShoppingCartWhenDeleteBill";
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

    //Delete Customer
    public bool Delete_Customer(int ID)
    {
        try
        {
            string commandText = "SP_Delete_Customer";
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