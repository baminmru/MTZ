VERSION 5.00
Begin VB.UserControl vpnWFFD_ATTR1_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Frame pnlWFFD_ATTR1 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFFD_ATTR1Cfg 
         Height          =   330
         Left            =   1725
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Ref 
         Height          =   330
         Left            =   1200
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Add 
         Enabled         =   0   'False
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "New.ico"
         ToolTipText     =   "Создать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Del 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFD_ATTR1Save 
         Enabled         =   0   'False
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin WFFDGUI.WFFD_ATTR1 editWFFD_ATTR1 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
      End
   End
End
Attribute VB_Name = "vpnWFFD_ATTR1_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean





Private Sub cmdWFFD_ATTR1Ref_Click()
  On Error Resume Next
  item.WFFD_ATTR1.Refresh
  cmdWFFD_ATTR1Add_Click
End Sub
Private Sub cmdWFFD_ATTR1Cfg_Click()
    On Error Resume Next
    editWFFD_ATTR1.Customize
    Dim ff As Long
    ff = FreeFile
    Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFD_editWFFD_ATTR1_" For Output As #ff
    Print #ff, editWFFD_ATTR1.PanelCustomisationString
    Close #ff
End Sub
Private Sub cmdWFFD_ATTR1Add_Click()
  On Error Resume Next
 Dim u As Object
 If item.WFFD_ATTR1.Count = 0 Then
   Set u = item.WFFD_ATTR1.Add

 End If
 Set editWFFD_ATTR1.item = item.WFFD_ATTR1.item(1)
 editWFFD_ATTR1.InitPanel
 cmdWFFD_ATTR1Del.Enabled = True
 cmdWFFD_ATTR1Save.Enabled = True
 cmdWFFD_ATTR1Add.Enabled = True
End Sub
Private Sub cmdWFFD_ATTR1Del_Click()
  On Error Resume Next
  If editWFFD_ATTR1.item Is Nothing Then Exit Sub
  If MsgBox("Удалить элемент" & vbCrLf & editWFFD_ATTR1.item.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
    On Error GoTo bye
    editWFFD_ATTR1.item.Parent.Delete editWFFD_ATTR1.item.ID
    cmdWFFD_ATTR1Del.Enabled = False
    cmdWFFD_ATTR1Save.Enabled = False
    editWFFD_ATTR1.Enabled = False
    Set editWFFD_ATTR1.item = Nothing
    cmdWFFD_ATTR1Add.Enabled = True
  End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub
Private Sub editWFFD_ATTR1_Changed()
 cmdWFFD_ATTR1Save.Enabled = True
End Sub
Private Sub cmdWFFD_ATTR1Save_Click()
  On Error Resume Next
    If editWFFD_ATTR1.IsOK Then
    editWFFD_ATTR1.Save
  On Error GoTo bye
    editWFFD_ATTR1.item.Save
    cmdWFFD_ATTR1Save.Enabled = False
    Else
      MsgBox "Не все обязательные поля заполнены", vbOKOnly + vbExclamation
    End If
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFFD_ATTR1.item.Refresh
  editWFFD_ATTR1.InitPanel
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFD_ATTR1Save, cmdWFFD_ATTR1Save.Tag
  LoadBtnPictures cmdWFFD_ATTR1Del, cmdWFFD_ATTR1Del.Tag
  LoadBtnPictures cmdWFFD_ATTR1Add, cmdWFFD_ATTR1Add.Tag
  LoadBtnPictures cmdWFFD_ATTR1Ref, cmdWFFD_ATTR1Ref.Tag
  LoadBtnPictures cmdWFFD_ATTR1Cfg, cmdWFFD_ATTR1Cfg.Tag
  Dim ff As Long, buf As String
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFD_editWFFD_ATTR1_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFFD_ATTR1.PanelCustomisationString = buf
  cmdWFFD_ATTR1Add_Click
End Sub
Private Sub OnTabClick()

      editWFFD_ATTR1.Top = 40 * Screen.TwipsPerPixelX
      editWFFD_ATTR1.Left = 5 * Screen.TwipsPerPixelX
      editWFFD_ATTR1.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      editWFFD_ATTR1.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
  editWFFD_ATTR1.Save
If editWFFD_ATTR1.item.Changed Then
  editWFFD_ATTR1.item.Save
End If
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
 m_IsChanged = m_IsChanged Or item.Changed
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlWFFD_ATTR1.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
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





