



namespace TP_Zay.ASPNET
{
  using System;
  using System.Data;
  using System.IO;
  using System.Collections;
  using System.Drawing;
  using System.Web;
  using System.Web.UI.WebControls;
  using System.Web.UI.HtmlControls;
  using System.Globalization;
  using Mokasin.ASPNET;
  using TP_Zay;

  /// <summary>
  ///    ucTP_Zayav_Ist - форма редактирования раздела История
  /// </summary>
  public partial class ucTP_Zayav_Ist  : ucParent 
  {
    protected ArrayList ControlsToHide = new ArrayList();
    public override event System.EventHandler OnFieldInit;
    public override event System.EventHandler OnBeforeSave;
    public override event System.EventHandler OnAfterSave;
    public override event System.EventHandler OnCancel;
    public override event InfoEventHandler OnInfo;

    public override string CancelButtonID
    {
      get
      {
        return btnCancel.ClientID;
      }
    }

    public override string SaveButtonID
    {
      get
      {
        return btnSave.ClientID;
      }
    }

    public TP_Zay.TP_Zayav_Ist RowItem
    {
      get
      {
        return (TP_Zay.TP_Zayav_Ist)base.MKSNRowItem;
      }
    }

    private bool ReadOnly
    {
      get
      {
        return !AllowEdit;
      }
    }

    private void Page_Unload(object sender, System.EventArgs e)
    {
      return;
    }

    private void Page_Load(object sender, System.EventArgs e)
    {
      base.Page_Load(sender,e); 
      if (RowItem != null)
      {
   if (!(DataComponent.DenyVisible.IndexOf("ImenStatys") > -1)) {
          txtImenStatys.Text = GetValueFromRowItem(RowItem.ImenStatys);
   }
          txtImenStatys.ToolTip = "Изменён статус";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("ImenStatys") > -1))
          {
            ControlsToHide.Add("btnImenStatys");
            txtImenStatys.Enabled = false;
            rfvImenStatys.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("ImenStatys") > -1) 
          {
            lblImenStatys.Visible = false;
            txtImenStatys.Visible = false;
            rfvImenStatys.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtImenStatys, new EventArgs());
          }
          if(RowItem.Data != Convert.ToDateTime("30.12.1899") && RowItem.Data != Convert.ToDateTime("01.01.0001"))
          {
            DateData.Text = RowItem.Data.ToShortDateString();
            TimeData.Text = RowItem.Data.ToShortTimeString();
          }
          DateData.ToolTip = "Дата и время изменения";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Data") > -1))
          {
            ControlsToHide.Add("btnData");
            DateData.Enabled = false;
            rfvData.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Data") > -1) 
          {
            lblData.Visible = false;
            DateData.Visible = false;
            rfvData.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateData, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("FIO") > -1)) {
          txtFIO.Text = GetValueFromRowItem(RowItem.FIO);
   }
          txtFIO.ToolTip = "Изменил(ФИО)";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("FIO") > -1))
          {
            ControlsToHide.Add("btnFIO");
            txtFIO.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("FIO") > -1) 
          {
            lblFIO.Visible = false;
            txtFIO.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtFIO, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("Komment") > -1)) {
          txtKomment.Text = GetValueFromRowItem(RowItem.Komment);
   }
          txtKomment.ToolTip = "Комментарий";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Komment") > -1))
          {
            ControlsToHide.Add("btnKomment");
            txtKomment.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Komment") > -1) 
          {
            lblKomment.Visible = false;
            txtKomment.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtKomment, new EventArgs());
          }
      }
      if (ReadOnly) btnSave.Enabled = false;
    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
      base.OnInit(e);
      InitializeComponent();
    }

    private void InitializeComponent()
    {
      this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
      this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
      this.Load += new System.EventHandler(this.Page_Load);
      this.Unload += new System.EventHandler(this.Page_Unload);

    }
    #endregion

     private string GetValueFromRowItem(object RowItemValue)
     {
       string Result = string.Empty;
       if (RowItemValue != null)
       {
         Result = RowItemValue.ToString();
       }

       return Result;
     }

    private void btnCancel_Click(object sender, System.EventArgs e)
    {
        if (OnCancel != null)
        {
          OnCancel(this, new EventArgs());
        }
        else
        {
           //Response.Redirect(BackUrl);
        }
          try
        {
                    object obj;
                    obj = this;
                    while ( !(obj is  VACOOLA.ParentPage) && obj!=null){
                        obj = (obj as System.Web.UI.Control).Parent;
                    }
                    (obj as VACOOLA.ParentPage).GoBack();
                }
                catch { }
    }

    private void btnSave_Click(object sender, System.EventArgs e)
    {
         if (RowItem == null)
         {
           if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Error on create row.", System.Drawing.Color.Red));
           }
           else
           {
              TP_Zayav_IstLabelInfo.Text = "Error on create row. ";
              TP_Zayav_IstLabelInfo.ForeColor = System.Drawing.Color.Red;
           }
           return;
         }
        if (OnBeforeSave != null)
        {
          OnBeforeSave(this, new EventArgs());
        }
   RowItem.ImenStatys = txtImenStatys.Text;
       try
       {
         if (DateData.Text != string.Empty)
         {
            DateTime newValue;
            newValue = Convert.ToDateTime(DateData.Text + " " +  TimeData.Text);
            RowItem.Data = newValue;
         }
         else 
         {
              RowItem.Data = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
         {
            OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Дата и время изменения (например 14.11.1973)", System.Drawing.Color.Red));
         }
         else
         {
            TP_Zayav_IstLabelInfo.Text = "Введите правильную дату в поле Дата и время изменения (например 14.11.1973)";
            lblData.ForeColor = System.Drawing.Color.Red;
         }
         return;
       }
   RowItem.FIO = txtFIO.Text;
   RowItem.Komment = txtKomment.Text;
      try
      {
        RowItem.Save();
        if (OnInfo != null)
        {
          OnInfo(this, new InfoEventArgs("Row saved", System.Drawing.Color.Green));
        }
        else
        {
          TP_Zayav_IstLabelInfo.ForeColor = System.Drawing.Color.Green;
          TP_Zayav_IstLabelInfo.Text = "Row saved";
        }
        if (OnAfterSave != null)
        {
          OnAfterSave(this, new EventArgs());
        }
          try
        {
                    object obj;
                    obj = this;
                    while ( !(obj is  VACOOLA.ParentPage) && obj!=null){
                        obj = (obj as System.Web.UI.Control).Parent;
                    }
                    (obj as VACOOLA.ParentPage).GoBack();
                }
                catch { }
      }
      catch(Exception Ex)
      {
        TP_Zayav_IstLabelInfo.Text = "Save error. " + Ex.Message;
        TP_Zayav_IstLabelInfo.ForeColor = System.Drawing.Color.Red;
      }
    }
    private DataView ConfigureView(DataTable dt, string DataTextFormatString)
    {
      DataView Result = null;
      DataTable NewDT = new DataTable(dt.TableName);
      NewDT.Columns.Add("text");
      NewDT.Columns.Add("id");
      foreach(DataRow dr  in dt.Rows)
      {
        DataRow newDr = NewDT.NewRow();
        newDr["id"] = dr["ID"].ToString();
        string Text =  DataTextFormatString;
        foreach(DataColumn col in dt.Columns )
        {
           Text = Text.Replace(col.ColumnName, dr[col].ToString());
        }
        newDr["text"] = Text;
        NewDT.Rows.Add(newDr);
      }
      Result = NewDT.DefaultView;
      Result.Sort = "text";
      return Result;
    }

    protected string GetOnLoadScript()
    {
      string result = string.Empty;
      if (ControlsToHide != null)
      {
        foreach(string str in ControlsToHide)
        {
          result += "ElementHide('" + str + "');";
        }
      }
      return result;
    }
  }
}



