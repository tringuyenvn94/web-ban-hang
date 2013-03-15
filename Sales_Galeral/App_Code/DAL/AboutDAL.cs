using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AboutDAL
/// </summary>
public class AboutDAL
{
    public SqlCommand comm;
    ConnectionAdmin conn = new ConnectionAdmin();

	public AboutDAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data About
    public DataSet Load_About()
    {
        try
        {
            DataSet dset = new DataSet();
            string commandText = "SP_GetList_About";
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

    //Update and Insert About
    public bool Update_About(int id, string title_about, string detail_about)
    {
        try
        {
            if (id != 0)
            {
                string commandText = "SP_Update_About";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Title_About = command.Parameters.Add("@Title_About", SqlDbType.NVarChar);
                pr_Title_About.Value = title_about;
                SqlParameter pr_Detail_About = command.Parameters.Add("@Detail_About", SqlDbType.NVarChar);
                pr_Detail_About.Value = detail_about;
                SqlParameter pr_ID = command.Parameters.Add("@ID", SqlDbType.Int);
                pr_ID.Value = id;
                int row = command.ExecuteNonQuery();
                return true;
            }
            else
            {
                string commandText = "SP_Insert_About";
                SqlCommand command = new SqlCommand(commandText, conn.Connect());
                command.CommandType = CommandType.StoredProcedure;
                SqlParameter pr_Title_About = command.Parameters.Add("@Title_About", SqlDbType.NVarChar);
                pr_Title_About.Value = title_about;
                SqlParameter pr_Detail_About = command.Parameters.Add("@Detail_About", SqlDbType.NVarChar);
                pr_Detail_About.Value = detail_about;
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

    //Delete About By ID
    public bool Delete_About(int ID)
    {
        try
        {
            string commandText = "SP_Delete_About";
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