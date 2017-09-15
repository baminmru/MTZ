


  namespace TP_MOUT.ASPNET
{
  #region MTZ ASP NET Generator code
  using System;
  using System.Data;
  using System.Collections;
  using System.Drawing;
  using System.Web;
  using System.Web.UI.WebControls;
  using System.Web.UI.HtmlControls;
  using Mokasin.ASPNET;
  using TP_MOUT;
  public partial class ucTabTp_MOUT_LINE  : ucParent
  {
    // ƒÓ·‡‚ÎÂÌÌÓÂ ÛÍ‡ÏË
    string EditColumnName = "EditColumn";
    string DeleteParameterName = "DeleteParameterName";
    string DeleteColumnName = "DeleteColumn";
    string EditParameterName = "EditParameterName";
    private int EditColumnIndex = -1;
    private int DeleteColumnIndex = -1;
    private int SelectColumnIndex = -1;

    public  TP_MOUT.Tp_MOUT_LINE_col DataSource
    { 
      get
      {
        return (TP_MOUT.Tp_MOUT_LINE_col)base.MKSNDataSource;
      }
    }

    private void Page_Load(object sender, System.EventArgs e)
    {
      base.Page_Load(sender,e); 
      if (!IsPostBack) PageNum = Parameter("PageNum");
      string EVENTTARGET = string.Empty;
      string EVENTARGUMENT = string.Empty;
      if (Request.Form["__EVENTTARGET"] != null)   EVENTTARGET = Request.Form["__EVENTTARGET"].ToString();
      if (Request.Form["__EVENTARGUMENT"] != null)   EVENTARGUMENT = Request.Form["__EVENTARGUMENT"].ToString();
    // ¡ÀŒ  ”ƒ¿À≈Õ»ﬂ «¿œ»—» begin
      if (EVENTTARGET  == DeleteParameterName + "Tp_MOUT_LINE")
      {
        string id = EVENTARGUMENT;
        if (id != string.Empty)
        {
         // ”ƒ¿Àﬂ≈Ã Œ¡⁄≈ “
         DataSource.Delete(id);
         DataSource.Refresh();
        }
      }
      // ¡ÀŒ  ”ƒ¿À≈Õ»ﬂ «¿œ»—» end
      // ¡ÀŒ  –≈ƒ¿ “»–Œ¬¿Õ»ﬂ «¿œ»—» begin
      if (EVENTTARGET == EditParameterName)
      {
        string id = string.Empty;
        bool bEdit = false;
          try
          {
            bEdit = EVENTARGUMENT.Substring(0,1) == "1";
            id = EVENTARGUMENT.ToString().Substring(1);
          }
          catch{}
      if (id != string.Empty)
      {
        string EditURL = Request.ApplicationPath + "/" + EditPage.URL(Server);
        AddParameter(ref EditURL, DataComponent.SelectIDParameterName, id);
        AddParameter(ref EditURL, "ObjectID", this.ObjectID);
        if (!bEdit)
          AddParameter(ref EditURL, "mode", "readonly");
        Response.Redirect(EditURL);
      }
     }
     // ¡ÀŒ  –≈ƒ¿ “»–Œ¬¿Õ»ﬂ «¿œ»—» end
     LoadData();
   }

    private void LoadData()
    {
      if (DataSource != null)
      {
              DataSource.Refresh();
              DataTable = DataSource.GetDataTable();
      }
      if (DataTable  != null)
      {
        DataView = DataComponent.PrepareDataSourceIG(DataTable, EditPage, AllowEdit, Mode.ToLower().IndexOf("readonly") < -1, ref EditColumnName, ref DeleteColumnName,  Server);
      }

      DataGrid_Tp_MOUT_LINE.Columns.Clear();
      DataGrid_Tp_MOUT_LINE.DataSource = DataView;
      this.DataBind();
     // change column headers here
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("ID").ServerOnly = true;
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("Brief").ServerOnly = true;

      if (DataGrid_Tp_MOUT_LINE.Columns.FromKey(EditColumnName) != null)
      {
          DataGrid_Tp_MOUT_LINE.Columns.FromKey(EditColumnName).AllowGroupBy = Infragistics.WebUI.UltraWebGrid.AllowGroupBy.No;
          DataGrid_Tp_MOUT_LINE.Columns.FromKey(EditColumnName).AllowRowFiltering = false;
          DataGrid_Tp_MOUT_LINE.Columns.FromKey(EditColumnName).Header.Caption = "Edit";
      }
      if (DataGrid_Tp_MOUT_LINE.Columns.FromKey(DeleteColumnName) != null)
      {
          DataGrid_Tp_MOUT_LINE.Columns.FromKey(DeleteColumnName).AllowGroupBy = Infragistics.WebUI.UltraWebGrid.AllowGroupBy.No;
          DataGrid_Tp_MOUT_LINE.Columns.FromKey(DeleteColumnName).AllowRowFiltering = false;
          DataGrid_Tp_MOUT_LINE.Columns.FromKey(DeleteColumnName).Header.Caption = "Delete";
      }

      DataGrid_Tp_MOUT_LINE.Columns.FromKey("Mtype").Header.Caption = "“ËÔ ÏÓ‰ÂÏ‡";
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("Mtype_ID").ServerOnly = true;
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("Quantity").Header.Caption = " ÓÎË˜ÂÒÚ‚Ó ÏÓ‰ÂÏÓ‚";
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("IsBroken").Header.Caption = "ÕÂËÒÔ‡‚Ì˚Â";
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("IsBroken_VAL").ServerOnly = true;
      DataGrid_Tp_MOUT_LINE.Columns.FromKey("PriceNDS").Header.Caption = "÷ÂÌ‡  Ò Õƒ—";
      if (AllowAddNew && AllowEdit)
      {
         if (EditPage != null)
         {
           string EditURL = Request.ApplicationPath + "/" + EditPage.URL(Server);
           AddParameter(ref EditURL, "mode", "addnew");
           AddParameter(ref EditURL, "ObjectID", ObjectID);
           HyperLinkAddNew.Text = "New row";
           HyperLinkAddNew.NavigateUrl = EditURL;
           HyperLinkAddNew.ImageUrl = "../../images/new.gif";
         }
      }
    }
    protected string ClientScript()
    {
      string Result = string.Empty;
      Result += "<script language=\"Javascript\">\n";
      Result +=  "function ConfirmDelete(id)\n";
      Result += "{\n";
      Result += "if (confirm('Delete row?') != 0)\n";
      Result += "{\n";
      Result += "__doPostBack('DeleteParameterNameTp_MOUT_LINE',id);\n";
      Result += "}\n}\n";
      Result += "</script>\n";
      Result += "<script language=\"Javascript\">\n";
      Result +=  "function LinkToEdit(id)\n";
      Result += "{\n";
      Result += " __doPostBack('" + EditParameterName + "','1'+id);\n";
      Result += "}\n";
      Result += "</script>\n";
      Result += "<script language=\"Javascript\">\n";
      Result +=  "function LinkToView(id)\n";
      Result += "{\n";
      Result += " __doPostBack('" + EditParameterName + "','0'+id);\n";
      Result += "}\n";
      Result += "</script>\n";
      return Result;
    }
    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
      base.OnInit(e);
      InitializeComponent();
    }

    private void InitializeComponent()
    {
      this.Load += new System.EventHandler(this.Page_Load);

    }
    #endregion

  }
  #endregion
}



