



namespace TP_Spr.ASPNET
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
  using TP_Spr;

  /// <summary>
  ///    ucTP_Spr_VrVisInst - форма редактирования раздела Время визита инсталятора
  /// </summary>
  public partial class ucTP_Spr_VrVisInst  : ucParent 
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

    public TP_Spr.TP_Spr_VrVisInst RowItem
    {
      get
      {
        return (TP_Spr.TP_Spr_VrVisInst)base.MKSNRowItem;
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
   if (!(DataComponent.DenyVisible.IndexOf("Name") > -1)) {
          txtName.Text = GetValueFromRowItem(RowItem.Name);
   }
          txtName.ToolTip = "Время визита инсталятора";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Name") > -1))
          {
            ControlsToHide.Add("btnName");
            txtName.Enabled = false;
            rfvName.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Name") > -1) 
          {
            lblName.Visible = false;
            txtName.Visible = false;
            rfvName.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtName, new EventArgs());
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
              TP_Spr_VrVisInstLabelInfo.Text = "Error on create row. ";
              TP_Spr_VrVisInstLabelInfo.ForeColor = System.Drawing.Color.Red;
           }
           return;
         }
        if (OnBeforeSave != null)
        {
          OnBeforeSave(this, new EventArgs());
        }
   RowItem.Name = txtName.Text;
      try
      {
        RowItem.Save();
        if (OnInfo != null)
        {
          OnInfo(this, new InfoEventArgs("Row saved", System.Drawing.Color.Green));
        }
        else
        {
          TP_Spr_VrVisInstLabelInfo.ForeColor = System.Drawing.Color.Green;
          TP_Spr_VrVisInstLabelInfo.Text = "Row saved";
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
        TP_Spr_VrVisInstLabelInfo.Text = "Save error. " + Ex.Message;
        TP_Spr_VrVisInstLabelInfo.ForeColor = System.Drawing.Color.Red;
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



