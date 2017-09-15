VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctlmain_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Tag             =   "Card.ICO"
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
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
   Begin ENTDIC2GUI.vpnENTDIC_EDIZM_main pnlENTDIC_EDIZM 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_BANK_main pnlENTDIC_BANK 
      Height          =   1500
      Left            =   3000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_CURRENCY_main pnlENTDIC_CURRENCY 
      Height          =   1500
      Left            =   4500
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_DOST_main pnlENTDIC_DOST 
      Height          =   1500
      Left            =   6000
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_REGION_main pnlENTDIC_REGION 
      Height          =   1500
      Left            =   0
      TabIndex        =   5
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_TOWN_main pnlENTDIC_TOWN 
      Height          =   1500
      Left            =   1500
      TabIndex        =   6
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_COUNTRY_main pnlENTDIC_COUNTRY 
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_TransportType_main pnlENTDIC_TransportType 
      Height          =   1500
      Left            =   4500
      TabIndex        =   8
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin ENTDIC2GUI.vpnENTDIC_OPF_main pnlENTDIC_OPF 
      Height          =   1500
      Left            =   6000
      TabIndex        =   9
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin VB.Menu mnuCtl 
      Caption         =   "mnuCtl"
      Visible         =   0   'False
      Begin VB.Menu mnuSetup 
         Caption         =   "Настройка"
      End
   End
End
Attribute VB_Name = "ctlmain_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Public ParentForm As Object
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer





Public Property Get PrefferedWidth() As Long
    PrefferedWidth = 0
End Property

Public Property Get PrefferedHeight() As Long
    PrefferedHeight = 0
End Property

Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Public Function IsOK() As Boolean
Dim IsItOk As Boolean
IsItOk = True
On Error Resume Next
If IsItOk Then IsItOk = pnlENTDIC_EDIZM.IsOK
If IsItOk Then IsItOk = pnlENTDIC_BANK.IsOK
If IsItOk Then IsItOk = pnlENTDIC_CURRENCY.IsOK
If IsItOk Then IsItOk = pnlENTDIC_DOST.IsOK
If IsItOk Then IsItOk = pnlENTDIC_REGION.IsOK
If IsItOk Then IsItOk = pnlENTDIC_TOWN.IsOK
If IsItOk Then IsItOk = pnlENTDIC_COUNTRY.IsOK
If IsItOk Then IsItOk = pnlENTDIC_TransportType.IsOK
If IsItOk Then IsItOk = pnlENTDIC_OPF.IsOK
IsOK = IsItOk
End Function
Private Sub ts_click()
  On Error Resume Next
  pnlENTDIC_OPF.Visible = False
  pnlENTDIC_TransportType.Visible = False
  pnlENTDIC_COUNTRY.Visible = False
  pnlENTDIC_TOWN.Visible = False
  pnlENTDIC_REGION.Visible = False
  pnlENTDIC_DOST.Visible = False
  pnlENTDIC_CURRENCY.Visible = False
  pnlENTDIC_BANK.Visible = False
  pnlENTDIC_EDIZM.Visible = False

   Select Case ts.SelectedItem.Key
   Case "ENTDIC_EDIZM"
     With pnlENTDIC_EDIZM
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_EDIZM.OnClick Item, ParentForm
     End With
   Case "ENTDIC_BANK"
     With pnlENTDIC_BANK
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_BANK.OnClick Item, ParentForm
     End With
   Case "ENTDIC_CURRENCY"
     With pnlENTDIC_CURRENCY
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_CURRENCY.OnClick Item, ParentForm
     End With
   Case "ENTDIC_DOST"
     With pnlENTDIC_DOST
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_DOST.OnClick Item, ParentForm
     End With
   Case "ENTDIC_REGION"
     With pnlENTDIC_REGION
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_REGION.OnClick Item, ParentForm
     End With
   Case "ENTDIC_TOWN"
     With pnlENTDIC_TOWN
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_TOWN.OnClick Item, ParentForm
     End With
   Case "ENTDIC_COUNTRY"
     With pnlENTDIC_COUNTRY
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_COUNTRY.OnClick Item, ParentForm
     End With
   Case "ENTDIC_TransportType"
     With pnlENTDIC_TransportType
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_TransportType.OnClick Item, ParentForm
     End With
   Case "ENTDIC_OPF"
     With pnlENTDIC_OPF
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlENTDIC_OPF.OnClick Item, ParentForm
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean, aParentForm As Object)
  On Error Resume Next
 Set Item = ObjItem
 Set Host = MyHost
 Set ParentForm = aParentForm
 ModalMode = aModalMode
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Единицы измерения"
ts.Tabs.Item(1).Key = "ENTDIC_EDIZM"
pnlENTDIC_EDIZM.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_BANK", "Банки")
pnlENTDIC_BANK.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_CURRENCY", "Валюта")
pnlENTDIC_CURRENCY.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_DOST", "Тип доставки")
pnlENTDIC_DOST.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_REGION", "Название областей")
pnlENTDIC_REGION.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_TOWN", "Города")
pnlENTDIC_TOWN.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_COUNTRY", "Страны")
pnlENTDIC_COUNTRY.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_TransportType", "Тип транспорта")
pnlENTDIC_TransportType.OnInit Item, ParentForm
Call ts.Tabs.Add(, "ENTDIC_OPF", "Организационно-правовая форма")
pnlENTDIC_OPF.OnInit Item, ParentForm
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "ENTDIC2", "ctlmain_main"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set Item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
  Set TSCustom = Nothing
 pnlENTDIC_EDIZM.CloseClass
 pnlENTDIC_BANK.CloseClass
 pnlENTDIC_CURRENCY.CloseClass
 pnlENTDIC_DOST.CloseClass
 pnlENTDIC_REGION.CloseClass
 pnlENTDIC_TOWN.CloseClass
 pnlENTDIC_COUNTRY.CloseClass
 pnlENTDIC_TransportType.CloseClass
 pnlENTDIC_OPF.CloseClass
End Sub
Public Sub OnSave()
 pnlENTDIC_EDIZM.OnSave
 pnlENTDIC_BANK.OnSave
 pnlENTDIC_CURRENCY.OnSave
 pnlENTDIC_DOST.OnSave
 pnlENTDIC_REGION.OnSave
 pnlENTDIC_TOWN.OnSave
 pnlENTDIC_COUNTRY.OnSave
 pnlENTDIC_TransportType.OnSave
 pnlENTDIC_OPF.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlENTDIC_EDIZM.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_BANK.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_CURRENCY.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_DOST.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_REGION.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_TOWN.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_COUNTRY.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_TransportType.IsChanged
m_IsChanged = m_IsChanged Or pnlENTDIC_OPF.IsChanged
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
 On Error Resume Next
ts.Top = 0
ts.Left = 0
ts.Width = UserControl.Width
ts.Height = UserControl.Height
ts_click
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
On Error Resume Next

'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
On Error Resume Next

'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
On Error Resume Next

'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.Item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", Item.Application.MTZSession.GetSessionUserID())
 Obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set Obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set Obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set Obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set Obj.Person = RowItem.Application
 End If
 
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKP_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKP_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKP_DEF.Item(1)
 End If
 
 Set Obj.FromClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKO_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKO_DEF.Item(1)
 End If
 
 Set Obj.ToClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleid, Obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", Obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub


Public Function StatusMenuCount() As Integer
  StatusMenuCount = 0
End Function
Public Function SetupStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    i = 0
End Function
Public Sub CheckStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    For i = 1 To StatusMenuCount
        m(i).Checked = False
        m(i).Enabled = False
        If Not Item Is Nothing Then
          If m(i).Tag = Item.Statusid Then
            m(i).Checked = True
          End If
        End If
    Next
    If Not Item Is Nothing Then
   End If
End Sub



