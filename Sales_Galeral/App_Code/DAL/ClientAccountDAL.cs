using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

/// <summary>
/// Summary description for ClientAccountDAL
/// </summary>
public class ClientAccountDAL
{
	public ClientAccountDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private ConnectClient connectDatabase = new ConnectClient();
    public DataTable dtblCustomer = new DataTable();
    public DataSet dsetCustomer = new DataSet();
    public SqlDataAdapter adapterCustomer;


    /// <summary>
    /// Load records Customer from database
    /// </summary>
    /// <returns> </returns>
    public DataTable GetAllRecordCustomer()
    {
        ClearAllData();
        SqlConnection connectDB = connectDatabase.Connection();
        adapterCustomer = new SqlDataAdapter("SP_GetList_Customer", connectDB);
        adapterCustomer.Fill(dsetCustomer);
        dtblCustomer = dsetCustomer.Tables[0];
        connectDB.Close();
        return dtblCustomer;
    }


    /// <summary>
    /// Load records Customer from database
    /// </summary>
    /// <returns> </returns>
    public DataTable GetAllRecordAdmin()
    {
        ClearAllData();
        SqlConnection connectDB = connectDatabase.Connection();
        adapterCustomer = new SqlDataAdapter("SP_GetList_Admin", connectDB);
        adapterCustomer.Fill(dsetCustomer);
        dtblCustomer = dsetCustomer.Tables[0];
        connectDB.Close();
        return dtblCustomer;
    }


    /// <summary>
    /// Clear All Data In Dataset and DataTable
    /// </summary>
    /// <returns> </returns>
    public void ClearAllData()
    {
        dsetCustomer.Clear();
        dsetCustomer = new DataSet();
        dtblCustomer.Clear();
        dtblCustomer = new DataTable();
    }
    /// <summary>
    /// Fill Data From Database To DataTable
    /// </summary>
    /// <param name="commandSql">Command Procedure SQL</param>
    /// <returns>Data Table</returns>
    public DataTable FillData(SqlCommand commandSql)
    {
        ClearAllData();
        adapterCustomer = new SqlDataAdapter(commandSql);
        adapterCustomer.Fill(dsetCustomer);
        dtblCustomer = dsetCustomer.Tables[0];
        commandSql.Connection.Close();
        return dtblCustomer;
    }

    /// <summary>
    /// Insert Customer To DataBase
    /// </summary>
    /// <param name="idProduct">Integer</param>
    /// <returns value="DataTable"> Data Table</returns>
    public DataTable GetCustomerByID(int idCustomer)
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_Get_Customer_ByID", new ConnectClient().Connection());
        command.Parameters.AddWithValue("@ID", idCustomer);
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    /// <summary>
    /// Function Insert Customer To database
    /// </summary>
    /// <param name="username">string</param>
    /// <param name="password">string</param>
    /// <param name="name">string</param>
    /// <param name="gender">boolean</param>
    /// <param name="phone">string</param>
    /// <param name="address">string</param>
    /// <param name="email">string</param>
    /// <returns>int</returns>
    public int InsertCustomer(string username, string password, string name, bool gender, string phone, string address, string email)
    {
        int id = -1;
        SqlConnection connect = connectDatabase.Connection();
        try
        {
            SqlCommand command = new SqlCommand("SP_Insert_Customer", connect);
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter prUserName = command.Parameters.Add("@UseName", SqlDbType.NVarChar);
            prUserName.Value = username;
            SqlParameter prPassword = command.Parameters.Add("@Password", SqlDbType.NVarChar);
            prPassword.Value = password;
            SqlParameter prName = command.Parameters.Add("@Name", SqlDbType.NVarChar);
            prName.Value = name;
            SqlParameter prGender = command.Parameters.Add("@Gender", SqlDbType.Bit);
            prGender.Value = gender;
            SqlParameter prPhone = command.Parameters.Add("@Phone", SqlDbType.NVarChar);
            prPhone.Value = phone;
            SqlParameter prAddress = command.Parameters.Add("@Address", SqlDbType.NVarChar);
            prAddress.Value = address;
            SqlParameter prEmail = command.Parameters.Add("@Email", SqlDbType.NVarChar);
            prEmail.Value = email;
            SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
            prID.Direction = ParameterDirection.Output;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                id = Int32.Parse(prID.Value.ToString());
                connect.Close();
                return id;
            }
            return id;
        }
        catch (System.Exception ex)
        {
            Debug.Print(ex.Message);
            return -1;
        }

    }

    /// <summary>
    /// Function Update Customer To database
    /// </summary>
    /// <param name="username">string</param>
    /// <param name="password">string</param>
    /// <param name="name">string</param>
    /// <param name="gender">boolean</param>
    /// <param name="phone">string</param>
    /// <param name="address">string</param>
    /// <param name="email">string</param>
    /// <returns>boolean</returns>
    public bool UpdateCustomer(string username, string password, string name, bool gender, string phone, string address, string email, int idCustomer)
    {

        SqlConnection connect = connectDatabase.Connection();
        try
        {
            SqlCommand command = new SqlCommand("SP_Update_Customer", connect);
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter prUserName = command.Parameters.Add("@UseName", SqlDbType.NVarChar);
            prUserName.Value = username;
            SqlParameter prPassword = command.Parameters.Add("@Password", SqlDbType.NVarChar);
            prPassword.Value = password;
            SqlParameter prName = command.Parameters.Add("@Name", SqlDbType.NVarChar);
            prName.Value = name;
            SqlParameter prGender = command.Parameters.Add("@Gender", SqlDbType.Bit);
            prGender.Value = gender;
            SqlParameter prPhone = command.Parameters.Add("@Phone", SqlDbType.NVarChar);
            prPhone.Value = phone;
            SqlParameter prAddress = command.Parameters.Add("@Address", SqlDbType.NVarChar);
            prAddress.Value = address;
            SqlParameter prEmail = command.Parameters.Add("@Email", SqlDbType.NVarChar);
            prEmail.Value = email;
            SqlParameter prID = command.Parameters.Add("@ID", SqlDbType.Int);
            prID.Value = idCustomer;
            int row = command.ExecuteNonQuery();
            if (row > 0)
            {
                connect.Close();
                return true;
            }
            return false;
        }
        catch (System.Exception ex)
        {
            Debug.Print(ex.Message);
            return false;
        }

    }
}