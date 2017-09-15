VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRCPReports_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRCPReports 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRCPReports 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRCPReportsAcc 
         Height          =   330
         Left            =   3075
         Style           =   1  'Graphical
         TabIndex        =   10
         Tag             =   "security.ico"
         ToolTipText     =   "Стиль защиты"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRCPReportsFnd 
         Height          =   330
         Left            =   2325
         Style           =   1  'Graphical
         TabIndex        =   8
         Tag             =   "find.ico"
         ToolTipText     =   "Поиск"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRCPReportsCfg 
         Height          =   330
         Left            =   1950
         Style           =   1  'Graphical
         TabIndex        =   7
         Tag             =   "config.ico"
         ToolTipText     =   "Настройка внешнего вида"
         Top             =   30
         UseMaskColor    =   -1  'True
         Width           =   330
      End
      Begin VB.CommandButton cmdVRCPReportsPrn 
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
      Begin VB.CommandButton cmdVRCPReportsRef 
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
      Begin VB.CommandButton cmdVRCPReportsDel 
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
      Begin VB.CommandButton cmdVRCPReportsEdit 
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
      Begin VB.CommandButton cmdVRCPReportsAdd 
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
      Begin GridEX20.GridEX gridVRCPReports 
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
         Column(1)       =   "vpnVRCPReports_.ctx":0000
         Column(2)       =   "vpnVRCPReports_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRCPReports_.ctx":016C
         FormatStyle(2)  =   "vpnVRCPReports_.ctx":02C8
         FormatStyle(3)  =   "vpnVRCPReports_.ctx":0378
         FormatStyle(4)  =   "vpnVRCPReports_.ctx":042C
         FormatStyle(5)  =   "vpnVRCPReports_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRCPReports_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRCPReportsRun 
         Height          =   330
         Left            =   2700
         TabIndex        =   9
         Tag             =   "run.ico"
         ToolTipText     =   "Открыть"
         Top             =   30
         Width           =   330
         _ExtentX        =   582
         _ExtentY        =   582
         Caption         =   ""
      End
   End
   Begin VB.Menu mnuPopupVRCPReports 
      Caption         =   "Меню для Отчеты"
      Visible         =   0   'False
      Begin VB.Menu mnuVRCPReportsAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRCPReportsEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRCPReportsDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRCPReportsOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRCPReportsRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRCPReportsS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRCPReportsBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRCPReportsCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRCPReportsCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRCPReportsPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRCPReportsCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRCPReportsCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRCPReportsPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRCPReportsCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRCPReportsFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRCPReportsAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRCPReports_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRCPReports As Object
Private menuActionVRCPReports As String





Private Sub opVRCPReports_MakeRpt_(RowItem As Object)
With RowItem
Run_VBMakeReport ReportType:="PERS", RowItem:=RowItem
End With
End Sub
Private Sub opVRCPReports_OpenRef_(RowItem As Object)
With RowItem
Run_VBOpenRef ID:=.Report.ID, StartMode:="PERS", RowItem:=RowItem
End With
End Sub
Private Sub cmdVRCPReportsCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRCPReports, "gridVRCPReports"
Set jset = Nothing
End Sub

Private Sub cmdVRCPReportsPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRCPReports, "Отчеты"
Set jset = Nothing
End Sub

Private Sub cmdVRCPReportsRef_Click()
  On Error Resume Next
  Item.VRCPReports.Refresh
  gridVRCPReports.ItemCount = Item.VRCPReports.Count
  gridVRCPReports.Refetch
  gridVRCPReports.Refresh
End Sub
Private Sub cmdVRCPReportsAcc_Click()
On Error Resume Next
If gridVRCPReports.ItemCount = 0 Then Exit Sub
If gridVRCPReports.Row > 0 Then
 If gridVRCPReports.RowIndex(gridVRCPReports.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPReports.RowBookmark(gridVRCPReports.RowIndex(gridVRCPReports.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRCPReportsEdit_Click()
  On Error Resume Next
If gridVRCPReports.ItemCount = 0 Then Exit Sub
If gridVRCPReports.Row > 0 Then
 If gridVRCPReports.RowIndex(gridVRCPReports.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPReports.RowBookmark(gridVRCPReports.RowIndex(gridVRCPReports.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRCPReports_.Item = u
again:     frmVRCPReports_.NotFirstTime = False
    frmVRCPReports_.OnInit
    frmVRCPReports_.Show vbModal
    If frmVRCPReports_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRCPReports.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRCPReportsDel_Click()
  On Error Resume Next
  gridVRCPReports.Delete
End Sub
Private Sub cmdVRCPReportsAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRCPReports.Add()
 Dim ID As String
 ID = CreateGUID2
 Call u.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 Set u.Report = u.Application.Manager.GetInstanceObject(ID)
 u.Save
 u.Application.MTZSession.SetOwner u.Report.ID, u.PartName, u.ID

        opVRCPReports_MakeRpt_ u
        gridVRCPReports.ItemCount = Item.VRCPReports.Count
        gridVRCPReports.Refresh
        gridVRCPReports.RefreshGroups
        gridVRCPReports.RefreshSort
        gridVRCPReports.MoveToBookmark u.ID & "VRCPReports"
        cmdVRCPReportsRun_Click
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRCPReportsFnd_Click()
  On Error Resume Next
  fndVRCPReports.ShowForm
End Sub
Private Sub cmdVRCPReportsRun_Click()
  On Error Resume Next
  gridVRCPReports_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRCPReports_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRCPReports.LoadRow gridVRCPReports, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRCPReports_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRCPReports.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("VRCPReports", Left(Bookmark, 38))
  If Not u Is Nothing Then
    On Error Resume Next
    If MsgBox("Удалить элемент" & vbCrLf & u.brief & vbCrLf & "?", vbYesNo + vbQuestion, "Внимание") = vbYes Then
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

Private Sub gridVRCPReports_DblClick()
If gridVRCPReports.ItemCount = 0 Then Exit Sub
If gridVRCPReports.Row > 0 Then
  If gridVRCPReports.RowIndex(gridVRCPReports.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPReports.RowBookmark(gridVRCPReports.RowIndex(gridVRCPReports.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    On Error Resume Next
    If Not u Is Nothing Then
      opVRCPReports_OpenRef_ u
    End If
     u.Refresh
  End If
End If
End Sub
Private Sub gridVRCPReports_KeyPress(KeyAscii As Integer)
  If gridVRCPReports.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRCPReports.FindOnPress KeyAscii
End Sub

Private Sub gridVRCPReports_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRCPReports.Row And LastRow > 0 Then
  gridVRCPReports.GetRowData(LastRow).RowStyle = "Default"
  gridVRCPReports.GetRowData(gridVRCPReports.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRCPReportsPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRCPReports.Add()
    If GetFromBuffer(u) Then
      gridVRCPReports.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRCPReports_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRCPReportsCfg_Click
        End If
    End If
End Sub

Private Sub gridVRCPReports_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRCPReports
End If
End Sub
Private Sub mnuVRCPReportsAdd_click()
   menuActionVRCPReports = "ADD"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsEdit_click()
   menuActionVRCPReports = "EDIT"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsDelete_click()
   menuActionVRCPReports = "DEL"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsOpen_click()
   menuActionVRCPReports = "RUN"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsRef_click()
   menuActionVRCPReports = "REF"
   menuTimerVRCPReports.Enabled = True
End Sub
  Private Sub mnuVRCPReportsCOPY_Click()
    On Error Resume Next
    If gridVRCPReports.ItemCount = 0 Then Exit Sub
    If gridVRCPReports.Row > 0 Then
     If gridVRCPReports.RowIndex(gridVRCPReports.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRCPReports.RowBookmark(gridVRCPReports.RowIndex(gridVRCPReports.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRCPReportsCUT_Click()
    On Error Resume Next
    If gridVRCPReports.ItemCount = 0 Then Exit Sub
    If gridVRCPReports.Row > 0 Then
     If gridVRCPReports.RowIndex(gridVRCPReports.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRCPReports.RowBookmark(gridVRCPReports.RowIndex(gridVRCPReports.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRCPReports.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRCPReportsCHANGE_Click()
  On Error Resume Next
  If gridVRCPReports.ItemCount = 0 Then Exit Sub
  If gridVRCPReports.Row > 0 Then
   If gridVRCPReports.RowIndex(gridVRCPReports.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPReports.RowBookmark(gridVRCPReports.RowIndex(gridVRCPReports.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRCPReports.ItemCount = u.Parent.Count
      gridVRCPReports.RefreshRowIndex gridVRCPReports.RowIndex(gridVRCPReports.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRCPReportsCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRCPReportsPrn_click()
   menuActionVRCPReports = "PRN"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsCfg_click()
   menuActionVRCPReports = "CFG"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsFind_click()
   menuActionVRCPReports = "FND"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub mnuVRCPReportsAcc_click()
   menuActionVRCPReports = "ACC"
   menuTimerVRCPReports.Enabled = True
End Sub
Private Sub menuTimerVRCPReports_timer()
   menuTimerVRCPReports.Enabled = False
   If menuActionVRCPReports = "ADD" Then cmdVRCPReportsAdd_Click
   If menuActionVRCPReports = "EDIT" Then cmdVRCPReportsEdit_Click
   If menuActionVRCPReports = "DEL" Then cmdVRCPReportsDel_Click
   If menuActionVRCPReports = "RUN" Then cmdVRCPReportsRun_Click
   If menuActionVRCPReports = "REF" Then cmdVRCPReportsRef_Click
   If menuActionVRCPReports = "PRN" Then cmdVRCPReportsPrn_Click
   If menuActionVRCPReports = "CFG" Then cmdVRCPReportsCfg_Click
   If menuActionVRCPReports = "FND" Then cmdVRCPReportsFnd_Click
   If menuActionVRCPReports = "ACC" Then cmdVRCPReportsAcc_Click
   menuActionVRCPReports = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRCPReportsAdd, cmdVRCPReportsAdd.Tag
  LoadBtnPictures cmdVRCPReportsEdit, cmdVRCPReportsEdit.Tag
  LoadBtnPictures cmdVRCPReportsDel, cmdVRCPReportsDel.Tag
  LoadBtnPictures cmdVRCPReportsRef, cmdVRCPReportsRef.Tag
  LoadBtnPictures cmdVRCPReportsPrn, cmdVRCPReportsPrn.Tag
  LoadBtnPictures cmdVRCPReportsFnd, cmdVRCPReportsFnd.Tag
  LoadBtnPictures cmdVRCPReportsRun, cmdVRCPReportsRun.Tag
  LoadBtnPictures cmdVRCPReportsAcc, cmdVRCPReportsAcc.Tag
  LoadBtnPictures cmdVRCPReportsCfg, cmdVRCPReportsCfg.Tag
  Item.VRCPReports.PrepareGrid gridVRCPReports
  LoadGridLayout gridVRCPReports
  Set fndVRCPReports = Nothing
  On Error Resume Next
  Set fndVRCPReports = CreateObject("MTZ_JSetup.GridFinder")
  fndVRCPReports.Init gridVRCPReports
End Sub
Private Sub OnTabClick()

      gridVRCPReports.Top = 40 * Screen.TwipsPerPixelX
      gridVRCPReports.Left = 5 * Screen.TwipsPerPixelX
      gridVRCPReports.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRCPReports.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRCPReports.Top = 40 * Screen.TwipsPerPixelX
      gridVRCPReports.Left = 5 * Screen.TwipsPerPixelX
      gridVRCPReports.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRCPReports.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRCPReports.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRCPReports = Nothing
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





