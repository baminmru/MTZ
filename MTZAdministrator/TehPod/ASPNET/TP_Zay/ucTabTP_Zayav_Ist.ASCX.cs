


  namespace TP_Zay.ASPNET
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
  using TP_Zay;
  public partial class ucTabTP_Zayav_Ist  : ucParent
  {
    // ����������� ������
    string EditColumnName = "EditColumn";
    string DeleteParameterName = "DeleteParameterName";
    string DeleteColumnName = "DeleteColumn";
    string EditParameterName = "EditParameterName";
    private int EditColumnIndex = -1;
    private int DeleteColumnIndex = -1;
    private int SelectColumnIndex = -1;

    public  TP_Zay.TP_Zayav_Ist_col DataSource
    { 
      get
      {
        return (TP_Zay.TP_Zayav_Ist_col)base.MKSNDataSource;
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
    // ���� �������� ������ begin
      if (EVENTTARGET  == DeleteParameterName + "TP_Zayav_Ist")
      {
        string id = EVENTARGUMENT;
        if (id != string.Empty)
        {
         // ������� ������
         DataSource.Delete(id);
         DataSource.Refresh();
        }
      }
      // ���� �������� ������ end
      // ���� �������������� ������ begin
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
     // ���� �������������� ������ end
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

      DataGrid_TP_Zayav_Ist.Columns.Clear();
      DataGrid_TP_Zayav_Ist.DataSource = DataView;
      this.DataBind();
     // change column headers here
      DataGrid_TP_Zayav_Ist.Columns.FromKey("ID").ServerOnly = true;
      DataGrid_TP_Zayav_Ist.Columns.FromKey("Brief").ServerOnly = true;

      if (DataGrid_TP_Zayav_Ist.Columns.FromKey(EditColumnName) != null)
      {
          DataGrid_TP_Zayav_Ist.Columns.FromKey(EditColumnName).AllowGroupBy = Infragistics.WebUI.UltraWebGrid.AllowGroupBy.No;
          DataGrid_TP_Zayav_Ist.Columns.FromKey(EditColumnName).AllowRowFiltering = false;
          DataGrid_TP_Zayav_Ist.Columns.FromKey(EditColumnName).Header.Caption = "Edit";
      }
      if (DataGrid_TP_Zayav_Ist.Columns.FromKey(DeleteColumnName) != null)
      {
          DataGrid_TP_Zayav_Ist.Columns.FromKey(DeleteColumnName).AllowGroupBy = Infragistics.WebUI.UltraWebGrid.AllowGroupBy.No;
          DataGrid_TP_Zayav_Ist.Columns.FromKey(DeleteColumnName).AllowRowFiltering = false;
          DataGrid_TP_Zayav_Ist.Columns.FromKey(DeleteColumnName).Header.Caption = "Delete";
      }

      DataGrid_TP_Zayav_Ist.Columns.FromKey("ImenStatys").Header.Caption = "������� ������";
      DataGrid_TP_Zayav_Ist.Columns.FromKey("Data").Header.Caption = "���� � ����� ���������";
      DataGrid_TP_Zayav_Ist.Columns.FromKey("FIO").Header.Caption = "�������(���)";
      DataGrid_TP_Zayav_Ist.Columns.FromKey("Komment").Header.Caption = "�����������";
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
      Result += "__doPostBack('DeleteParameterNameTP_Zayav_Ist',id);\n";
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


