



namespace TP_MOUT.ASPNET
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
  using TP_MOUT;

  /// <summary>
  ///    ucTP_MOUT_DEF - форма редактирования раздела Акт передачи модема
  /// </summary>
  public partial class ucTP_MOUT_DEF  : ucParent 
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

    public TP_MOUT.TP_MOUT_DEF RowItem
    {
      get
      {
        return (TP_MOUT.TP_MOUT_DEF)base.MKSNRowItem;
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
          if(RowItem.TheDAte != Convert.ToDateTime("30.12.1899") && RowItem.TheDAte != Convert.ToDateTime("01.01.0001"))
            DateTheDAte.Text=RowItem.TheDAte.ToShortDateString();
          DateTheDAte.ToolTip = "Дата акта";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("TheDAte") > -1))
          {
            ControlsToHide.Add("btnTheDAte");
            DateTheDAte.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("TheDAte") > -1) 
          {
            lblTheDAte.Visible = false;
            DateTheDAte.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateTheDAte, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("ActNum") > -1)) {
          txtActNum.Text = GetValueFromRowItem(RowItem.ActNum);
   }
          txtActNum.ToolTip = "Номер акта";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("ActNum") > -1))
          {
            ControlsToHide.Add("btnActNum");
            txtActNum.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("ActNum") > -1) 
          {
            lblActNum.Visible = false;
            txtActNum.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtActNum, new EventArgs());
          }
          cmbRetToSZT.Items.Clear();
          cmbRetToSZT.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbRetToSZT.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbRetToSZT.SelectedValue = ((int)RowItem.RetToSZT).ToString();
          }catch{}
          cmbRetToSZT.ToolTip = "Возврат в СЗТ";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("RetToSZT") > -1))
          {
            ControlsToHide.Add("btnRetToSZT");
            cmbRetToSZT.Enabled = false;
            rfvRetToSZT.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("RetToSZT") > -1) 
          {
            lblRetToSZT.Visible = false;
            cmbRetToSZT.Visible = false;
            rfvRetToSZT.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbRetToSZT, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("NDS") > -1)) {
          txtNDS.Text = GetValueFromRowItem(RowItem.NDS);
   }
          txtNDS.ToolTip = "Ставка НДС";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("NDS") > -1))
          {
            ControlsToHide.Add("btnNDS");
            txtNDS.Enabled = false;
            rfvNDS.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("NDS") > -1) 
          {
            lblNDS.Visible = false;
            txtNDS.Visible = false;
            rfvNDS.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtNDS, new EventArgs());
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
              TP_MOUT_DEFLabelInfo.Text = "Error on create row. ";
              TP_MOUT_DEFLabelInfo.ForeColor = System.Drawing.Color.Red;
           }
           return;
         }
        if (OnBeforeSave != null)
        {
          OnBeforeSave(this, new EventArgs());
        }
       try
       {
         if (DateTheDAte.Text != string.Empty)
         {
              RowItem.TheDAte = Convert.ToDateTime(DateTheDAte.Text);
         }
         else 
         {
              RowItem.TheDAte = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Дата акта (например 14.11.1973)", System.Drawing.Color.Red));
           }
           else
           {
              TP_MOUT_DEFLabelInfo.Text = "Введите правильную дату в поле Дата акта (например 14.11.1973)";
           }
       }
   RowItem.ActNum = txtActNum.Text;
        try {
        RowItem.RetToSZT = (TP_MOUT.enumBoolean)Convert.ToInt32(cmbRetToSZT.SelectedValue);
        }catch{}
       try
       {
          RowItem.NDS = Convert.ToDouble( txtNDS.Text);
       }
       catch
       {
         TP_MOUT_DEFLabelInfo.Text = "Enter numeric value to field Ставка НДС (example 10)";
         return;
       }
      try
      {
        RowItem.Save();
        if (OnInfo != null)
        {
          OnInfo(this, new InfoEventArgs("Row saved", System.Drawing.Color.Green));
        }
        else
        {
          TP_MOUT_DEFLabelInfo.ForeColor = System.Drawing.Color.Green;
          TP_MOUT_DEFLabelInfo.Text = "Row saved";
        }
        if (OnAfterSave != null)
        {
          OnAfterSave(this, new EventArgs());
        }
      }
      catch(Exception Ex)
      {
        TP_MOUT_DEFLabelInfo.Text = "Save error. " + Ex.Message;
        TP_MOUT_DEFLabelInfo.ForeColor = System.Drawing.Color.Red;
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



