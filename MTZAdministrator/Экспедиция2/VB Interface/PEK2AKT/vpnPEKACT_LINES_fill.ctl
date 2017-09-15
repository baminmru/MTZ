VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKACT_LINES_fill 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKACT_LINES 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKACT_LINES 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKACT_LINESAcc 
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
      Begin VB.CommandButton cmdPEKACT_LINESFnd 
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
      Begin VB.CommandButton cmdPEKACT_LINESCfg 
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
      Begin VB.CommandButton cmdPEKACT_LINESPrn 
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
      Begin VB.CommandButton cmdPEKACT_LINESRef 
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
      Begin VB.CommandButton cmdPEKACT_LINESDel 
         Enabled         =   0   'False
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
      Begin VB.CommandButton cmdPEKACT_LINESEdit 
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
      Begin VB.CommandButton cmdPEKACT_LINESAdd 
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
      Begin GridEX20.GridEX gridPEKACT_LINES 
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
         Column(1)       =   "vpnPEKACT_LINES_fill.ctx":0000
         Column(2)       =   "vpnPEKACT_LINES_fill.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKACT_LINES_fill.ctx":016C
         FormatStyle(2)  =   "vpnPEKACT_LINES_fill.ctx":02C8
         FormatStyle(3)  =   "vpnPEKACT_LINES_fill.ctx":0378
         FormatStyle(4)  =   "vpnPEKACT_LINES_fill.ctx":042C
         FormatStyle(5)  =   "vpnPEKACT_LINES_fill.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKACT_LINES_fill.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKACT_LINESRun 
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
   Begin VB.Menu mnuPopupPEKACT_LINES 
      Caption         =   "Меню для Строки акта"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKACT_LINESAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKACT_LINESEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKACT_LINESDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKACT_LINESOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKACT_LINESRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKACT_LINESS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKACT_LINESBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKACT_LINESCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKACT_LINESCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKACT_LINESPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKACT_LINESCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKACT_LINESCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKACT_LINESPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKACT_LINESCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKACT_LINESFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKACT_LINESAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKACT_LINES_fill"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKACT_LINES As Object
Private menuActionPEKACT_LINES As String





Private Sub cmdPEKACT_LINESCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKACT_LINES, "gridPEKACT_LINES"
Set jset = Nothing
End Sub

Private Sub cmdPEKACT_LINESPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKACT_LINES, "Строки акта"
Set jset = Nothing
End Sub

Private Sub cmdPEKACT_LINESRef_Click()
  On Error Resume Next
  Item.PEKACT_LINES.Refresh
  gridPEKACT_LINES.ItemCount = Item.PEKACT_LINES.Count
  gridPEKACT_LINES.Refetch
  gridPEKACT_LINES.Refresh
End Sub
Private Sub cmdPEKACT_LINESAcc_Click()
On Error Resume Next
If gridPEKACT_LINES.ItemCount = 0 Then Exit Sub
If gridPEKACT_LINES.Row > 0 Then
 If gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKACT_LINES.RowBookmark(gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKACT_LINESEdit_Click()
  On Error Resume Next
If gridPEKACT_LINES.ItemCount = 0 Then Exit Sub
If gridPEKACT_LINES.Row > 0 Then
 If gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKACT_LINES.RowBookmark(gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKACT_LINES_fill.Item = u
again:     frmPEKACT_LINES_fill.NotFirstTime = False
    frmPEKACT_LINES_fill.OnInit
    frmPEKACT_LINES_fill.Show vbModal
    If frmPEKACT_LINES_fill.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKACT_LINES.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKACT_LINESDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKACT_LINESAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKACT_LINES.Add()

      Set frmPEKACT_LINES_fill.Item = u
again:       frmPEKACT_LINES_fill.NotFirstTime = False
      frmPEKACT_LINES_fill.OnInit
      frmPEKACT_LINES_fill.Show vbModal
      If frmPEKACT_LINES_fill.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKACT_LINES.ItemCount = Item.PEKACT_LINES.Count
        gridPEKACT_LINES.Refresh
        gridPEKACT_LINES.RefreshGroups
        gridPEKACT_LINES.RefreshSort
        gridPEKACT_LINES.MoveToBookmark u.ID & "PEKACT_LINES"
      Else
        Item.PEKACT_LINES.Delete u.ID
        Item.PEKACT_LINES.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKACT_LINESFnd_Click()
  On Error Resume Next
  fndPEKACT_LINES.ShowForm
End Sub
Private Sub cmdPEKACT_LINESRun_Click()
  On Error Resume Next
  gridPEKACT_LINES_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKACT_LINES_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKACT_LINES.LoadRow gridPEKACT_LINES, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKACT_LINES_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKACT_LINES_DblClick()
  cmdPEKACT_LINESEdit_Click
End Sub
Private Sub gridPEKACT_LINES_KeyPress(KeyAscii As Integer)
  If gridPEKACT_LINES.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKACT_LINES.FindOnPress KeyAscii
End Sub

Private Sub gridPEKACT_LINES_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKACT_LINES.Row And LastRow > 0 Then
  gridPEKACT_LINES.GetRowData(LastRow).RowStyle = "Default"
  gridPEKACT_LINES.GetRowData(gridPEKACT_LINES.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKACT_LINESPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKACT_LINES.Add()
    If GetFromBuffer(u) Then
      gridPEKACT_LINES.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKACT_LINES_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKACT_LINESCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKACT_LINES_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKACT_LINES
End If
End Sub
Private Sub mnuPEKACT_LINESAdd_click()
   menuActionPEKACT_LINES = "ADD"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESEdit_click()
   menuActionPEKACT_LINES = "EDIT"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESDelete_click()
   menuActionPEKACT_LINES = "DEL"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESOpen_click()
   menuActionPEKACT_LINES = "RUN"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESRef_click()
   menuActionPEKACT_LINES = "REF"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
  Private Sub mnuPEKACT_LINESCOPY_Click()
    On Error Resume Next
    If gridPEKACT_LINES.ItemCount = 0 Then Exit Sub
    If gridPEKACT_LINES.Row > 0 Then
     If gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKACT_LINES.RowBookmark(gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKACT_LINESCUT_Click()
    On Error Resume Next
    If gridPEKACT_LINES.ItemCount = 0 Then Exit Sub
    If gridPEKACT_LINES.Row > 0 Then
     If gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKACT_LINES.RowBookmark(gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKACT_LINES.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKACT_LINESCHANGE_Click()
  On Error Resume Next
  If gridPEKACT_LINES.ItemCount = 0 Then Exit Sub
  If gridPEKACT_LINES.Row > 0 Then
   If gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKACT_LINES.RowBookmark(gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKACT_LINES.ItemCount = u.Parent.Count
      gridPEKACT_LINES.RefreshRowIndex gridPEKACT_LINES.RowIndex(gridPEKACT_LINES.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKACT_LINESCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKACT_LINESPrn_click()
   menuActionPEKACT_LINES = "PRN"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESCfg_click()
   menuActionPEKACT_LINES = "CFG"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESFind_click()
   menuActionPEKACT_LINES = "FND"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub mnuPEKACT_LINESAcc_click()
   menuActionPEKACT_LINES = "ACC"
   menuTimerPEKACT_LINES.Enabled = True
End Sub
Private Sub menuTimerPEKACT_LINES_timer()
   menuTimerPEKACT_LINES.Enabled = False
   If menuActionPEKACT_LINES = "ADD" Then cmdPEKACT_LINESAdd_Click
   If menuActionPEKACT_LINES = "EDIT" Then cmdPEKACT_LINESEdit_Click
   If menuActionPEKACT_LINES = "DEL" Then cmdPEKACT_LINESDel_Click
   If menuActionPEKACT_LINES = "RUN" Then cmdPEKACT_LINESRun_Click
   If menuActionPEKACT_LINES = "REF" Then cmdPEKACT_LINESRef_Click
   If menuActionPEKACT_LINES = "PRN" Then cmdPEKACT_LINESPrn_Click
   If menuActionPEKACT_LINES = "CFG" Then cmdPEKACT_LINESCfg_Click
   If menuActionPEKACT_LINES = "FND" Then cmdPEKACT_LINESFnd_Click
   If menuActionPEKACT_LINES = "ACC" Then cmdPEKACT_LINESAcc_Click
   menuActionPEKACT_LINES = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKACT_LINESAdd, cmdPEKACT_LINESAdd.Tag
  LoadBtnPictures cmdPEKACT_LINESEdit, cmdPEKACT_LINESEdit.Tag
  LoadBtnPictures cmdPEKACT_LINESDel, cmdPEKACT_LINESDel.Tag
  LoadBtnPictures cmdPEKACT_LINESRef, cmdPEKACT_LINESRef.Tag
  LoadBtnPictures cmdPEKACT_LINESPrn, cmdPEKACT_LINESPrn.Tag
  LoadBtnPictures cmdPEKACT_LINESFnd, cmdPEKACT_LINESFnd.Tag
  LoadBtnPictures cmdPEKACT_LINESRun, cmdPEKACT_LINESRun.Tag
  LoadBtnPictures cmdPEKACT_LINESAcc, cmdPEKACT_LINESAcc.Tag
  LoadBtnPictures cmdPEKACT_LINESCfg, cmdPEKACT_LINESCfg.Tag
  Item.PEKACT_LINES.PrepareGrid gridPEKACT_LINES
  LoadGridLayout gridPEKACT_LINES
  Set fndPEKACT_LINES = Nothing
  On Error Resume Next
  Set fndPEKACT_LINES = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKACT_LINES.Init gridPEKACT_LINES
End Sub
Private Sub OnTabClick()

      gridPEKACT_LINES.Top = 40 * Screen.TwipsPerPixelX
      gridPEKACT_LINES.Left = 5 * Screen.TwipsPerPixelX
      gridPEKACT_LINES.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKACT_LINES.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKACT_LINES.Top = 40 * Screen.TwipsPerPixelX
      gridPEKACT_LINES.Left = 5 * Screen.TwipsPerPixelX
      gridPEKACT_LINES.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKACT_LINES.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKACT_LINES.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKACT_LINES = Nothing
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





