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
   Begin PEK2TRFGUI.vpnPEKTRF_DEF_main pnlPEKTRF_DEF 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2TRFGUI.vpnPEKTRF_SRV_main pnlPEKTRF_SRV 
      Height          =   1500
      Left            =   3000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2TRFGUI.vpnPEKTRF_TR_main pnlPEKTRF_TR 
      Height          =   1500
      Left            =   4500
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2TRFGUI.vpnPEKTRF_ADDS_main pnlPEKTRF_ADDS 
      Height          =   1500
      Left            =   6000
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2TRFGUI.vpnPEKTRF_DECR_main pnlPEKTRF_DECR 
      Height          =   1500
      Left            =   0
      TabIndex        =   5
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2TRFGUI.vpnPEKTRF_REGALL_main pnlPEKTRF_REGALL 
      Height          =   1500
      Left            =   1500
      TabIndex        =   6
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin PEK2TRFGUI.vpnPEKTRF_AUTO_main pnlPEKTRF_AUTO 
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
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
If IsItOk Then IsItOk = pnlPEKTRF_DEF.IsOK
If IsItOk Then IsItOk = pnlPEKTRF_SRV.IsOK
If IsItOk Then IsItOk = pnlPEKTRF_TR.IsOK
If IsItOk Then IsItOk = pnlPEKTRF_ADDS.IsOK
If IsItOk Then IsItOk = pnlPEKTRF_DECR.IsOK
If IsItOk Then IsItOk = pnlPEKTRF_REGALL.IsOK
If IsItOk Then IsItOk = pnlPEKTRF_AUTO.IsOK
IsOK = IsItOk
End Function
Private Sub ts_click()
  On Error Resume Next
  pnlPEKTRF_AUTO.Visible = False
  pnlPEKTRF_REGALL.Visible = False
  pnlPEKTRF_DECR.Visible = False
  pnlPEKTRF_ADDS.Visible = False
  pnlPEKTRF_TR.Visible = False
  pnlPEKTRF_SRV.Visible = False
  pnlPEKTRF_DEF.Visible = False

   Select Case ts.SelectedItem.Key
   Case "PEKTRF_DEF"
     With pnlPEKTRF_DEF
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_DEF.OnClick Item, ParentForm
     End With
   Case "PEKTRF_SRV"
     With pnlPEKTRF_SRV
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_SRV.OnClick Item, ParentForm
     End With
   Case "PEKTRF_TR"
     With pnlPEKTRF_TR
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_TR.OnClick Item, ParentForm
     End With
   Case "PEKTRF_ADDS"
     With pnlPEKTRF_ADDS
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_ADDS.OnClick Item, ParentForm
     End With
   Case "PEKTRF_DECR"
     With pnlPEKTRF_DECR
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_DECR.OnClick Item, ParentForm
     End With
   Case "PEKTRF_REGALL"
     With pnlPEKTRF_REGALL
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_REGALL.OnClick Item, ParentForm
     End With
   Case "PEKTRF_AUTO"
     With pnlPEKTRF_AUTO
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlPEKTRF_AUTO.OnClick Item, ParentForm
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

ts.Tabs.Item(1).Caption = "Общее описание"
ts.Tabs.Item(1).Key = "PEKTRF_DEF"
pnlPEKTRF_DEF.OnInit Item, ParentForm
Call ts.Tabs.Add(, "PEKTRF_SRV", "Тарифы на услуги")
pnlPEKTRF_SRV.OnInit Item, ParentForm
Call ts.Tabs.Add(, "PEKTRF_TR", "Транспортировка")
pnlPEKTRF_TR.OnInit Item, ParentForm
Call ts.Tabs.Add(, "PEKTRF_ADDS", "Надбавки")
pnlPEKTRF_ADDS.OnInit Item, ParentForm
Call ts.Tabs.Add(, "PEKTRF_DECR", "Скидки")
pnlPEKTRF_DECR.OnInit Item, ParentForm
Call ts.Tabs.Add(, "PEKTRF_REGALL", "Регресс по общему весу")
pnlPEKTRF_REGALL.OnInit Item, ParentForm
Call ts.Tabs.Add(, "PEKTRF_AUTO", "Автодоставка")
pnlPEKTRF_AUTO.OnInit Item, ParentForm
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "PEK2TRF", "ctlmain_main"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set Item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
  Set TSCustom = Nothing
 pnlPEKTRF_DEF.CloseClass
 pnlPEKTRF_SRV.CloseClass
 pnlPEKTRF_TR.CloseClass
 pnlPEKTRF_ADDS.CloseClass
 pnlPEKTRF_DECR.CloseClass
 pnlPEKTRF_REGALL.CloseClass
 pnlPEKTRF_AUTO.CloseClass
End Sub
Public Sub OnSave()
 pnlPEKTRF_DEF.OnSave
 pnlPEKTRF_SRV.OnSave
 pnlPEKTRF_TR.OnSave
 pnlPEKTRF_ADDS.OnSave
 pnlPEKTRF_DECR.OnSave
 pnlPEKTRF_REGALL.OnSave
 pnlPEKTRF_AUTO.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlPEKTRF_DEF.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKTRF_SRV.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKTRF_TR.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKTRF_ADDS.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKTRF_DECR.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKTRF_REGALL.IsChanged
m_IsChanged = m_IsChanged Or pnlPEKTRF_AUTO.IsChanged
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2P", "Платеж " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2O", "Оплата " & Date)
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
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
  StatusMenuCount = 4
End Function
Public Function SetupStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    i = 0
    i = i + 1
    m(i).Caption = "Отменен"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{0DB75CA2-422E-4D9E-B384-348537B6E402}"
    i = i + 1
    m(i).Caption = "Введен в действие"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{53809047-E34B-4BC8-8497-710E4A51535E}"
    i = i + 1
    m(i).Caption = "Утвержден"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{0006EF82-3613-4C46-82BD-9878AAF6C9FF}"
    i = i + 1
    m(i).Caption = "Оформляется"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{A82A2432-3604-46A4-ABA9-E65AB3670363}"
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
      If Item.Statusid = "{0DB75CA2-422E-4D9E-B384-348537B6E402}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If Item.Statusid = "{53809047-E34B-4BC8-8497-710E4A51535E}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{0DB75CA2-422E-4D9E-B384-348537B6E402}" Then
            m(i).Enabled = True
          End If
        Next
      End If
      If Item.Statusid = "{0006EF82-3613-4C46-82BD-9878AAF6C9FF}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If Item.Statusid = "{A82A2432-3604-46A4-ABA9-E65AB3670363}" Then
        For i = 1 To StatusMenuCount
          If m(i).Tag = "{0DB75CA2-422E-4D9E-B384-348537B6E402}" Then
            m(i).Enabled = True
          End If
          If m(i).Tag = "{0006EF82-3613-4C46-82BD-9878AAF6C9FF}" Then
            m(i).Enabled = True
          End If
        Next
      End If
   End If
End Sub



