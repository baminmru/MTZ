VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl vpnVRDGReport_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRDGReport 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRDGReport 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRDGReportFnd 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDGReportPrn 
         Height          =   330
         Left            =   1575
         Style           =   1  'Graphical
         TabIndex        =   6
         Tag             =   "PrintPreview.ico"
         ToolTipText     =   "Печать"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDGReportRef 
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
      Begin VB.CommandButton cmdVRDGReportDel 
         Height          =   330
         Left            =   825
         Style           =   1  'Graphical
         TabIndex        =   4
         Tag             =   "DELETE.ico"
         ToolTipText     =   "Удалить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDGReportEdit 
         Height          =   330
         Left            =   450
         Style           =   1  'Graphical
         TabIndex        =   3
         Tag             =   "PROP.ico"
         ToolTipText     =   "Свойства"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRDGReportAdd 
         Height          =   330
         Left            =   75
         Style           =   1  'Graphical
         TabIndex        =   2
         Tag             =   "NEW.ico"
         ToolTipText     =   "Добавить"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin GridEX20.GridEX gridVRDGReport 
         Height          =   480
         Left            =   3900
         TabIndex        =   1
         Top             =   2760
         Width           =   1200
         _ExtentX        =   2117
         _ExtentY        =   847
         Version         =   "2.0"
         AutomaticSort   =   -1  'True
         RecordNavigatorString=   "Запись:|из"
         BoundColumnIndex=   ""
         ReplaceColumnIndex=   ""
         ScrollToolTipColumn=   ""
         TabKeyBehavior  =   1
         HideSelection   =   2
         SelectionStyle  =   1
         GroupByBoxInfoText=   "Группировка"
         AllowDelete     =   -1  'True
         AllowEdit       =   0   'False
         ItemCount       =   0
         DataMode        =   99
         ColumnHeaderHeight=   285
         IntProp1        =   0
         IntProp2        =   0
         IntProp7        =   0
         ColumnsCount    =   2
         Column(1)       =   "vpnVRDGReport_.ctx":0000
         Column(2)       =   "vpnVRDGReport_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRDGReport_.ctx":016C
         FormatStyle(2)  =   "vpnVRDGReport_.ctx":02C8
         FormatStyle(3)  =   "vpnVRDGReport_.ctx":0378
         FormatStyle(4)  =   "vpnVRDGReport_.ctx":042C
         FormatStyle(5)  =   "vpnVRDGReport_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRDGReport_.ctx":05BC
      End
   End
   Begin VB.Menu mnuPopupVRDGReport 
      Caption         =   "Меню для Отчеты"
      Visible         =   0   'False
      Begin VB.Menu mnuVRDGReportAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRDGReportEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRDGReportDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRDGReportOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRDGReportRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRDGReportPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRDGReportCfg 
         Caption         =   "Настроить"
      End
   End
End
Attribute VB_Name = "vpnVRDGReport_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRDGReport As Object
Private menuActionVRDGReport As String





Private Sub opVRDGReport_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef StartMode:="CONT", ID:=.Report.ID, RowItem:=RowItem
End With
End Sub
Private Sub opVRDGReport_MakeRpt_(RowItem As Object)
With RowItem
Run_VBMakeReport ReportType:="CONT", RowItem:=RowItem
End With
End Sub
Private Sub cmdVRDGReportCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRDGReport, "gridVRDGReport"
Set jset = Nothing
End Sub

Private Sub cmdVRDGReportPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRDGReport, "Отчеты"
Set jset = Nothing
End Sub

Private Sub cmdVRDGReportRef_Click()
  On Error Resume Next
  Item.VRDGReport.Refresh
  gridVRDGReport.ItemCount = Item.VRDGReport.Count
  gridVRDGReport.Refetch
  gridVRDGReport.Refresh
End Sub
Private Sub cmdVRDGReportAcc_Click()
On Error Resume Next
If gridVRDGReport.ItemCount = 0 Then Exit Sub
If gridVRDGReport.Row > 0 Then
 If gridVRDGReport.RowIndex(gridVRDGReport.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGReport.RowBookmark(gridVRDGReport.RowIndex(gridVRDGReport.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRDGReportEdit_Click()
  On Error Resume Next
If gridVRDGReport.ItemCount = 0 Then Exit Sub
If gridVRDGReport.Row > 0 Then
 If gridVRDGReport.RowIndex(gridVRDGReport.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGReport.RowBookmark(gridVRDGReport.RowIndex(gridVRDGReport.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRDGReport_.Item = u
again:     frmVRDGReport_.NotFirstTime = False
    frmVRDGReport_.OnInit
    frmVRDGReport_.Show vbModal
    If frmVRDGReport_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRDGReport.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRDGReportDel_Click()
  On Error Resume Next
  gridVRDGReport.Delete
End Sub
Private Sub cmdVRDGReportAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRDGReport.Add()
 Dim ID As String
 ID = CreateGUID2
 Call u.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 Set u.Report = u.Application.Manager.GetInstanceObject(ID)
 u.Save
 u.Application.MTZSession.SetOwner u.Report.ID, u.PartName, u.ID

        opVRDGReport_MakeRpt_ u
        gridVRDGReport.ItemCount = Item.VRDGReport.Count
        gridVRDGReport.Refresh
        gridVRDGReport.RefreshGroups
        gridVRDGReport.RefreshSort
        gridVRDGReport.MoveToBookmark u.ID & "VRDGReport"
        cmdVRDGReportRun_Click
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRDGReportFnd_Click()
  On Error Resume Next
  fndVRDGReport.ShowForm
End Sub
Private Sub cmdVRDGReportRun_Click()
  On Error Resume Next
  gridVRDGReport_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRDGReport_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRDGReport.LoadRow gridVRDGReport, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRDGReport_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRDGReport.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("VRDGReport", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.Brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
      On Error GoTo bye
      u.Parent.Delete u.ID
    Else
      Cancel = True
    End If
  End If
Exit Sub
bye:
   Cancel = True
   MsgBox err.Description, vbOKOnly + vbExclamation, "Удаление"
End Sub

Private Sub gridVRDGReport_DblClick()
If gridVRDGReport.ItemCount = 0 Then Exit Sub
If gridVRDGReport.Row > 0 Then
  If gridVRDGReport.RowIndex(gridVRDGReport.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGReport.RowBookmark(gridVRDGReport.RowIndex(gridVRDGReport.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    On Error Resume Next
    If Not u Is Nothing Then
      opVRDGReport_OpenRef_ u
    End If
     u.Refresh
  End If
End If
End Sub
Private Sub gridVRDGReport_KeyPress(KeyAscii As Integer)
  If gridVRDGReport.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRDGReport.FindOnPress KeyAscii
End Sub

Private Sub gridVRDGReport_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRDGReport.Row And LastRow > 0 Then
  gridVRDGReport.GetRowData(LastRow).RowStyle = "Default"
  gridVRDGReport.GetRowData(gridVRDGReport.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRDGReportPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRDGReport.Add()
    If GetFromBuffer(u) Then
      gridVRDGReport.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRDGReport_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRDGReportCfg_Click
        End If
    End If
End Sub

Private Sub gridVRDGReport_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRDGReport
End If
End Sub
Private Sub mnuVRDGReportAdd_click()
   menuActionVRDGReport = "ADD"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportEdit_click()
   menuActionVRDGReport = "EDIT"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportDelete_click()
   menuActionVRDGReport = "DEL"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportOpen_click()
   menuActionVRDGReport = "RUN"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportRef_click()
   menuActionVRDGReport = "REF"
   menuTimerVRDGReport.Enabled = True
End Sub
  Private Sub mnuVRDGReportCOPY_Click()
    On Error Resume Next
    If gridVRDGReport.ItemCount = 0 Then Exit Sub
    If gridVRDGReport.Row > 0 Then
     If gridVRDGReport.RowIndex(gridVRDGReport.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRDGReport.RowBookmark(gridVRDGReport.RowIndex(gridVRDGReport.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRDGReportCUT_Click()
    On Error Resume Next
    If gridVRDGReport.ItemCount = 0 Then Exit Sub
    If gridVRDGReport.Row > 0 Then
     If gridVRDGReport.RowIndex(gridVRDGReport.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRDGReport.RowBookmark(gridVRDGReport.RowIndex(gridVRDGReport.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRDGReport.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRDGReportCHANGE_Click()
  On Error Resume Next
  If gridVRDGReport.ItemCount = 0 Then Exit Sub
  If gridVRDGReport.Row > 0 Then
   If gridVRDGReport.RowIndex(gridVRDGReport.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRDGReport.RowBookmark(gridVRDGReport.RowIndex(gridVRDGReport.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRDGReport.ItemCount = u.Parent.Count
      gridVRDGReport.RefreshRowIndex gridVRDGReport.RowIndex(gridVRDGReport.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRDGReportCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRDGReportPrn_click()
   menuActionVRDGReport = "PRN"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportCfg_click()
   menuActionVRDGReport = "CFG"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportFind_click()
   menuActionVRDGReport = "FND"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub mnuVRDGReportAcc_click()
   menuActionVRDGReport = "ACC"
   menuTimerVRDGReport.Enabled = True
End Sub
Private Sub menuTimerVRDGReport_timer()
   menuTimerVRDGReport.Enabled = False
   If menuActionVRDGReport = "ADD" Then cmdVRDGReportAdd_Click
   If menuActionVRDGReport = "EDIT" Then cmdVRDGReportEdit_Click
   If menuActionVRDGReport = "DEL" Then cmdVRDGReportDel_Click
   If menuActionVRDGReport = "RUN" Then cmdVRDGReportRun_Click
   If menuActionVRDGReport = "REF" Then cmdVRDGReportRef_Click
   If menuActionVRDGReport = "PRN" Then cmdVRDGReportPrn_Click
   If menuActionVRDGReport = "CFG" Then cmdVRDGReportCfg_Click
   If menuActionVRDGReport = "FND" Then cmdVRDGReportFnd_Click
   If menuActionVRDGReport = "ACC" Then cmdVRDGReportAcc_Click
   menuActionVRDGReport = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRDGReportAdd, cmdVRDGReportAdd.Tag
  LoadBtnPictures cmdVRDGReportEdit, cmdVRDGReportEdit.Tag
  LoadBtnPictures cmdVRDGReportDel, cmdVRDGReportDel.Tag
  LoadBtnPictures cmdVRDGReportRef, cmdVRDGReportRef.Tag
  LoadBtnPictures cmdVRDGReportPrn, cmdVRDGReportPrn.Tag
  LoadBtnPictures cmdVRDGReportFnd, cmdVRDGReportFnd.Tag
  Item.VRDGReport.PrepareGrid gridVRDGReport
  LoadGridLayout gridVRDGReport
  Set fndVRDGReport = Nothing
  On Error Resume Next
  Set fndVRDGReport = CreateObject("MTZ_JSetup.GridFinder")
  fndVRDGReport.Init gridVRDGReport
End Sub
Private Sub OnTabClick()

      gridVRDGReport.Top = 40 * Screen.TwipsPerPixelX
      gridVRDGReport.Left = 5 * Screen.TwipsPerPixelX
      gridVRDGReport.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRDGReport.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRDGReport.Top = 40 * Screen.TwipsPerPixelX
      gridVRDGReport.Left = 5 * Screen.TwipsPerPixelX
      gridVRDGReport.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRDGReport.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
End Sub
Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
  On Error Resume Next
  Set Item = aItem
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
  pnlVRDGReport.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRDGReport = Nothing
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  CloseClass
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
 'ID = CreateGUID2
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





