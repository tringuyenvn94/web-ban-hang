using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for ClientAccountBAL
/// </summary>
public class ClientAccountBAL
{
    ClientAccountDAL accountDAL = new ClientAccountDAL();
	public ClientAccountBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Load all records Customer from database
    /// </summary>
    /// <returns></returns>
    public DataTable GetAllRecordCustomer()
    {
        return new ClientAccountDAL().GetAllRecordCustomer();
    }

    /// <summary>
    /// Check userName exits
    /// </summary>
    /// <param name="userName"></param>
    /// <returns></returns>
    public bool CheckUserName(string userName)
    {
        DataTable dtableTemp = accountDAL.GetAllRecordCustomer();
        foreach (DataRow row in dtableTemp.Rows)
        {
            if (userName.Equals(row[1].ToString()))
            {
                dtableTemp.Clear();
                return false;
            }
        }
        dtableTemp.Clear();
        return true;
    }

    /// <summary>
    /// Check email exits
    /// </summary>
    /// <param name="email"></param>
    /// <returns></returns>
    public bool CheckEmail(string email)
    {
        DataTable dtableTemp = accountDAL.GetAllRecordCustomer();
        foreach (DataRow row in dtableTemp.Rows)
        {
            if (email.Equals(row[7].ToString()))
            {
                dtableTemp.Clear();
                return false;
            }
        }
        dtableTemp.Clear();
        return true;
    }


    /// <summary>
    /// Function insert record Customer to Database
    /// </summary>
    /// <param name="username"></param>
    /// <param name="password"></param>
    /// <param name="name"></param>
    /// <param name="gender"></param>
    /// <param name="phone"></param>
    /// <param name="address"></param>
    /// <param name="email"></param>
    /// <returns></returns>
    public int InsertCustomer(string username, string password, string name, bool gender, string phone, string address, string email)
    {
        return accountDAL.InsertCustomer(username, password, name, gender, phone, address, email);

    }

    /// <summary>
    /// Function Update record Customer to Database By ID
    /// </summary>
    /// <param name="username"></param>
    /// <param name="password"></param>
    /// <param name="name"></param>
    /// <param name="gender"></param>
    /// <param name="phone"></param>
    /// <param name="address"></param>
    /// <param name="email"></param>
    /// <param name="idCustomer"></param>
    /// <returns></returns>
    public bool UpdateCustomer(string username, string password, string name, bool gender, string phone, string address, string email, int idCustomer)
    {
        if (accountDAL.UpdateCustomer(username, password, name, gender, phone, address, email, idCustomer))
        {
            return true;
        }
        return false;
    }

    public DataRow AuthenticateAccount(string userName, string password)
    {
        string encrypPass = new Encryption().Encrypt(FunctionLibrary.KEY_ENSCRYPTION, password);
        DataTable dtableTemp = new ClientAccountDAL().GetAllRecordCustomer();
        foreach (DataRow row in dtableTemp.Rows)
        {
            if (row["UseName"].ToString().Equals(userName) && row["Password"].ToString().Equals(encrypPass))
            {
                return row;
            }
        }
        return null;
    }

    public DataTable GetCustomerByID(int idCustomer)
    {
        return accountDAL.GetCustomerByID(idCustomer);
    }
}