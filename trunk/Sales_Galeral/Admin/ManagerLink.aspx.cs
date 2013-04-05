using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagerLink : System.Web.UI.Page
{
    LinkBAL ToolsAdmin = new LinkBAL();
    Encryption Encryption = new Encryption();
    HtmlRemoval HtmlRemoval = new HtmlRemoval();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DIV_Link.Visible = true;
            Load_Grid_Link();
        }
    }

    public void Load_Grid_Link()
    {
        Grid_Link.DataSource = ToolsAdmin.Load_Link().Tables[0];
        Grid_Link.DataBind();
    }

    protected void Grid_Link_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Grid_Link.PageIndex = e.NewPageIndex;
        Load_Grid_Link();
        DIV_AddEditLink.Visible = false;
    }

    protected void On_RowDelete(object sender, GridViewDeleteEventArgs e)
    {
        int ID = Convert.ToInt32(Grid_Link.DataKeys[e.RowIndex].Value.ToString());
        if (ToolsAdmin.Delete_Link(ID))
        {
            DIV_AddEditLink.Visible = false;
            Load_Grid_Link();
        }
        else
        {
            WebMsgBox.Show("Error Delete");
        }
    }

    public void set_Hidden_DIVLink()
    {
        DIV_AddEditLink.Visible = false;
    }

    public void set_Text_Link()
    {
        TB_LienKet.Text = "";
        TB_PartImage.Value = "";
        IMG_Upload.ImageUrl = null;
    }

    protected void OnRowData_Link(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button BT_Delete = (Button)e.Row.FindControl("BT_DeleteLink");
            BT_Delete.Attributes.Add("onclick", "javascript:return confirm('Bạn có chắc chắn muốn xóa bản ghi này không?');");
            e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#D3EDBA'");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
        }
    }

    protected void OnRowSelected_Link(object sender, EventArgs e)
    {
        DIV_AddEditLink.Visible = true;
        HD_ID_Link.Value = ((Label)Grid_Link.SelectedRow.FindControl("LBL_LinkItem")).Text;
        TB_LienKet.Text = ((Label)Grid_Link.SelectedRow.FindControl("LBL_LinkLinkItem")).Text;
        TB_PartImage.Value = ((Label)Grid_Link.SelectedRow.FindControl("LBL_LinkImageLinkItem")).Text;
        IMG_Upload.ImageUrl = "../Images/ImageLienKet/" + TB_PartImage.Value;
    }

    protected void BT_SubmitLink_Click(object sender, EventArgs e)
    {
        string link = TB_LienKet.Text.Trim();
        string PartImage = TB_PartImage.Value.Trim();
        if (ToolsAdmin.Update_Link(Convert.ToInt32(HD_ID_Link.Value), link, PartImage))
        {
            Load_Grid_Link();
        }
        else
        {
            WebMsgBox.Show("Error Update");
        }
        set_Hidden_DIVLink();
    }

    protected void BT_AddLink_Click1(object sender, EventArgs e)
    {
        HD_ID_Link.Value = "0";
        DIV_AddEditLink.Visible = true;
        set_Text_Link();
    }

    protected void BT_Cancel_Click(object sender, EventArgs e)
    {
        set_Hidden_DIVLink();
        set_Text_Link();
    }

    protected void BT_Upload_Click(object sender, EventArgs e)
    {
        string uploadPath = Server.MapPath("../Images/ImageLienKet/");
        if (FileUpload_Image.HasFile)
        {
            string filename = FileUpload_Image.FileName;
            string extension = System.IO.Path.GetExtension(filename);
            string savefile = uploadPath + "\\" + filename;
            try
            {
                FileUpload_Image.SaveAs(savefile);
                IMG_Upload.ImageUrl = "../Images/ImageLienKet/" + filename;
                TB_PartImage.Value = FileUpload_Image.FileName;
            }
            catch (Exception ex)
            {
                Trace.Write("-----Write File Error: \n" + ex.Message + "\n---------");
            }
        }
    }
}