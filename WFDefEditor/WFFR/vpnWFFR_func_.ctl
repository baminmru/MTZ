VERSION 5.00
Begin VB.UserControl vpnWFFR_func_ 
   ClientHeight    =   5370
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7410
   ScaleHeight     =   5370
   ScaleWidth      =   7410
   Begin VB.Frame pnlWFFR_func 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   -180
      TabIndex        =   0
      Top             =   15
      Width           =   9000
      Begin VB.CommandButton mdPause 
         Caption         =   "Отложить"
         Height          =   330
         Left            =   3600
         TabIndex        =   7
         Top             =   0
         Width           =   1125
      End
      Begin VB.CommandButton cmdDone 
         Caption         =   "Завершить"
         Height          =   330
         Left            =   2520
         TabIndex        =   6
         Top             =   0
         Width           =   1005
      End
      Begin VB.CommandButton cmdToWork 
         Caption         =   "В работу"
         Height          =   330
         Left            =   1440
         TabIndex        =   5
         Top             =   0
         Width           =   945
      End
      Begin VB.CommandButton cmdWFFR_funcCfg 
         Height          =   330
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   0
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_funcRef 
         Height          =   330
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   0
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFFR_funcSave 
         Enabled         =   0   'False
         Height          =   330
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "SAVE.ico"
         ToolTipText     =   "Сохранить"
         Top             =   0
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin WFFRGUI.WFFR_func editWFFR_func 
         Height          =   4155
         Left            =   195
         TabIndex        =   1
         Top             =   480
         Width           =   5205
         _ExtentX        =   9181
         _ExtentY        =   7329
      End
   End
End
Attribute VB_Name = "vpnWFFR_func_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean


Private Sub cmdDone_Click()
  If item.WFFR_func.item(1).State >= 2 And item.WFFR_func.item(1).State < 8 Then
    item.WFFR_func.item(1).State = 7
    item.WFFR_func.item(1).WorkPercent = 100
    item.WFFR_func.item(1).Save
    cmdWFFR_funcRef_Click
  End If
End Sub

Private Sub cmdToWork_Click()
If item.WFFR_func.item(1).State >= 2 And item.WFFR_func.item(1).State < 8 Then
  item.WFFR_func.item(1).State = 3
  item.WFFR_func.item(1).Save
End If
End Sub

Private Sub cmdWFFR_funcRef_Click()
  On Error Resume Next
  item.WFFR_func.Refresh
  cmdWFFR_funcAdd_Click
End Sub
Private Sub cmdWFFR_funcCfg_Click()
    On Error Resume Next
    editWFFR_func.Customize
    Dim ff As Long
    ff = FreeFile
    Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFR_editWFFR_func_" For Output As #ff
    Print #ff, editWFFR_func.PanelCustomisationString
    Close #ff
End Sub
Private Sub cmdWFFR_funcAdd_Click()
  On Error Resume Next
 Dim u As Object
 If item.WFFR_func.Count = 0 Then
   Set u = item.WFFR_func.Add

 End If
 Set editWFFR_func.item = item.WFFR_func.item(1)
 editWFFR_func.InitPanel
 cmdWFFR_funcSave.Enabled = False

End Sub

Private Sub editWFFR_func_Changed()
 cmdWFFR_funcSave.Enabled = True
End Sub
Private Sub cmdWFFR_funcSave_Click()
  On Error Resume Next
    If editWFFR_func.IsOK Then
    editWFFR_func.Save
  On Error GoTo bye
    editWFFR_func.item.Save
    cmdWFFR_funcSave.Enabled = False
    Else
      MsgBox "Не все обязательные поля заполнены", vbOKOnly + vbExclamation
    End If
Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
  editWFFR_func.item.Refresh
  editWFFR_func.InitPanel
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdWFFR_funcSave, cmdWFFR_funcSave.Tag
  LoadBtnPictures cmdWFFR_funcRef, cmdWFFR_funcRef.Tag
  LoadBtnPictures cmdWFFR_funcCfg, cmdWFFR_funcCfg.Tag
  Dim ff As Long, buf As String
  ff = FreeFile
  On Error Resume Next
  Open GetSetting("MTZ", "CONFIG", "LAYOUTS", "c:\") & "WFFR_editWFFR_func_" For Input As #ff
  buf = ""
  buf = Input(LOF(ff), ff)
  Close #ff
  If buf <> "" Then editWFFR_func.PanelCustomisationString = buf
  cmdWFFR_funcAdd_Click
End Sub
Private Sub OnTabClick()

      editWFFR_func.Top = 40 * Screen.TwipsPerPixelX
      editWFFR_func.Left = 5 * Screen.TwipsPerPixelX
      editWFFR_func.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      editWFFR_func.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
  editWFFR_func.Save
If editWFFR_func.item.Changed Then
  editWFFR_func.item.Save
End If
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
 m_IsChanged = m_IsChanged Or item.Changed
  IsChanged = m_IsChanged
End Function

Private Sub mdPause_Click()
  If item.WFFR_func.item(1).State = 3 Or item.WFFR_func.item(1).State = 2 Then
    item.WFFR_func.item(1).State = 4
    item.WFFR_func.item(1).Save
  End If
End Sub

Private Sub UserControl_Resize()
  On Error Resume Next
  pnlWFFR_func.Move 0, 0, UserControl.Width, UserControl.Height
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

  RowItem.Person.Secure item.SecureStyleid
  RowItem.Person.propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Применить стиль защиты для объекта Предназначен для  каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.id
  RowItem.Client.propagate
bye:
  Exit Sub
  MsgBox Err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
Dim id As String
 Dim obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set obj = RowItem.Report.VRRPT_MAIN.item(1)
 End If
 
 Set obj.Author = RowItem.Application.FindRowObject("Users", item.Application.MTZSession.GetSessionUserID())
 obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set obj.Person = RowItem.Application
 End If
 
 obj.Save
 RowItem.Save

End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, id As Variant, Optional RowItem As Object)
On Error Resume Next
If id <> "" Then
    Dim obj As Object
    Set obj = item.Manager.GetInstanceObject(id)
    If Not obj Is Nothing Then
      Dim objGui As Object
      Set objGui = item.Manager.GetInstanceGUI(obj.id)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If obj.MTZSession.CheckRight(obj.SecureStyleid, obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
item.Name = RowItem.Description
ParentForm.Caption = item.Name
item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
item.Name = RowItem.Name
ParentForm.Caption = item.Name
item.Save
End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
item.Name = Name
ParentForm.Caption = item.Name
item.Save
End Sub


