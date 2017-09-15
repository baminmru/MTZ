VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctlprnt_main 
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
   Begin PEK2ZGUI.vpnpekz_def_prnt pnlpekz_def 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2ZGUI.vpnpekz_path_prnt pnlpekz_path 
      Height          =   1500
      Left            =   3000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2ZGUI.vpnpekz_dop_prnt pnlpekz_dop 
      Height          =   1500
      Left            =   4500
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2ZGUI.vpnPEKZ_ACLCT_prnt pnlPEKZ_ACLCT 
      Height          =   1500
      Left            =   6000
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2ZGUI.vpnPEKZ_ADLVR_prnt pnlPEKZ_ADLVR 
      Height          =   1500
      Left            =   0
      TabIndex        =   5
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
Attribute VB_Name = "ctlprnt_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
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
If IsItOk Then IsItOk = pnlpekz_def.IsOK
If IsItOk Then IsItOk = pnlpekz_path.IsOK
If IsItOk Then IsItOk = pnlpekz_dop.IsOK
If IsItOk Then IsItOk = pnlPEKZ_ACLCT.IsOK
If IsItOk Then IsItOk = pnlPEKZ_ADLVR.IsOK
IsOK = IsItOk
End Function
Private Sub ts_click()
  On Error Resume Next
  pnlPEKZ_ADLVR.Visible = False
  pnlPEKZ_ACLCT.Visible = False
  pnlpekz_dop.Visible = False
  pnlpekz_path.Visible = False
  pnlpekz_def.Visible = False

   Select Case ts.SelectedItem.Key
   Case "pekz_def"
     With pnlpekz_def
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlpekz_def.OnClick item, ParentForm
     End With
   Case "pekz_path"
     With pnlpekz_path
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlpekz_path.OnClick item, ParentForm
     End With
   Case "pekz_dop"
     With pnlpekz_dop
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlpekz_dop.OnClick item, ParentForm
     End With
   Case "PEKZ_ACLCT"
     With pnlPEKZ_ACLCT
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKZ_ACLCT.OnClick item, ParentForm
     End With
   Case "PEKZ_ADLVR"
     With pnlPEKZ_ADLVR
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKZ_ADLVR.OnClick item, ParentForm
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean, aParentForm As Object)
  On Error Resume Next
 Set item = ObjItem
 Set Host = MyHost
 Set ParentForm = aParentForm
 ModalMode = aModalMode
  Dim ff As Long, buf As String

ts.Tabs.item(1).Caption = "Описание заявки"
ts.Tabs.item(1).Key = "pekz_def"
pnlpekz_def.OnInit item, ParentForm
Call ts.Tabs.Add(, "pekz_path", "Маршрут доставки")
pnlpekz_path.OnInit item, ParentForm
Call ts.Tabs.Add(, "pekz_dop", "Дополнительные услуги")
pnlpekz_dop.OnInit item, ParentForm
Call ts.Tabs.Add(, "PEKZ_ACLCT", "Сбор груза")
pnlPEKZ_ACLCT.OnInit item, ParentForm
Call ts.Tabs.Add(, "PEKZ_ADLVR", "Авто доставка")
pnlPEKZ_ADLVR.OnInit item, ParentForm
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PEK2Z", "ctlprnt_main"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
  Set TSCustom = Nothing
 pnlpekz_def.CloseClass
 pnlpekz_path.CloseClass
 pnlpekz_dop.CloseClass
 pnlPEKZ_ACLCT.CloseClass
 pnlPEKZ_ADLVR.CloseClass
End Sub
Public Sub OnSave()
 pnlpekz_def.OnSave
 pnlpekz_path.OnSave
 pnlpekz_dop.OnSave
 pnlPEKZ_ACLCT.OnSave
 pnlPEKZ_ADLVR.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlpekz_def.IsChanged
m_IsChanged = m_IsChanged Or pnlpekz_path.IsChanged
m_IsChanged = m_IsChanged Or pnlpekz_dop.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKZ_ACLCT.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKZ_ADLVR.IsChanged
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

  RowItem.Person.Secure item.SecureStyleID
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
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
  MsgBox err.Description, vbOKOnly + vbCritical, "Установка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
'  ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT2", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", item.Application.MTZSession.GetSessionUserID())
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKP_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKP_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKP_DEF.item(1)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKO_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKO_DEF.item(1)
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
    Set Obj = item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleID, Obj.TypeName & ":" & "M" & i) Then
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
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = item.Name
item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.pekz_def.Add
 Else
  Set Obj = RowItem.TheDocument.pekz_def.item(1)
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
  StatusMenuCount = 13
End Function
Public Function SetupStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    i = 0
    i = i + 1
    m(i).Caption = "Частично взвешена"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{B09E64F9-13CA-4FFB-994A-02A5D239B22E}"
    i = i + 1
    m(i).Caption = "Принято на склад"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}"
    i = i + 1
    m(i).Caption = "Документы напечатаны"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{AC071E63-C112-4581-88B6-3116EED165C2}"
    i = i + 1
    m(i).Caption = "На взвешивании"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{D1E1D481-8515-41F5-A468-32542513431F}"
    i = i + 1
    m(i).Caption = "Согласована"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{F4C3A104-B225-450F-84C9-4226F9E4F57B}"
    i = i + 1
    m(i).Caption = "Отвергнута"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}"
    i = i + 1
    m(i).Caption = "Оформлена"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{2A121E0F-A8AA-4060-9093-7F3F8135D242}"
    i = i + 1
    m(i).Caption = "Утеряна"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{78A69448-43EF-436B-82ED-9ABC3CBB56E3}"
    i = i + 1
    m(i).Caption = "Оформляется"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{C30B597E-E523-4532-887A-9B9DD57EF06C}"
    i = i + 1
    m(i).Caption = "В пути"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{A324A45F-2617-48C5-BC65-A334013A0401}"
    i = i + 1
    m(i).Caption = "Возврат"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{32AE371F-8388-405C-8ACF-B372EE3EACEF}"
    i = i + 1
    m(i).Caption = "Получатель оповещен"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{8CAD6987-A200-484B-A1A7-C22B7877A2E1}"
    i = i + 1
    m(i).Caption = "Доставлена"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{E2A83D8A-BFB7-47D3-9C1D-DF2812BF9383}"
End Function
Public Sub CheckStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    For i = 1 To StatusMenuCount
        m(i).Checked = False
        m(i).Enabled = False
        If Not item Is Nothing Then
          If m(i).Tag = item.Statusid Then
            m(i).Checked = True
          End If
        End If
    Next
    If Not item Is Nothing Then
      If item.Statusid = "{B09E64F9-13CA-4FFB-994A-02A5D239B22E}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.Statusid = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{A324A45F-2617-48C5-BC65-A334013A0401}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{A324A45F-2617-48C5-BC65-A334013A0401}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{AC071E63-C112-4581-88B6-3116EED165C2}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{A324A45F-2617-48C5-BC65-A334013A0401}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{D1E1D481-8515-41F5-A468-32542513431F}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.Statusid = "{F4C3A104-B225-450F-84C9-4226F9E4F57B}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.Statusid = "{2A121E0F-A8AA-4060-9093-7F3F8135D242}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{F4C3A104-B225-450F-84C9-4226F9E4F57B}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{F4C3A104-B225-450F-84C9-4226F9E4F57B}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{F4C3A104-B225-450F-84C9-4226F9E4F57B}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{78A69448-43EF-436B-82ED-9ABC3CBB56E3}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.Statusid = "{C30B597E-E523-4532-887A-9B9DD57EF06C}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{2A121E0F-A8AA-4060-9093-7F3F8135D242}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{2A121E0F-A8AA-4060-9093-7F3F8135D242}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{A8B3EF3B-6547-4BEC-A687-750FFC7C4E99}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{C450C343-4D0E-4010-AEF1-18C4627E6D80}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{2A121E0F-A8AA-4060-9093-7F3F8135D242}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{A324A45F-2617-48C5-BC65-A334013A0401}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{78A69448-43EF-436B-82ED-9ABC3CBB56E3}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{E2A83D8A-BFB7-47D3-9C1D-DF2812BF9383}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{78A69448-43EF-436B-82ED-9ABC3CBB56E3}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{8CAD6987-A200-484B-A1A7-C22B7877A2E1}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{E2A83D8A-BFB7-47D3-9C1D-DF2812BF9383}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{32AE371F-8388-405C-8ACF-B372EE3EACEF}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.Statusid = "{8CAD6987-A200-484B-A1A7-C22B7877A2E1}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{E2A83D8A-BFB7-47D3-9C1D-DF2812BF9383}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{78A69448-43EF-436B-82ED-9ABC3CBB56E3}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If item.Statusid = "{E2A83D8A-BFB7-47D3-9C1D-DF2812BF9383}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
   End If
End Sub



