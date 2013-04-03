using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ClientAboutDAL
/// </summary>
public class ClientAboutDAL
{
    private ConnectClient connectDatabase = new ConnectClient();
    public DataTable dtblProduct = new DataTable();
    public DataSet dsetProduct = new DataSet();
    public SqlDataAdapter adapterProduct;
	public ClientAboutDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /// <summary>
    /// Clear All Data In Dataset and DataTable
    /// </summary>
    /// <returns> </returns>
    public void ClearAllData()
    {
        dsetProduct.Clear();
        dsetProduct = new DataSet();
        dtblProduct.Clear();
        dtblProduct = new DataTable();
    }
    /// <summary>
    /// Fill Data From Database To DataTable
    /// </summary>
    /// <param name="commandSql">Command Procedure SQL</param>
    /// <returns>Data Table</returns>
    public DataTable FillData(SqlCommand commandSql)
    {
        ClearAllData();
        adapterProduct = new SqlDataAdapter(commandSql);
        adapterProduct.Fill(dsetProduct);
        dtblProduct = dsetProduct.Tables[0];
        commandSql.Connection.Close();
        return dtblProduct;
    }

    /// <summary>
    /// Load category from database
    /// </summary>
    /// <returns> </returns>
    public DataTable GetAllAbout()
    {

        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetList_About", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    public DataTable GetAllType_Payment()
    {

        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetList_Type_Payment", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    public DataTable GetAllType_Payment_By_ID(int id)
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetList_Type_Payment_By_ID", connectDatabase.Connection());
        command.Parameters.AddWithValue("@ID", id);
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }


}