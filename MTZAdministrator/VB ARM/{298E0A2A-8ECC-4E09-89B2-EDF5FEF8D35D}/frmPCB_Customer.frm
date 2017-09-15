VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmPCB_Customer 
   Caption         =   "Фильтр для Заказчик"
   ClientHeight    =   3480
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3480
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Tag             =   "Card.ICO"
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Отмена"
      Height          =   330
      Left            =   0
      TabIndex        =   1
      ToolTipText     =   "Отказ от задания фильтра"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   330
      Left            =   0
      TabIndex        =   0
      ToolTipText     =   "Применить фильтр"
      Top             =   0
      UseMaskColor    =   -1  'True
      Width           =   750
   End
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin MTZ_PANEL.ScrolledWindow PanelfGroup 
      Height          =   1000
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin VB.TextBox txtURAddress 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   57
         ToolTipText     =   "Юридический адрес"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.CheckBox lblURAddress 
         Caption         =   "Юридический адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   56
         Top             =   4305
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustCatRef 
         Height          =   300
         Left            =   9150
         TabIndex        =   55
         Tag             =   "refopen.ico"
         ToolTipText     =   "Категория"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustCatRef 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   54
         ToolTipText     =   "Категория"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.CheckBox lblCustCatRef 
         Caption         =   "Категория:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   3600
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdOwnerRef 
         Height          =   300
         Left            =   9150
         TabIndex        =   52
         Tag             =   "refopen.ico"
         ToolTipText     =   "Форма собственности"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtOwnerRef 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   51
         ToolTipText     =   "Форма собственности"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.CheckBox lblOwnerRef 
         Caption         =   "Форма собственности:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   2895
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheCityRef 
         Height          =   300
         Left            =   9150
         TabIndex        =   49
         Tag             =   "refopen.ico"
         ToolTipText     =   "Город"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCityRef 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   48
         ToolTipText     =   "Город"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.CheckBox lblTheCityRef 
         Caption         =   "Город:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheSource 
         Height          =   300
         Left            =   6600
         MaxLength       =   255
         TabIndex        =   46
         ToolTipText     =   "Источник"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblTheSource 
         Caption         =   "Источник:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   1485
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCustomerSite 
         Height          =   300
         Left            =   9150
         TabIndex        =   44
         Tag             =   "urlopen.ico"
         ToolTipText     =   "Сайт"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCustomerSite 
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         ToolTipText     =   "Сайт"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.CheckBox lblCustomerSite 
         Caption         =   "Сайт:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   780
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdeMail 
         Height          =   300
         Left            =   9150
         TabIndex        =   41
         Tag             =   "mailopen.ico"
         ToolTipText     =   "E-Mail"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txteMail 
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         ToolTipText     =   "E-Mail"
         Top             =   405
         Width           =   2550
      End
      Begin VB.CheckBox lbleMail 
         Caption         =   "E-Mail:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   6600
         TabIndex        =   39
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtCustomerCode 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   38
         ToolTipText     =   "Код клиента"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.CheckBox lblCustomerCode 
         Caption         =   "Код клиента:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   5910
         Width           =   3000
      End
      Begin VB.ComboBox cmbCustomerStatus 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   36
         ToolTipText     =   "Статус"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.CheckBox lblCustomerStatus 
         Caption         =   "Статус:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   5205
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdContactOrg 
         Height          =   300
         Left            =   6000
         TabIndex        =   34
         Tag             =   "refopen.ico"
         ToolTipText     =   "Контактное лицо по орг."
         Top             =   4830
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtContactOrg 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   33
         ToolTipText     =   "Контактное лицо по орг."
         Top             =   4830
         Width           =   2550
      End
      Begin VB.CheckBox lblContactOrg 
         Caption         =   "Контактное лицо по орг.:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   4500
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdContactTech 
         Height          =   300
         Left            =   6000
         TabIndex        =   31
         Tag             =   "refopen.ico"
         ToolTipText     =   "Контактное лицо по тех."
         Top             =   4125
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtContactTech 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   30
         ToolTipText     =   "Контактное лицо по тех."
         Top             =   4125
         Width           =   2550
      End
      Begin VB.CheckBox lblContactTech 
         Caption         =   "Контактное лицо по тех.:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   29
         Top             =   3795
         Width           =   3000
      End
      Begin VB.TextBox txtPassportInfo 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   28
         ToolTipText     =   "Паспортные данные"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblPassportInfo 
         Caption         =   "Паспортные данные:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   2190
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdCurator 
         Height          =   300
         Left            =   6000
         TabIndex        =   26
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ответственный"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtCurator 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   25
         ToolTipText     =   "Ответственный"
         Top             =   1815
         Width           =   2550
      End
      Begin VB.CheckBox lblCurator 
         Caption         =   "Ответственный:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtKPP 
         Height          =   300
         Left            =   3450
         MaxLength       =   9
         TabIndex        =   23
         ToolTipText     =   "КПП"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblKPP 
         Caption         =   "КПП:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   780
         Width           =   3000
      End
      Begin VB.TextBox txtINN 
         Height          =   300
         Left            =   3450
         MaxLength       =   12
         TabIndex        =   21
         ToolTipText     =   "ИНН"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblINN 
         Caption         =   "ИНН:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   3450
         TabIndex        =   20
         Top             =   75
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   19
         ToolTipText     =   "Примечание"
         Top             =   6240
         Width           =   3000
      End
      Begin VB.CheckBox lblthe_Comment 
         Caption         =   "Примечание:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5910
         Width           =   3000
      End
      Begin VB.TextBox txtPhone 
         Height          =   300
         Left            =   300
         MaxLength       =   25
         TabIndex        =   17
         ToolTipText     =   "Телефон"
         Top             =   5535
         Width           =   3000
      End
      Begin VB.CheckBox lblPhone 
         Caption         =   "Телефон:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5205
         Width           =   3000
      End
      Begin VB.TextBox txtfax 
         Height          =   300
         Left            =   300
         MaxLength       =   20
         TabIndex        =   15
         ToolTipText     =   "Факс"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.CheckBox lblfax 
         Caption         =   "Факс:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4500
         Width           =   3000
      End
      Begin VB.TextBox txtAddress 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   13
         ToolTipText     =   "Почтовый адрес"
         Top             =   4125
         Width           =   3000
      End
      Begin VB.CheckBox lblAddress 
         Caption         =   "Почтовый адрес:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3795
         Width           =   3000
      End
      Begin VB.TextBox txtfullname 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         ToolTipText     =   "Полное наименование"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.CheckBox lblfullname 
         Caption         =   "Полное наименование:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2190
         Width           =   3000
      End
      Begin VB.TextBox txtTheName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   9
         ToolTipText     =   "Название"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.CheckBox lblTheName 
         Caption         =   "Название:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   1485
         Width           =   3000
      End
      Begin VB.TextBox txtcode 
         Height          =   300
         Left            =   300
         MaxLength       =   30
         TabIndex        =   7
         ToolTipText     =   "Номер клиента"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.CheckBox lblcode 
         Caption         =   "Номер клиента:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   780
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsPhizical 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "Физическое лицо"
         Top             =   405
         Width           =   3000
      End
      Begin VB.CheckBox lblIsPhizical 
         Caption         =   "Физическое лицо:"
         ForeColor       =   &H00000000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   75
         Width           =   3000
      End
   End
   Begin VB.Menu mnuCtl 
      Caption         =   "mnuCtl"
      Visible         =   0   'False
      Begin VB.Menu mnuSetup 
         Caption         =   "Настройка"
      End
   End
End
Attribute VB_Name = "frmPCB_Customer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Public Item As Object
Public OK As Boolean
Private OnInit As Boolean
Public Event Changed()
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer







Private Sub cmdOK_Click()
    On Error Resume Next
    OK = True
    Me.Hide
End Sub
Private Sub cmdCancel_Click()
    On Error Resume Next
    OK = False
    Me.Hide
End Sub
Public Sub Init(ObjItem As Object)
 Set Item = ObjItem
 If Item Is Nothing Then Set Item = MyUser.Application
 TInit
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Dim ff As Long, buf As String
  LoadFromSkin Me
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdOK.Height
  cmdOK.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdOK.Width, cmdOK.Height
  cmdCancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdCancel.Width, cmdOK.Height
  If Item Is Nothing Then Init MyUser.Application
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  Set Item = Nothing
  Set TSCustom = Nothing
  SaveToSkin Me
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
  Cancel = -1
End Sub
Private Sub Form_Resize()
 If Me.WindowState = 1 Then Exit Sub
 On Error Resume Next
  ts.Move 0, 0, Me.ScaleWidth, Me.ScaleHeight - cmdOK.Height
  cmdOK.Move Me.ScaleWidth - 110 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdOK.Width, cmdOK.Height
  cmdCancel.Move Me.ScaleWidth - 55 * Screen.TwipsPerPixelX, Me.ScaleHeight - cmdOK.Height, cmdCancel.Width, cmdOK.Height
  ts_click
End Sub
Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Private Sub ts_click()
  On Error Resume Next
  PanelfGroup.Visible = False

   Select Case ts.SelectedItem.Key
   Case "fGroup"
     With PanelfGroup
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     End With
     End Select
End Sub
Private Sub TInit()
  On Error Resume Next
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Общая информация"
ts.Tabs.Item(1).Key = "fGroup"
PanelfGroupInit
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PCB_Customer", "fctlPCB_Customer"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub


Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Private Sub cmbIsPhizical_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtcode_Change()
  Changing
End Sub
Private Sub txtTheName_Change()
  Changing
End Sub
Private Sub txtfullname_Change()
  Changing
End Sub
Private Sub txtAddress_Change()
  Changing
End Sub
Private Sub txtfax_Change()
  Changing
End Sub
Private Sub txtPhone_Change()
  Changing
End Sub
Private Sub txtthe_Comment_Change()
  Changing
End Sub
Private Sub txtINN_Change()
  Changing
End Sub
Private Sub txtKPP_Change()
  Changing
End Sub
Private Sub txtCurator_Change()
  Changing
End Sub
Private Sub cmdCurator_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Users", id, brief) Then
          txtCurator.Tag = Left(id, 38)
          txtCurator = brief
        End If
End Sub
Private Sub txtPassportInfo_Change()
  Changing
End Sub
Private Sub txtContactTech_Change()
  Changing
End Sub
Private Sub cmdContactTech_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_Cust_Person", id, brief) Then
          txtContactTech.Tag = Left(id, 38)
          txtContactTech = brief
        End If
End Sub
Private Sub txtContactOrg_Change()
  Changing
End Sub
Private Sub cmdContactOrg_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_Cust_Person", id, brief) Then
          txtContactOrg.Tag = Left(id, 38)
          txtContactOrg = brief
        End If
End Sub
Private Sub cmbCustomerStatus_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtCustomerCode_Change()
  Changing
End Sub
Private Sub txteMail_Change()
  Changing
End Sub
Private Sub cmdeMail_CLick()
  On Error Resume Next
  Dim s As String
  s = s & "mailto:" & txteMail.Text
  OpenDocument 0, s
End Sub
Private Sub txtCustomerSite_Change()
  Changing
End Sub
Private Sub cmdCustomerSite_CLick()
  On Error Resume Next
  Dim s As String
  s = s & "http:\\" & txtCustomerSite.Text
  OpenDocument 0, s
End Sub
Private Sub txtTheSource_Change()
  Changing
End Sub
Private Sub txtTheCityRef_Change()
  Changing
End Sub
Private Sub cmdTheCityRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_City", id, brief) Then
          txtTheCityRef.Tag = Left(id, 38)
          txtTheCityRef = brief
        End If
End Sub
Private Sub txtOwnerRef_Change()
  Changing
End Sub
Private Sub cmdOwnerRef_Click()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PCB_D_Owner", id, brief) Then
          txtOwnerRef.Tag = Left(id, 38)
          txtOwnerRef = brief
        End If
End Sub
Private Sub txtCustCatRef_Change()
  Changing
End Sub
Private Sub cmdCustCatRef_CLick()
  On Error Resume Next
       cmdCustCatRef_MenuClick "Выбрать"
End Sub
Private Sub cmdCustCatRef_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtCustCatRef.Tag = ""
          txtCustCatRef = ""
  End If
  If sCaption = "Открыть" Then
    If txtCustCatRef.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtCustCatRef.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtCustCatRef.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialog2(id, brief, "", "")
        If OK Then
          txtCustCatRef.Tag = Left(id, 38)
          txtCustCatRef = brief
        End If
  End If
End Sub
Private Sub txtURAddress_Change()
  Changing
End Sub
Private Sub PanelfGroupInit()
OnInit = True
Dim iii As Long ' for combo only

cmbIsPhizical.Clear
cmbIsPhizical.AddItem "Да"
cmbIsPhizical.ItemData(cmbIsPhizical.NewIndex) = -1
cmbIsPhizical.AddItem "Нет"
cmbIsPhizical.ItemData(cmbIsPhizical.NewIndex) = 0
txtcode = ""
txtTheName = ""
txtAddress = ""
txtfax = ""
txtPhone = ""
txtINN = ""
txtKPP = ""
  txtCurator.Tag = ""
  txtCurator = ""
 LoadBtnPictures cmdCurator, cmdCurator.Tag
  cmdCurator.RemoveAllMenu
  txtContactTech.Tag = ""
  txtContactTech = ""
 LoadBtnPictures cmdContactTech, cmdContactTech.Tag
  cmdContactTech.RemoveAllMenu
  txtContactOrg.Tag = ""
  txtContactOrg = ""
 LoadBtnPictures cmdContactOrg, cmdContactOrg.Tag
  cmdContactOrg.RemoveAllMenu
cmbCustomerStatus.Clear
cmbCustomerStatus.AddItem "Реальный"
cmbCustomerStatus.ItemData(cmbCustomerStatus.NewIndex) = 1
cmbCustomerStatus.AddItem "Потенциальный"
cmbCustomerStatus.ItemData(cmbCustomerStatus.NewIndex) = 0
txtCustomerCode = ""
 LoadBtnPictures cmdeMail, cmdeMail.Tag
  cmdeMail.RemoveAllMenu
 LoadBtnPictures cmdCustomerSite, cmdCustomerSite.Tag
  cmdCustomerSite.RemoveAllMenu
txtTheSource = ""
  txtTheCityRef.Tag = ""
  txtTheCityRef = ""
 LoadBtnPictures cmdTheCityRef, cmdTheCityRef.Tag
  cmdTheCityRef.RemoveAllMenu
  txtOwnerRef.Tag = ""
  txtOwnerRef = ""
 LoadBtnPictures cmdOwnerRef, cmdOwnerRef.Tag
  cmdOwnerRef.RemoveAllMenu
  txtCustCatRef.Tag = ""
  txtCustCatRef = ""
 LoadBtnPictures cmdCustCatRef, cmdCustCatRef.Tag
  cmdCustCatRef.RemoveAllMenu
  cmdCustCatRef.AddMenu "Выбрать"
txtURAddress = ""
OnInit = False
End Sub



