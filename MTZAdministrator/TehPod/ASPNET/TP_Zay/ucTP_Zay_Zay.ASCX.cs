



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
  ///    ucTP_Zay_Zay - форма редактирования раздела Заявка
  /// </summary>
  public partial class ucTP_Zay_Zay  : ucParent 
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

    public TP_Zay.TP_Zay_Zay RowItem
    {
      get
      {
        return (TP_Zay.TP_Zay_Zay)base.MKSNRowItem;
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
   if (!(DataComponent.DenyVisible.IndexOf("Num") > -1)) {
          txtNum.Text = GetValueFromRowItem(RowItem.Num);
   }
          txtNum.ToolTip = "Номер заявки ";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Num") > -1))
          {
            ControlsToHide.Add("btnNum");
            txtNum.Enabled = false;
            rfvNum.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Num") > -1) 
          {
            lblNum.Visible = false;
            txtNum.Visible = false;
            rfvNum.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtNum, new EventArgs());
          }
          if(RowItem.DataPriem != Convert.ToDateTime("30.12.1899") && RowItem.DataPriem != Convert.ToDateTime("01.01.0001"))
            DateDataPriem.Text=RowItem.DataPriem.ToShortDateString();
          DateDataPriem.ToolTip = "Дата приема";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("DataPriem") > -1))
          {
            ControlsToHide.Add("btnDataPriem");
            DateDataPriem.Enabled = false;
            rfvDataPriem.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("DataPriem") > -1) 
          {
            lblDataPriem.Visible = false;
            DateDataPriem.Visible = false;
            rfvDataPriem.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateDataPriem, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("FIO") > -1)) {
          txtFIO.Text = GetValueFromRowItem(RowItem.FIO);
   }
          txtFIO.ToolTip = "ФИО";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("FIO") > -1))
          {
            ControlsToHide.Add("btnFIO");
            txtFIO.Enabled = false;
            rfvFIO.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("FIO") > -1) 
          {
            lblFIO.Visible = false;
            txtFIO.Visible = false;
            rfvFIO.Enabled = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtFIO, new EventArgs());
          }
          DataTable dtTheOperator = MKSNManager.Session.GetData(" select TP_Spr_OperID , dbo.TP_Spr_Oper_BRIEF_F(TP_Spr_OperID ) BRIEF from TP_Spr_Oper order by BRIEF ");
          if (dtTheOperator!=null) { 
            cmbTheOperator.DataSource = dtTheOperator;
            cmbTheOperator.DataTextField = "BRIEF";
            cmbTheOperator.DataValueField = "TP_Spr_OperID";
          }
          cmbTheOperator.DataBind();
          if (RowItem.TheOperator!= null)
          {
            cmbTheOperator.SelectedValue = RowItem.TheOperator.ID.ToString();
          }
          cmbTheOperator.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbTheOperator.ToolTip = "Оператор";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("TheOperator") > -1))
          {
            ControlsToHide.Add("btnTheOperator");
            cmbTheOperator.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("TheOperator") > -1) 
          {
            lblTheOperator.Visible = false;
            cmbTheOperator.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbTheOperator, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("Adres") > -1)) {
          txtAdres.Text = GetValueFromRowItem(RowItem.Adres);
   }
          txtAdres.ToolTip = "Адрес";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Adres") > -1))
          {
            ControlsToHide.Add("btnAdres");
            txtAdres.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Adres") > -1) 
          {
            lblAdres.Visible = false;
            txtAdres.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtAdres, new EventArgs());
          }
          DataTable dtRayon = MKSNManager.Session.GetData(" select RayonID , dbo.Rayon_BRIEF_F(RayonID ) BRIEF from Rayon order by BRIEF ");
          if (dtRayon!=null) { 
            cmbRayon.DataSource = dtRayon;
            cmbRayon.DataTextField = "BRIEF";
            cmbRayon.DataValueField = "RayonID";
          }
          cmbRayon.DataBind();
          if (RowItem.Rayon!= null)
          {
            cmbRayon.SelectedValue = RowItem.Rayon.ID.ToString();
          }
          cmbRayon.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbRayon.ToolTip = "Район";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Rayon") > -1))
          {
            ControlsToHide.Add("btnRayon");
            cmbRayon.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Rayon") > -1) 
          {
            lblRayon.Visible = false;
            cmbRayon.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbRayon, new EventArgs());
          }
          DataTable dtMetro = MKSNManager.Session.GetData(" select TP_Spr_MetroID , dbo.TP_Spr_Metro_BRIEF_F(TP_Spr_MetroID ) BRIEF from TP_Spr_Metro order by BRIEF ");
          if (dtMetro!=null) { 
            cmbMetro.DataSource = dtMetro;
            cmbMetro.DataTextField = "BRIEF";
            cmbMetro.DataValueField = "TP_Spr_MetroID";
          }
          cmbMetro.DataBind();
          if (RowItem.Metro!= null)
          {
            cmbMetro.SelectedValue = RowItem.Metro.ID.ToString();
          }
          cmbMetro.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbMetro.ToolTip = "Метро";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Metro") > -1))
          {
            ControlsToHide.Add("btnMetro");
            cmbMetro.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Metro") > -1) 
          {
            lblMetro.Visible = false;
            cmbMetro.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbMetro, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("KonrLizo") > -1)) {
          txtKonrLizo.Text = GetValueFromRowItem(RowItem.KonrLizo);
   }
          txtKonrLizo.ToolTip = "Контактное лицо";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("KonrLizo") > -1))
          {
            ControlsToHide.Add("btnKonrLizo");
            txtKonrLizo.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("KonrLizo") > -1) 
          {
            lblKonrLizo.Visible = false;
            txtKonrLizo.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtKonrLizo, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("KontTelefon") > -1)) {
          txtKontTelefon.Text = GetValueFromRowItem(RowItem.KontTelefon);
   }
          txtKontTelefon.ToolTip = "Контактный телефон";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("KontTelefon") > -1))
          {
            ControlsToHide.Add("btnKontTelefon");
            txtKontTelefon.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("KontTelefon") > -1) 
          {
            lblKontTelefon.Visible = false;
            txtKontTelefon.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtKontTelefon, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("KontEMAIL") > -1)) {
          txtKontEMAIL.Text = GetValueFromRowItem(RowItem.KontEMAIL);
   }
          txtKontEMAIL.ToolTip = "Контактный e-mail";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("KontEMAIL") > -1))
          {
            ControlsToHide.Add("btnKontEMAIL");
            txtKontEMAIL.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("KontEMAIL") > -1) 
          {
            lblKontEMAIL.Visible = false;
            txtKontEMAIL.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtKontEMAIL, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("VremjaDljaSvjazi") > -1)) {
          txtVremjaDljaSvjazi.Text = GetValueFromRowItem(RowItem.VremjaDljaSvjazi);
   }
          txtVremjaDljaSvjazi.ToolTip = "Время для связи";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("VremjaDljaSvjazi") > -1))
          {
            ControlsToHide.Add("btnVremjaDljaSvjazi");
            txtVremjaDljaSvjazi.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("VremjaDljaSvjazi") > -1) 
          {
            lblVremjaDljaSvjazi.Visible = false;
            txtVremjaDljaSvjazi.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtVremjaDljaSvjazi, new EventArgs());
          }
          if(RowItem.GelData != Convert.ToDateTime("30.12.1899") && RowItem.GelData != Convert.ToDateTime("01.01.0001"))
            DateGelData.Text=RowItem.GelData.ToShortDateString();
          DateGelData.ToolTip = "Желаемая дата визита инсталятора";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("GelData") > -1))
          {
            ControlsToHide.Add("btnGelData");
            DateGelData.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("GelData") > -1) 
          {
            lblGelData.Visible = false;
            DateGelData.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateGelData, new EventArgs());
          }
          DataTable dtGelVremja = MKSNManager.Session.GetData(" select TP_Spr_VrVisInstID , dbo.TP_Spr_VrVisInst_BRIEF_F(TP_Spr_VrVisInstID ) BRIEF from TP_Spr_VrVisInst order by BRIEF ");
          if (dtGelVremja!=null) { 
            cmbGelVremja.DataSource = dtGelVremja;
            cmbGelVremja.DataTextField = "BRIEF";
            cmbGelVremja.DataValueField = "TP_Spr_VrVisInstID";
          }
          cmbGelVremja.DataBind();
          if (RowItem.GelVremja!= null)
          {
            cmbGelVremja.SelectedValue = RowItem.GelVremja.ID.ToString();
          }
          cmbGelVremja.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbGelVremja.ToolTip = "Желаемое время визита инсталятора";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("GelVremja") > -1))
          {
            ControlsToHide.Add("btnGelVremja");
            cmbGelVremja.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("GelVremja") > -1) 
          {
            lblGelVremja.Visible = false;
            cmbGelVremja.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbGelVremja, new EventArgs());
          }
          DataTable dtPortref = MKSNManager.Session.GetData(" select TP_SPR_PortID , dbo.TP_SPR_Port_BRIEF_F(TP_SPR_PortID ) BRIEF from TP_SPR_Port order by BRIEF ");
          if (dtPortref!=null) { 
            cmbPortref.DataSource = dtPortref;
            cmbPortref.DataTextField = "BRIEF";
            cmbPortref.DataValueField = "TP_SPR_PortID";
          }
          cmbPortref.DataBind();
          if (RowItem.Portref!= null)
          {
            cmbPortref.SelectedValue = RowItem.Portref.ID.ToString();
          }
          cmbPortref.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbPortref.ToolTip = "Порт";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Portref") > -1))
          {
            ControlsToHide.Add("btnPortref");
            cmbPortref.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Portref") > -1) 
          {
            lblPortref.Visible = false;
            cmbPortref.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbPortref, new EventArgs());
          }
          DataTable dtKoordin = MKSNManager.Session.GetData(" select TP_Spr_KoorID , dbo.TP_Spr_Koor_BRIEF_F(TP_Spr_KoorID ) BRIEF from TP_Spr_Koor order by BRIEF ");
          if (dtKoordin!=null) { 
            cmbKoordin.DataSource = dtKoordin;
            cmbKoordin.DataTextField = "BRIEF";
            cmbKoordin.DataValueField = "TP_Spr_KoorID";
          }
          cmbKoordin.DataBind();
          if (RowItem.Koordin!= null)
          {
            cmbKoordin.SelectedValue = RowItem.Koordin.ID.ToString();
          }
          cmbKoordin.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbKoordin.ToolTip = "Координатор";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Koordin") > -1))
          {
            ControlsToHide.Add("btnKoordin");
            cmbKoordin.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Koordin") > -1) 
          {
            lblKoordin.Visible = false;
            cmbKoordin.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbKoordin, new EventArgs());
          }
          DataTable dtIngener = MKSNManager.Session.GetData(" select TP_Spr_IngID , dbo.TP_Spr_Ing_BRIEF_F(TP_Spr_IngID ) BRIEF from TP_Spr_Ing order by BRIEF ");
          if (dtIngener!=null) { 
            cmbIngener.DataSource = dtIngener;
            cmbIngener.DataTextField = "BRIEF";
            cmbIngener.DataValueField = "TP_Spr_IngID";
          }
          cmbIngener.DataBind();
          if (RowItem.Ingener!= null)
          {
            cmbIngener.SelectedValue = RowItem.Ingener.ID.ToString();
          }
          cmbIngener.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbIngener.ToolTip = "Инженер";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Ingener") > -1))
          {
            ControlsToHide.Add("btnIngener");
            cmbIngener.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Ingener") > -1) 
          {
            lblIngener.Visible = false;
            cmbIngener.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbIngener, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("VidanModemSer") > -1)) {
          txtVidanModemSer.Text = GetValueFromRowItem(RowItem.VidanModemSer);
   }
          txtVidanModemSer.ToolTip = "Выданный модем серийник";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("VidanModemSer") > -1))
          {
            ControlsToHide.Add("btnVidanModemSer");
            txtVidanModemSer.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("VidanModemSer") > -1) 
          {
            lblVidanModemSer.Visible = false;
            txtVidanModemSer.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtVidanModemSer, new EventArgs());
          }
          DataTable dtTarif = MKSNManager.Session.GetData(" select TP_Spr_TarID , dbo.TP_Spr_Tar_BRIEF_F(TP_Spr_TarID ) BRIEF from TP_Spr_Tar order by BRIEF ");
          if (dtTarif!=null) { 
            cmbTarif.DataSource = dtTarif;
            cmbTarif.DataTextField = "BRIEF";
            cmbTarif.DataValueField = "TP_Spr_TarID";
          }
          cmbTarif.DataBind();
          if (RowItem.Tarif!= null)
          {
            cmbTarif.SelectedValue = RowItem.Tarif.ID.ToString();
          }
          cmbTarif.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbTarif.ToolTip = "Тариф";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Tarif") > -1))
          {
            ControlsToHide.Add("btnTarif");
            cmbTarif.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Tarif") > -1) 
          {
            lblTarif.Visible = false;
            cmbTarif.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbTarif, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("FIOdogovor") > -1)) {
          txtFIOdogovor.Text = GetValueFromRowItem(RowItem.FIOdogovor);
   }
          txtFIOdogovor.ToolTip = "ФИО в договоре";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("FIOdogovor") > -1))
          {
            ControlsToHide.Add("btnFIOdogovor");
            txtFIOdogovor.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("FIOdogovor") > -1) 
          {
            lblFIOdogovor.Visible = false;
            txtFIOdogovor.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtFIOdogovor, new EventArgs());
          }
          if(RowItem.DataInstall != Convert.ToDateTime("30.12.1899") && RowItem.DataInstall != Convert.ToDateTime("01.01.0001"))
            DateDataInstall.Text=RowItem.DataInstall.ToShortDateString();
          DateDataInstall.ToolTip = "Дата инсталяции";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("DataInstall") > -1))
          {
            ControlsToHide.Add("btnDataInstall");
            DateDataInstall.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("DataInstall") > -1) 
          {
            lblDataInstall.Visible = false;
            DateDataInstall.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateDataInstall, new EventArgs());
          }
          DataTable dtSrochDogovor = MKSNManager.Session.GetData(" select TP_Spr_SrochDogID , dbo.TP_Spr_SrochDog_BRIEF_F(TP_Spr_SrochDogID ) BRIEF from TP_Spr_SrochDog order by BRIEF ");
          if (dtSrochDogovor!=null) { 
            cmbSrochDogovor.DataSource = dtSrochDogovor;
            cmbSrochDogovor.DataTextField = "BRIEF";
            cmbSrochDogovor.DataValueField = "TP_Spr_SrochDogID";
          }
          cmbSrochDogovor.DataBind();
          if (RowItem.SrochDogovor!= null)
          {
            cmbSrochDogovor.SelectedValue = RowItem.SrochDogovor.ID.ToString();
          }
          cmbSrochDogovor.Items.Insert(0, new System.Web.UI.WebControls.ListItem(string.Empty, string.Empty));
          cmbSrochDogovor.ToolTip = "Срок договора";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("SrochDogovor") > -1))
          {
            ControlsToHide.Add("btnSrochDogovor");
            cmbSrochDogovor.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("SrochDogovor") > -1) 
          {
            lblSrochDogovor.Visible = false;
            cmbSrochDogovor.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbSrochDogovor, new EventArgs());
          }
          cmbDocPolych.Items.Clear();
          cmbDocPolych.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbDocPolych.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbDocPolych.SelectedValue = ((int)RowItem.DocPolych).ToString();
          }catch{}
          cmbDocPolych.ToolTip = "Документы получены";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("DocPolych") > -1))
          {
            ControlsToHide.Add("btnDocPolych");
            cmbDocPolych.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("DocPolych") > -1) 
          {
            lblDocPolych.Visible = false;
            cmbDocPolych.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbDocPolych, new EventArgs());
          }
          if(RowItem.DataSZT != Convert.ToDateTime("30.12.1899") && RowItem.DataSZT != Convert.ToDateTime("01.01.0001"))
            DateDataSZT.Text=RowItem.DataSZT.ToShortDateString();
          DateDataSZT.ToolTip = "Дата передачи в СЗТ";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("DataSZT") > -1))
          {
            ControlsToHide.Add("btnDataSZT");
            DateDataSZT.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("DataSZT") > -1) 
          {
            lblDataSZT.Visible = false;
            DateDataSZT.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateDataSZT, new EventArgs());
          }
          cmbVklVReestr.Items.Clear();
          cmbVklVReestr.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbVklVReestr.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbVklVReestr.SelectedValue = ((int)RowItem.VklVReestr).ToString();
          }catch{}
          cmbVklVReestr.ToolTip = "Включена в реестр для оплаты";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("VklVReestr") > -1))
          {
            ControlsToHide.Add("btnVklVReestr");
            cmbVklVReestr.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("VklVReestr") > -1) 
          {
            lblVklVReestr.Visible = false;
            cmbVklVReestr.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbVklVReestr, new EventArgs());
          }
          cmbOtkaz.Items.Clear();
          cmbOtkaz.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbOtkaz.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbOtkaz.SelectedValue = ((int)RowItem.Otkaz).ToString();
          }catch{}
          cmbOtkaz.ToolTip = "Отказ";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("Otkaz") > -1))
          {
            ControlsToHide.Add("btnOtkaz");
            cmbOtkaz.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("Otkaz") > -1) 
          {
            lblOtkaz.Visible = false;
            cmbOtkaz.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbOtkaz, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("OpisProblem") > -1)) {
          txtOpisProblem.Text = GetValueFromRowItem(RowItem.OpisProblem);
   }
          txtOpisProblem.ToolTip = "Описание проблемы";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("OpisProblem") > -1))
          {
            ControlsToHide.Add("btnOpisProblem");
            txtOpisProblem.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("OpisProblem") > -1) 
          {
            lblOpisProblem.Visible = false;
            txtOpisProblem.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtOpisProblem, new EventArgs());
          }
          cmbOtprVKEY.Items.Clear();
          cmbOtprVKEY.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbOtprVKEY.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbOtprVKEY.SelectedValue = ((int)RowItem.OtprVKEY).ToString();
          }catch{}
          cmbOtprVKEY.ToolTip = "Отправлено в КЭУ";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("OtprVKEY") > -1))
          {
            ControlsToHide.Add("btnOtprVKEY");
            cmbOtprVKEY.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("OtprVKEY") > -1) 
          {
            lblOtprVKEY.Visible = false;
            cmbOtprVKEY.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbOtprVKEY, new EventArgs());
          }
          if(RowItem.DataOtpravVKEY != Convert.ToDateTime("30.12.1899") && RowItem.DataOtpravVKEY != Convert.ToDateTime("01.01.0001"))
            DateDataOtpravVKEY.Text=RowItem.DataOtpravVKEY.ToShortDateString();
          DateDataOtpravVKEY.ToolTip = "Дата отправки в КЭУ";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("DataOtpravVKEY") > -1))
          {
            ControlsToHide.Add("btnDataOtpravVKEY");
            DateDataOtpravVKEY.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("DataOtpravVKEY") > -1) 
          {
            lblDataOtpravVKEY.Visible = false;
            DateDataOtpravVKEY.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(DateDataOtpravVKEY, new EventArgs());
          }
          cmbDopSogl.Items.Clear();
          cmbDopSogl.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Да", "-1"));
          cmbDopSogl.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Нет", "0"));
          try {
          cmbDopSogl.SelectedValue = ((int)RowItem.DopSogl).ToString();
          }catch{}
          cmbDopSogl.ToolTip = "Дополнительное соглашение";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("DopSogl") > -1))
          {
            ControlsToHide.Add("btnDopSogl");
            cmbDopSogl.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("DopSogl") > -1) 
          {
            lblDopSogl.Visible = false;
            cmbDopSogl.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(cmbDopSogl, new EventArgs());
          }
   if (!(DataComponent.DenyVisible.IndexOf("NumDogovor") > -1)) {
          txtNumDogovor.Text = GetValueFromRowItem(RowItem.NumDogovor);
   }
          txtNumDogovor.ToolTip = "Номер договора";
          if (ReadOnly || (DataComponent.DenyEdit.IndexOf("NumDogovor") > -1))
          {
            ControlsToHide.Add("btnNumDogovor");
            txtNumDogovor.Enabled = false;
          }
          if (DataComponent.DenyVisible.IndexOf("NumDogovor") > -1) 
          {
            lblNumDogovor.Visible = false;
            txtNumDogovor.Visible = false;
          }
          if (OnFieldInit != null)
          {
            OnFieldInit(txtNumDogovor, new EventArgs());
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
              TP_Zay_ZayLabelInfo.Text = "Error on create row. ";
              TP_Zay_ZayLabelInfo.ForeColor = System.Drawing.Color.Red;
           }
           return;
         }
        if (OnBeforeSave != null)
        {
          OnBeforeSave(this, new EventArgs());
        }
       try
       {
          RowItem.Num = Convert.ToInt32( txtNum.Text);
       }
       catch
       {
         TP_Zay_ZayLabelInfo.Text = "Enter numeric value to field Номер заявки  (example 100)";
         return;
       }
       try
       {
         if (DateDataPriem.Text != string.Empty)
         {
              RowItem.DataPriem = Convert.ToDateTime(DateDataPriem.Text);
         }
         else 
         {
              RowItem.DataPriem = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Дата приема (например 14.11.1973)", System.Drawing.Color.Red));
           }
           else
           {
              TP_Zay_ZayLabelInfo.Text = "Введите правильную дату в поле Дата приема (например 14.11.1973)";
           }
       }
   RowItem.FIO = txtFIO.Text;
      if (cmbTheOperator.SelectedValue.ToString() != string.Empty)
      {
        RowItem.TheOperator = RowItem.Application.FindRowObject("TP_Spr_Oper", new Guid(cmbTheOperator.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.TheOperator = null;
        }catch {}
      }
   RowItem.Adres = txtAdres.Text;
      if (cmbRayon.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Rayon = RowItem.Application.FindRowObject("Rayon", new Guid(cmbRayon.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Rayon = null;
        }catch {}
      }
      if (cmbMetro.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Metro = RowItem.Application.FindRowObject("TP_Spr_Metro", new Guid(cmbMetro.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Metro = null;
        }catch {}
      }
   RowItem.KonrLizo = txtKonrLizo.Text;
   RowItem.KontTelefon = txtKontTelefon.Text;
   RowItem.KontEMAIL = txtKontEMAIL.Text;
   RowItem.VremjaDljaSvjazi = txtVremjaDljaSvjazi.Text;
       try
       {
         if (DateGelData.Text != string.Empty)
         {
              RowItem.GelData = Convert.ToDateTime(DateGelData.Text);
         }
         else 
         {
              RowItem.GelData = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Желаемая дата визита инсталятора (например 14.11.1973)", System.Drawing.Color.Red));
           }
           else
           {
              TP_Zay_ZayLabelInfo.Text = "Введите правильную дату в поле Желаемая дата визита инсталятора (например 14.11.1973)";
           }
       }
      if (cmbGelVremja.SelectedValue.ToString() != string.Empty)
      {
        RowItem.GelVremja = RowItem.Application.FindRowObject("TP_Spr_VrVisInst", new Guid(cmbGelVremja.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.GelVremja = null;
        }catch {}
      }
      if (cmbPortref.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Portref = RowItem.Application.FindRowObject("TP_SPR_Port", new Guid(cmbPortref.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Portref = null;
        }catch {}
      }
      if (cmbKoordin.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Koordin = RowItem.Application.FindRowObject("TP_Spr_Koor", new Guid(cmbKoordin.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Koordin = null;
        }catch {}
      }
      if (cmbIngener.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Ingener = RowItem.Application.FindRowObject("TP_Spr_Ing", new Guid(cmbIngener.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Ingener = null;
        }catch {}
      }
   RowItem.VidanModemSer = txtVidanModemSer.Text;
      if (cmbTarif.SelectedValue.ToString() != string.Empty)
      {
        RowItem.Tarif = RowItem.Application.FindRowObject("TP_Spr_Tar", new Guid(cmbTarif.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.Tarif = null;
        }catch {}
      }
   RowItem.FIOdogovor = txtFIOdogovor.Text;
       try
       {
         if (DateDataInstall.Text != string.Empty)
         {
              RowItem.DataInstall = Convert.ToDateTime(DateDataInstall.Text);
         }
         else 
         {
              RowItem.DataInstall = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Дата инсталяции (например 14.11.1973)", System.Drawing.Color.Red));
           }
           else
           {
              TP_Zay_ZayLabelInfo.Text = "Введите правильную дату в поле Дата инсталяции (например 14.11.1973)";
           }
       }
      if (cmbSrochDogovor.SelectedValue.ToString() != string.Empty)
      {
        RowItem.SrochDogovor = RowItem.Application.FindRowObject("TP_Spr_SrochDog", new Guid(cmbSrochDogovor.SelectedValue.ToString()));
      }
      else
      {
        try {
        RowItem.SrochDogovor = null;
        }catch {}
      }
        try {
        RowItem.DocPolych = (TP_Zay.enumBoolean)Convert.ToInt32(cmbDocPolych.SelectedValue);
        }catch{}
       try
       {
         if (DateDataSZT.Text != string.Empty)
         {
              RowItem.DataSZT = Convert.ToDateTime(DateDataSZT.Text);
         }
         else 
         {
              RowItem.DataSZT = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Дата передачи в СЗТ (например 14.11.1973)", System.Drawing.Color.Red));
           }
           else
           {
              TP_Zay_ZayLabelInfo.Text = "Введите правильную дату в поле Дата передачи в СЗТ (например 14.11.1973)";
           }
       }
        try {
        RowItem.VklVReestr = (TP_Zay.enumBoolean)Convert.ToInt32(cmbVklVReestr.SelectedValue);
        }catch{}
        try {
        RowItem.Otkaz = (TP_Zay.enumBoolean)Convert.ToInt32(cmbOtkaz.SelectedValue);
        }catch{}
   RowItem.OpisProblem = txtOpisProblem.Text;
        try {
        RowItem.OtprVKEY = (TP_Zay.enumBoolean)Convert.ToInt32(cmbOtprVKEY.SelectedValue);
        }catch{}
       try
       {
         if (DateDataOtpravVKEY.Text != string.Empty)
         {
              RowItem.DataOtpravVKEY = Convert.ToDateTime(DateDataOtpravVKEY.Text);
         }
         else 
         {
              RowItem.DataOtpravVKEY = DateTime.MinValue;
         }
       }
       catch
       {
         if (OnInfo != null)
           {
              OnInfo(this, new InfoEventArgs("Введите правильную дату в поле Дата отправки в КЭУ (например 14.11.1973)", System.Drawing.Color.Red));
           }
           else
           {
              TP_Zay_ZayLabelInfo.Text = "Введите правильную дату в поле Дата отправки в КЭУ (например 14.11.1973)";
           }
       }
        try {
        RowItem.DopSogl = (TP_Zay.enumBoolean)Convert.ToInt32(cmbDopSogl.SelectedValue);
        }catch{}
   RowItem.NumDogovor = txtNumDogovor.Text;
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
          TP_Zay_ZayLabelInfo.ForeColor = System.Drawing.Color.Green;
          TP_Zay_ZayLabelInfo.Text = "Row saved";
        }
        if (OnAfterSave != null)
        {
          OnAfterSave(this, new EventArgs());
        }
      }
      catch(Exception Ex)
      {
        TP_Zay_ZayLabelInfo.Text = "Save error. " + Ex.Message;
        TP_Zay_ZayLabelInfo.ForeColor = System.Drawing.Color.Red;
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



