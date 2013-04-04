using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

public partial class Register : System.Web.UI.Page
{
   
    static ClientAccountBAL accountBAL = new ClientAccountBAL();
    protected void Page_Load(object sender, EventArgs e)
    {
        mtviewRegister.ActiveViewIndex = 0;
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtPass.Text = "";
        txtConfirmPass.Text = "";
        txtName.Text = "";
        rdbMale.Checked = true;
        txtPhone.Text = "";
        txtAddress.Text = "";
        txtEmail.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            // validate the Captcha to check we're not dealing with a bot
            bool isHuman = SampleCaptcha.Validate(CaptchaCodeTextBox.Text);
            CaptchaCodeTextBox.Text = null; // clear previous user input
            if (!isHuman)
            {
                // TODO: Captcha validation failed, show error message  
                lblError.Text = "Incorrect";
            }
            else
            { // TODO: Captcha validation passed, proceed with protected action  
                string userName = txtUserName.Text;
                string name = txtName.Text;
                bool gender = Getgender();
                string phone = txtPhone.Text;
                string address = txtAddress.Text;
                string email = txtEmail.Text;
                if (IsUserAvailable(userName) == true && IsEmailAvailable(email) == true)
                {
                    string pass = EnscryptionPassword();
                    if (pass != "null")
                    {
                        int idCustomer = accountBAL.InsertCustomer(userName, pass, name, gender, phone, address, email);
                        mtviewRegister.ActiveViewIndex = 1;
                        Session["UserClient"] = userName;
                        Session["IDClient"] = idCustomer;
                    }

                }
                else if (IsUserAvailable(userName) == false)
                {
                    lblAccountInfor.ForeColor = System.Drawing.Color.Red;
                    lblAccountInfor.Text = "Tên đăng nhập đã tồn tại";
                }
                else if (IsEmailAvailable(email) == false)
                {
                    lblUserInfor.ForeColor = System.Drawing.Color.Red;
                    lblUserInfor.Text = "Email đã tồn tại";
                }
            }
        }
    }

    public string EnscryptionPassword()
    {
        if (txtPass.Text.Equals(txtConfirmPass.Text))
        {
            return new Encryption().Encrypt(FunctionLibrary.KEY_ENSCRYPTION, txtPass.Text.ToString());
        }
        return "null";
    }

    public bool Getgender()
    {
        if (rdbFemale.Checked)
        {
            return false;
        }
        return true;
    }

    [WebMethod]
    public static bool IsUserAvailable(string userName)
    {
        if (accountBAL.CheckUserName(userName) == true)
            return true;
        return false;
    }

    [WebMethod]
    public static bool IsEmailAvailable(string email)
    {
        if (accountBAL.CheckEmail(email) == true)
            return true;
        return false;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}