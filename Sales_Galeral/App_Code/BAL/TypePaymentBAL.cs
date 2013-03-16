using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for TypePaymentBAL
/// </summary>
public class TypePaymentBAL
{
	public TypePaymentBAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //Load Data TypePayment
    public DataSet Load_TypePayment()
    {
        return new TypePaymentDAL().Load_TypePayment();
    }

    //Update and Insert TypePayment
    public bool Update_TypePayment(int id, string titleinfo, string Info)
    {
        return new TypePaymentDAL().Update_TypePayment(id, titleinfo, Info);
    }
}