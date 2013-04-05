using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ClientProductDAL
/// </summary>
public class ClientProductDAL
{
    private ConnectClient connectDatabase = new ConnectClient();
    public DataTable dtblProduct = new DataTable();
    public DataSet dsetProduct = new DataSet();
    public SqlDataAdapter adapterProduct;

	public ClientProductDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    /// <summary>
    /// Load records from database
    /// </summary>
    /// <returns> </returns>
    public DataTable GetAllDataProduct()
    {
     
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetList_Product", connectDatabase.Connection());      
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    public DataTable Load_Top6_Hot_Product()
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_Get_Top6_Hot_Product", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    public DataTable Load_Top6_New_Product()
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_Get_Top6_New_Product", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    public DataTable Load_Top6_Thuong_Product()
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_Get_Top6_Thuong_Product", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    //Get total Product type
    public int get_Total_Product_Type(int type)
    {
        try
        {
            DataTable dtble = new DataTable();
            SqlCommand command = new SqlCommand("get_Total_Product_Type", connectDatabase.Connection());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter pr_type = command.Parameters.Add("@Type", SqlDbType.Int);
            pr_type.Value = type;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dtble);
            return Convert.ToInt32(dtble.Rows[0][0].ToString());
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            connectDatabase.Connection().Close();
        }
        return -1;
    }

    //load theo Type New or Hot
    public DataTable LoadTypeProduct(int type,int PageSize,int CurrentPage)
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_Get_Type_Product", connectDatabase.Connection());
        command.Parameters.AddWithValue("@Type", type);
        command.Parameters.AddWithValue("@PageSize", PageSize);
        command.Parameters.AddWithValue("@CurrentPage", CurrentPage);
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    //load theo Cate
    public DataTable LoadProductByCate(int cate, int PageSize, int CurrentPage)
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_Get_Category_Product", connectDatabase.Connection());
        command.Parameters.AddWithValue("@Category_ID", cate);
        command.Parameters.AddWithValue("@PageSize", PageSize);
        command.Parameters.AddWithValue("@CurrentPage", CurrentPage);
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    //Get total Product cate
    public int get_Total_Product_Cate(int cate)
    {
        try
        {
            DataTable dtble = new DataTable();
            SqlCommand command = new SqlCommand("get_Total_Product_Cate", connectDatabase.Connection());
            command.CommandType = CommandType.StoredProcedure;
            SqlParameter pr_cate = command.Parameters.Add("@Category_ID", SqlDbType.Int);
            pr_cate.Value = cate;
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            adapter.Fill(dtble);
            return Convert.ToInt32(dtble.Rows[0][0].ToString());
        }
        catch (SqlException e)
        {
            WebMsgBox.Show(e.Message);
        }
        finally
        {
            connectDatabase.Connection().Close();
        }
        return -1;
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
    /// Get All Product by ID Parent Catrgory
    /// </summary>
    /// <param name="id"> id parent category</param>
    /// <returns></returns>
    public DataTable GetAllProductByIDCategoryParent(int idCategory)
    {
        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("getAllProductByIDParent", connectDatabase.Connection());
        command.Parameters.AddWithValue("@ID_PARENT", idCategory);
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }


    /// <summary>
    /// Load category from database
    /// </summary>
    /// <returns> </returns>
    public DataTable GetAllCategory()
    {

        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetList_Category", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    /// <summary>
    /// Get record Product By ID
    /// </summary>
    /// <param name="idProduct">Integer</param>
    /// <returns value="DataTable"> Data Table</returns>
    public DataTable GetProductByID(int idProduct)
    {
        SqlCommand command = new SqlCommand("SP_GetProduct_By_ID", connectDatabase.Connection());
        command.Parameters.AddWithValue("@ID", idProduct);
        command.CommandType = CommandType.StoredProcedure;
        return this.FillData(command);

    }

    public DataTable GetTypePayment()
    {

        DataTable dtlTemp = new DataTable();
        SqlCommand command = new SqlCommand("SP_GetList_Type_Payment", connectDatabase.Connection());
        command.CommandType = CommandType.StoredProcedure;
        return dtlTemp = this.FillData(command);
    }

    public int Update_Quantity(int id, int quantity)
    {
        SqlConnection conn=connectDatabase.Connection();
        SqlTransaction transaction = conn.BeginTransaction();
        try
        {
            SqlCommand command = new SqlCommand("SP_Update_Quantity_In", conn, transaction);
            command.Parameters.AddWithValue("@ID", id);
            command.Parameters.AddWithValue("@Quantity", quantity);
            command.CommandType = CommandType.StoredProcedure;
            command.ExecuteNonQuery();

            command = new SqlCommand("SP_Update_Quantity_Bought", conn, transaction);
            command.Parameters.AddWithValue("@ID", id);
            command.Parameters.AddWithValue("@Quantity", quantity);
            command.CommandType = CommandType.StoredProcedure;
            command.ExecuteNonQuery();

            transaction.Commit();
            return 1;
        }
        catch (System.Exception ex)
        {
            transaction.Rollback();
            System.Console.Write(ex);
            return -1;
        }
        
    }

  
}