



namespace TP_MIN.ASPNET
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
  using TP_MIN;

  /// <summary>
  ///    ucTP_MIN_LINE - форма редактирования раздела Строки акта
  /// </summary>
  public partial class ucTP_MIN_LINE  : ucParent 
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

    public TP_MIN.TP_MIN_LINE RowItem
    {
      get
      {
        return (TP_MIN.TP_MIN_LINE)base.MKSNRowItem;
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
          DataTable dtMtype = MKSNManager.Session.GetData(" select TP_SPR_MTID , dbo.TP_SPR_MT_BRIEF_F(TP_SPR_MTID ) BRIEF from TP_SPR_MT order by BRIEF ");
          if (dtMtype!=null) { 
            cmbMtype.DataSource = dtMtype;
            cmbMtype.DataTextField = "BRIEF";
            cmbMtype.DataValueField = "TP_SPR_MTID";
          }
          cmbMtype.DataBind();
          if (RowItem.Mtype!= null)
          {
            cmbMtype.SelectedValue = RowItem.Mtype.ID.ToString();
          }
          cmbMtype.ToolTip = "Тип модема";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Mtype") > -1))
          {
            ControlsToHide.Add("btnMtype");
            cmbMtype.Enabled = false;
            rfvMtype.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Mtype") > -1) 
          {
            lblMtype.Visible = false;
            cmbMtype.Visible = false;
            rfvMtype.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbMtype, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("Quantity") > -1)) {
          txtQuantity.Text = GetValueFromRowItem(RowItem.Quantity);
   }
          txtQuantity.ToolTip = "Количество модемов";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Quantity") > -1))
          {
            ControlsToHide.Add("btnQuantity");
            txtQuantity.Enabled = false;
            rfvQuantity.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Quantity") > -1) 
          {
            lblQuantity.Visible = false;
            txtQuantity.Visible = false;
            rfvQuantity.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtQuantity, new EventArgs());
          }
          cmbIsBroken.Items.Clear();
          cmbIsBroken.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbIsBroken.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbIsBroken.SelectedValue = ((int)RowItem.IsBroken).ToString();
          }catch{}
          cmbIsBroken.ToolTip = "Неисправные";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("IsBroken") > -1))
          {
            ControlsToHide.Add("btnIsBroken");
            cmbIsBroken.Enabled = false;
            rfvIsBroken.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("IsBroken") > -1) 
          {
            lblIsBroken.Visible = false;
            cmbIsBroken.Visible = false;
            rfvIsBroken.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbIsBroken, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("PriceNDS") > -1)) {
          txtPriceNDS.Text = GetValueFromRowItem(RowItem.PriceNDS);
   }
          txtPriceNDS.ToolTip = "Цена  с НДС";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("PriceNDS") > -1))
          {
            ControlsToHide.Add("btnPriceNDS");
            txtPriceNDS.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("PriceNDS") > -1) 
          {
            lblPriceNDS.Visible = false;
            txtPriceNDS.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtPriceNDS, new EventArgs());
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
              TP_MIN_LINELabelInfo.Text = "Error on create row. ";
              TP_MIN_LINELabelInfo.ForeColor = System.Drawing.Color.Red;
           }
           return;
         }
        if (OnBeforeSave != null)
        {
          OnBeforeSave(this, new EventArgs());
        }
      if (cmbMtype.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Mtype = RowItem.Application.FindRowObject("TP_SPR_MT", new Guid(cmbMtype.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Mtype = null;
        }catch {}
      }
       try
       {
          RowItem.Quantity = Convert.ToInt32( txtQuantity.Text);
       }
       catch
       {
         TP_MIN_LINELabelInfo.Text = "Enter numeric value to field Количество модемов (example 100)";
         return;
       }
        try {
        RowItem.IsBroken = (TP_MIN.enumBoolean)Convert.ToInt32(cmbIsBroken.SelectedValue);
        }catch{}
       try
       {
          RowItem.PriceNDS = Convert.ToDouble( txtPriceNDS.Text);
       }
       catch
       {
         TP_MIN_LINELabelInfo.Text = "Enter numeric value to field Цена  с НДС (example 10)";
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
          TP_MIN_LINELabelInfo.ForeColor = System.Drawing.Color.Green;
          TP_MIN_LINELabelInfo.Text = "Row saved";
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
        TP_MIN_LINELabelInfo.Text = "Save error. " + Ex.Message;
        TP_MIN_LINELabelInfo.ForeColor = System.Drawing.Color.Red;
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



