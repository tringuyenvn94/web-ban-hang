using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for FunctionLibrary
/// </summary>
public static class FunctionLibrary
{
    /// <summary>
    /// Function Display Price of product with format: $ 10.00
    /// </summary>
    /// <param name="_price"></param>
    ///  <returns></returns>
    public static string DisplayPrice(double _price)
    {
        //return String.Format("{0:0.000} đ", _price);

        return String.Format("{0:#,###.##}đ", _price);
    }

    /// <summary>
    /// Object Connect To Database
    /// </summary>
    public static ConnectClient connectDB = new ConnectClient();

    /// <summary>
    /// Key Enscryption and Descryption password
    /// </summary>
    public static string KEY_ENSCRYPTION = "Group03_C1101G";

    /// <summary>
    /// Function Fill DataTable with
    /// </summary>
    /// <param name="_price"></param>
    ///  <returns> Datatable </returns>
    public static DataTable Fill(DataTable datable, String command, params Object[] parameters)
    {
        SqlCommand commandSQL = CreateCommand(command, parameters);
        new SqlDataAdapter(commandSQL).Fill(datable);
        commandSQL.Connection.Close();
        return datable;
    }

    /// <summary>
    /// Function Create Command SQL With Array Parameters 
    /// </summary>
    /// <param name="commandSql"></param>
    /// <param name="parameters"></param>
    ///  <returns> SqlCommand</returns>
    public static SqlCommand CreateCommand(String commandSql, params Object[] parameters)
    {
        SqlConnection connect = connectDB.Connection();
        SqlCommand command = new SqlCommand(commandSql, connect);
        for (int i = 0; i < parameters.Length; i += 2)
        {
            command.Parameters.AddWithValue(parameters[i].ToString(), parameters[i + 1]);
        }
        return command;
    }


    /// <summary>
    /// Function Fill DataTable with Command sql is procedure
    /// </summary>
    /// <param name="command"></param>
    /// <param name="parameters"></param>
    ///  <returns> Datatable </returns>
    public static DataTable FillDataTableWithProcedure(String commandProcedure, params Object[] parameters)
    {
        DataTable dtblTemp = new DataTable();
        SqlCommand commandSQL = CreateCommand(commandProcedure, parameters);
        commandSQL.CommandType = CommandType.StoredProcedure;
        new SqlDataAdapter(commandSQL).Fill(dtblTemp);
        commandSQL.Connection.Close();
        return dtblTemp;
    }
}