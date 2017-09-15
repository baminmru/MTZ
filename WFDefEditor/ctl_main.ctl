VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctl_main 
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
   Begin WFDefGUI.vpnWFDef_INFO_ pnlWFDef_INFO 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFDefGUI.vpnWFDef_param_ pnlWFDef_param 
      Height          =   1500
      Left            =   6000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFDefGUI.vpnWFDef_Doc_ pnlWFDef_Doc 
      Height          =   1500
      Left            =   0
      TabIndex        =   3
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WFDefGUI.vpnWFDef_master_ pnlWFDef_master 
      Height          =   1500
      Left            =   1500
      TabIndex        =   4
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
Attribute VB_Name = "ctl_main"
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





Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Private Sub ts_click()
  On Error Resume Next
  pnlWFDef_master.Visible = False
  pnlWFDef_Doc.Visible = False
  pnlWFDef_param.Visible = False
  pnlWFDef_INFO.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WFDef_INFO"
     With pnlWFDef_INFO
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFDef_INFO.OnClick item, ParentForm
     End With
   Case "WFDef_param"
     With pnlWFDef_param
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFDef_param.OnClick item, ParentForm
     End With
   Case "WFDef_Doc"
     With pnlWFDef_Doc
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFDef_Doc.OnClick item, ParentForm
     End With
   Case "WFDef_master"
     With pnlWFDef_master
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWFDef_master.OnClick item, ParentForm
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

ts.Tabs.item(1).Caption = "Описание процесса"
ts.Tabs.item(1).Key = "WFDef_INFO"
pnlWFDef_INFO.OnInit item, ParentForm
Call ts.Tabs.Add(, "WFDef_param", "Параметры и переменные")
pnlWFDef_param.OnInit item, ParentForm
Call ts.Tabs.Add(, "WFDef_Doc", "Документы")
pnlWFDef_Doc.OnInit item, ParentForm
Call ts.Tabs.Add(, "WFDef_master", "Управляющие")
pnlWFDef_master.OnInit item, ParentForm
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "WFDef", "ctl_main"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
  Set TSCustom = Nothing
 pnlWFDef_INFO.CloseClass
 pnlWFDef_param.CloseClass
 pnlWFDef_Doc.CloseClass
 pnlWFDef_master.CloseClass
End Sub
Public Sub OnSave()
 pnlWFDef_INFO.OnSave
 pnlWFDef_param.OnSave
 pnlWFDef_Doc.OnSave
 pnlWFDef_master.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlWFDef_INFO.IsChanged
m_IsChanged = m_IsChanged Or pnlWFDef_param.IsChanged
m_IsChanged = m_IsChanged Or pnlWFDef_Doc.IsChanged
m_IsChanged = m_IsChanged Or pnlWFDef_master.IsChanged
  IsChanged = m_IsChanged
End Function
Private Sub Usercontrol_resize()
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
'do nothing
End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure item.SecureStyleID
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
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
  MsgBox Err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
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
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next
item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = item.Name
item.Save
End Sub


Public Function StatusMenuCount() As Integer
  StatusMenuCount = 4
End Function
Public Function SetupStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    i = 0
    i = i + 1
    m(i).Caption = "Отладочная версия"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{1DB09A14-2F2D-41A4-884C-08DB5C4755DA}"
    i = i + 1
    m(i).Caption = "Оформляется"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{11307328-D9CA-410B-917D-808DEA9E8223}"
    i = i + 1
    m(i).Caption = "Готов"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{B88B0ACC-E639-4EF5-8427-AE1DEB70FC53}"
    i = i + 1
    m(i).Caption = "Устарел"
    m(i).Visible = True
    m(i).Enabled = True
    m(i).Checked = False
    m(i).Tag = "{E34DC882-2818-4C85-B607-D06EFC2C736E}"
End Function
Public Sub CheckStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    For i = 1 To StatusMenuCount
        m(i).Checked = False
        m(i).Enabled = False
        If Not item Is Nothing Then
          If m(i).Tag = item.StatusID Then
            m(i).Checked = True
          End If
        End If
    Next
    If Not item Is Nothing Then
      If item.StatusID = "{1DB09A14-2F2D-41A4-884C-08DB5C4755DA}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.StatusID = "{11307328-D9CA-410B-917D-808DEA9E8223}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.StatusID = "{B88B0ACC-E639-4EF5-8427-AE1DEB70FC53}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
      If item.StatusID = "{E34DC882-2818-4C85-B607-D06EFC2C736E}" Then
        For i = 1 To StatusMenuCount
        Next
      End If
   End If
End Sub



