using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User : System.Web.UI.Page
{
    private ClientAccountBAL accountBAL = new ClientAccountBAL();
    static DataTable dtableCustomer = new DataTable();
    static int idCust = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            if (id != null)
            {
                int idCustomer = Convert.ToInt32(id);
                dtableCustomer = accountBAL.GetCustomerByID(idCustomer);
                if (dtableCustomer.Rows.Count > 0)
                {
                    ShowValueCustomer();                 
                    idCust = idCustomer;
                }
            }
        }
    }

    protected void ShowValueCustomer()
    {
        tbxName.Text = dtableCustomer.Rows[0]["Name"].ToString();
        tbxPhone.Text = dtableCustomer.Rows[0]["Phone"].ToString();
        tbxEmail.Text = dtableCustomer.Rows[0]["Email"].ToString();
        tbxAddress.Text = dtableCustomer.Rows[0]["Address"].ToString();
        tbxOldPassword.Attributes["value"] = DescryptionPassword(dtableCustomer.Rows[0]["Password"].ToString());
        bool gender = Convert.ToBoolean(dtableCustomer.Rows[0]["Gender"].ToString());
        if (gender == false)
        {
            rdbFemale.Checked = true;
        }
        else
        {
            rdbMale.Checked = true;
        }
    }

    public string EnscryptionPassword()
    {
        if (tbxNewPass.Text.Equals(tbxConfirm.Text))
        {
            return new Encryption().Encrypt(FunctionLibrary.KEY_ENSCRYPTION, tbxOldPassword.Text.ToString());
        }
        return "null";
    }

    public string DescryptionPassword(string value)
    {
        return new Description().Decrypt(FunctionLibrary.KEY_ENSCRYPTION,value);
    }

    public bool Getgender()
    {
        if (rdbFemale.Checked)
        {
            return false;
        }
        return true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int idCustomer = Convert.ToInt32(dtableCustomer.Rows[0]["ID"].ToString());
        string userName = dtableCustomer.Rows[0]["UseName"].ToString();
        string newPass = EnscryptionPassword();
        string name = tbxName.Text;
        bool gender = Getgender();
        string phone = tbxPhone.Text;
        string address = tbxAddress.Text;
        string email = tbxEmail.Text;
        string oldPass = new Encryption().Encrypt(FunctionLibrary.KEY_ENSCRYPTION, tbxOldPassword.Text);
        if (oldPass.Equals(dtableCustomer.Rows[0]["Password"].ToString()))
        {
            if (accountBAL.UpdateCustomer(userName, newPass, name, gender, phone, address, email, idCustomer))
            {
                lblMessErrorGetPass.Visible = true;
                lblMessErrorGetPass.Text = "Change Profile Success";
            }
        }
        else
        {
            lblMessErrorGetPass.Visible = true;
            lblMessErrorGetPass.Text = "Old Password Is Not Match";
        }
    }
}