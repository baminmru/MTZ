VERSION 5.00
Object = "{8408294B-9E97-428D-999B-82C43BF0BFFA}#3.0#0"; "JWRAP.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnWFRtm_Doc_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerWFRtm_Doc 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   3840
      Top             =   360
   End
   Begin VB.Frame pnlWFRtm_Doc 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdWFRtm_DocAcc 
         Height          =   330
         Left            =   2400
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocFnd 
         Height          =   330
         Left            =   1680
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocCfg 
         Height          =   330
         Left            =   1320
         Style           =   1  'Graphical
         TabIndex        =   5
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocPrn 
         Height          =   330
         Left            =   960
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocRef 
         Height          =   330
         Left            =   600
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "Refresh.ico"
         ToolTipText     =   "Обновить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdWFRtm_DocEdit 
         Height          =   330
         Left            =   240
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin JWRAP.JanusWRAP gridWFRtm_Doc 
         Height          =   1800
         Left            =   240
         TabIndex        =   1
         Top             =   720
         Width           =   3120
         _ExtentX        =   5503
         _ExtentY        =   3175
      End
      Begin MTZ_PANEL.DropButton cmdWFRtm_DocRun 
         Height          =   330
         Left            =   2040
         TabIndex        =   7
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Menu mnuPopupWFRtm_Doc 
      Caption         =   "Меню для Документы"
      Visible         =   0   'False
      Begin VB.Menu mnuWFRtm_DocEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuWFRtm_DocOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuWFRtm_DocRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuWFRtm_DocS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWFRtm_DocPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuWFRtm_DocCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuWFRtm_DocFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuWFRtm_DocAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnWFRtm_Doc_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndWFRtm_Doc As Object
Private menuActionWFRtm_Doc As String


Private Sub cmdWFRtm_DocCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridWFRtm_Doc, "gridWFRtm_Doc"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_DocPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridWFRtm_Doc, "Документы"
Set jset = Nothing
End Sub

Private Sub cmdWFRtm_DocRef_Click()
  On Error Resume Next
  item.WFRtm_Doc.Refresh
  gridWFRtm_Doc.ItemCount = item.WFRtm_Doc.Count
  gridWFRtm_Doc.Refetch
  gridWFRtm_Doc.Refresh
End Sub
Private Sub cmdWFRtm_DocAcc_Click()
On Error Resume Next
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
 If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdWFRtm_DocEdit_Click()
  On Error Resume Next
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
 If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    Set frmWFRtm_Doc_.item = u
again:     frmWFRtm_Doc_.NotFirstTime = False
    frmWFRtm_Doc_.OnInit
    frmWFRtm_Doc_.Show vbModal
    If frmWFRtm_Doc_.OK Then
    On Error Resume Next
    Err.Clear
    u.Save
    If Err.Number <> 0 Then
      MsgBox Err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridWFRtm_Doc.RefreshRowBookmark BM
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdWFRtm_DocDel_Click()
  On Error Resume Next
  gridWFRtm_Doc.Delete
End Sub
Private Sub cmdWFRtm_DocAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.WFRtm_Doc.Add()

      Set frmWFRtm_Doc_.item = u
again:       frmWFRtm_Doc_.NotFirstTime = False
      frmWFRtm_Doc_.OnInit
      frmWFRtm_Doc_.Show vbModal
      If frmWFRtm_Doc_.OK Then
        Err.Clear
        u.Save
        If Err.Number <> 0 Then
          MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridWFRtm_Doc.ItemCount = item.WFRtm_Doc.Count
        gridWFRtm_Doc.Refresh
        gridWFRtm_Doc.RefreshGroups
        gridWFRtm_Doc.RefreshSort
        gridWFRtm_Doc.MoveToBookmark u.id & "WFRtm_Doc"
      Else
        item.WFRtm_Doc.Remove u.id
      End If
      Exit Sub
bye:
   MsgBox Err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdWFRtm_DocFnd_Click()
  On Error Resume Next
  fndWFRtm_Doc.ShowForm
End Sub
Private Sub cmdWFRtm_DocRun_Click()
  On Error Resume Next
  gridWFRtm_Doc_JWDblClick
End Sub

Private Sub gridWFRtm_Doc_JWUnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As Object)
item.WFRtm_Doc.LoadRow gridWFRtm_Doc, RowIndex, Bookmark, Values
End Sub
Private Sub gridWFRtm_Doc_JWBeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As Object)
 Cancel = True
End Sub

Private Sub gridWFRtm_Doc_JWDblClick()
If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
If gridWFRtm_Doc.Row > 0 Then
  If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    On Error Resume Next
    If Not u Is Nothing Then
       Run_VBOpenRef "", u.Document.id
    End If
     u.Refresh
  End If
End If

End Sub
Private Sub gridWFRtm_Doc_JWKeyPress(KeyAscii As Integer)
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndWFRtm_Doc.FindOnPress KeyAscii
End Sub

Private Sub gridWFRtm_Doc_JWRowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridWFRtm_Doc.Row And LastRow > 0 Then
  gridWFRtm_Doc.GetRowData(LastRow).RowStyle = "Default"
  gridWFRtm_Doc.GetRowData(gridWFRtm_Doc.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuWFRtm_DocPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.WFRtm_Doc.Add()
    If GetFromBuffer(u) Then
      gridWFRtm_Doc.ItemCount = u.Parent.Count
    End If
End Sub
Private Sub gridWFRtm_Doc_JWMouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 And Shift = 0 Then
  PopupMenu mnuPopupWFRtm_Doc
End If
End Sub
Private Sub mnuWFRtm_DocAdd_click()
   menuActionWFRtm_Doc = "ADD"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocEdit_click()
   menuActionWFRtm_Doc = "EDIT"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocDelete_click()
   menuActionWFRtm_Doc = "DEL"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocOpen_click()
   menuActionWFRtm_Doc = "RUN"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocRef_click()
   menuActionWFRtm_Doc = "REF"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
  Private Sub mnuWFRtm_DocCOPY_Click()
    On Error Resume Next
    If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Doc.Row > 0 Then
     If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
        Dim u As Object
        Dim BM
        BM = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
        Set u = item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuWFRtm_DocCUT_Click()
    On Error Resume Next
    If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
    If gridWFRtm_Doc.Row > 0 Then
     If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
        Dim u As Object
        Dim BM
        BM = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
        Set u = item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
        SaveToBuffer u
        Set BM = u.Parent
        u.Parent.Delete u.id
        gridWFRtm_Doc.ItemCount = BM.Count
      End If
    End If
  End Sub
Private Sub mnuWFRtm_DocCHANGE_Click()
  On Error Resume Next
  If gridWFRtm_Doc.ItemCount = 0 Then Exit Sub
  If gridWFRtm_Doc.Row > 0 Then
   If gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row) > 0 Then
    Dim u As Object
    Dim BM
    BM = gridWFRtm_Doc.RowBookmark(gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row))
    Set u = item.FindRowObject(Right(BM, Len(BM) - 38), Left(BM, 38))
    If GetFromBuffer(u) Then
      gridWFRtm_Doc.ItemCount = u.Parent.Count
      gridWFRtm_Doc.RefreshRowIndex gridWFRtm_Doc.RowIndex(gridWFRtm_Doc.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuWFRtm_DocCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuWFRtm_DocPrn_click()
   menuActionWFRtm_Doc = "PRN"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocCfg_click()
   menuActionWFRtm_Doc = "CFG"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocFind_click()
   menuActionWFRtm_Doc = "FND"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub mnuWFRtm_DocAcc_click()
   menuActionWFRtm_Doc = "ACC"
   menuTimerWFRtm_Doc.Enabled = True
End Sub
Private Sub menuTimerWFRtm_Doc_timer()
   menuTimerWFRtm_Doc.Enabled = False
   If menuActionWFRtm_Doc = "EDIT" Then cmdWFRtm_DocEdit_Click
   If menuActionWFRtm_Doc = "RUN" Then cmdWFRtm_DocRun_Click
   If menuActionWFRtm_Doc = "REF" Then cmdWFRtm_DocRef_Click
   If menuActionWFRtm_Doc = "PRN" Then cmdWFRtm_DocPrn_Click
   If menuActionWFRtm_Doc = "CFG" Then cmdWFRtm_DocCfg_Click
   If menuActionWFRtm_Doc = "FND" Then cmdWFRtm_DocFnd_Click
   If menuActionWFRtm_Doc = "ACC" Then cmdWFRtm_DocAcc_Click
   menuActionWFRtm_Doc = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  
  LoadBtnPictures cmdWFRtm_DocEdit, cmdWFRtm_DocEdit.Tag
  LoadBtnPictures cmdWFRtm_DocRef, cmdWFRtm_DocRef.Tag
  LoadBtnPictures cmdWFRtm_DocCfg, cmdWFRtm_DocCfg.Tag
  LoadBtnPictures cmdWFRtm_DocPrn, cmdWFRtm_DocPrn.Tag
  LoadBtnPictures cmdWFRtm_DocFnd, cmdWFRtm_DocFnd.Tag
  LoadBtnPictures cmdWFRtm_DocRun, cmdWFRtm_DocRun.Tag
  LoadBtnPictures cmdWFRtm_DocAcc, cmdWFRtm_DocAcc.Tag
  item.WFRtm_Doc.PrepareGrid gridWFRtm_Doc
  LoadGridLayout gridWFRtm_Doc
  Set fndWFRtm_Doc = Nothing
  On Error Resume Next
  Set fndWFRtm_Doc = CreateObject("MTZ_JSetup.GridFinder")
  fndWFRtm_Doc.Init gridWFRtm_Doc
End Sub
Private Sub OnTabClick()

      gridWFRtm_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridWFRtm_Doc.Top = 40 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Left = 5 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridWFRtm_Doc.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set item = aItem
  Set ParentForm = pForm
  OnTabClick
End Sub
Public Sub OnSave()
  
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
  
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
  On Error Resume Next
  pnlWFRtm_Doc.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndWFRtm_Doc = Nothing
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



'Применить стиль защиты для объекта Предназначен для  каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.id
  RowItem.Client.Propagate
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
          If obj.MTZSession.CheckRight(obj.SecureStyleID, obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
            
      Err.Clear
      On Error Resume Next
      objGui.Show StartMode & "", obj, True
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



