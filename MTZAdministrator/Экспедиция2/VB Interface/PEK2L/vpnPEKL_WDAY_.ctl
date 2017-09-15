VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKL_WDAY_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKL_WDAY 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKL_WDAY 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKL_WDAYAcc 
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
      Begin VB.CommandButton cmdPEKL_WDAYFnd 
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
      Begin VB.CommandButton cmdPEKL_WDAYCfg 
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
      Begin VB.CommandButton cmdPEKL_WDAYPrn 
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
      Begin VB.CommandButton cmdPEKL_WDAYRef 
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
      Begin VB.CommandButton cmdPEKL_WDAYDel 
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
      Begin VB.CommandButton cmdPEKL_WDAYEdit 
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
      Begin VB.CommandButton cmdPEKL_WDAYAdd 
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
      Begin GridEX20.GridEX gridPEKL_WDAY 
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
         Column(1)       =   "vpnPEKL_WDAY_.ctx":0000
         Column(2)       =   "vpnPEKL_WDAY_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKL_WDAY_.ctx":016C
         FormatStyle(2)  =   "vpnPEKL_WDAY_.ctx":02C8
         FormatStyle(3)  =   "vpnPEKL_WDAY_.ctx":0378
         FormatStyle(4)  =   "vpnPEKL_WDAY_.ctx":042C
         FormatStyle(5)  =   "vpnPEKL_WDAY_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKL_WDAY_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKL_WDAYRun 
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
   Begin VB.Menu mnuPopupPEKL_WDAY 
      Caption         =   "Меню для Стандартные лимиты"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKL_WDAYAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKL_WDAYEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKL_WDAYDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuPEKL_WDAYOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKL_WDAYRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKL_WDAYS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKL_WDAYBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKL_WDAYCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKL_WDAYCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKL_WDAYPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKL_WDAYCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKL_WDAYCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKL_WDAYPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKL_WDAYCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKL_WDAYFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKL_WDAYAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKL_WDAY_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKL_WDAY As Object
Private menuActionPEKL_WDAY As String





Private Sub cmdPEKL_WDAYCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKL_WDAY, "gridPEKL_WDAY"
Set jset = Nothing
End Sub

Private Sub cmdPEKL_WDAYPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKL_WDAY, "Стандартные лимиты"
Set jset = Nothing
End Sub

Private Sub cmdPEKL_WDAYRef_Click()
  On Error Resume Next
  Item.PEKL_WDAY.Refresh
  gridPEKL_WDAY.ItemCount = Item.PEKL_WDAY.Count
  gridPEKL_WDAY.Refetch
  gridPEKL_WDAY.Refresh
End Sub
Private Sub cmdPEKL_WDAYAcc_Click()
On Error Resume Next
If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
If gridPEKL_WDAY.Row > 0 Then
 If gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKL_WDAY.RowBookmark(gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKL_WDAYEdit_Click()
  On Error Resume Next
If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
If gridPEKL_WDAY.Row > 0 Then
 If gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKL_WDAY.RowBookmark(gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKL_WDAY_.Item = u
again:     frmPEKL_WDAY_.NotFirstTime = False
    frmPEKL_WDAY_.OnInit
    frmPEKL_WDAY_.Show vbModal
    If frmPEKL_WDAY_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKL_WDAY.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKL_WDAYDel_Click()
  On Error Resume Next
  gridPEKL_WDAY.Delete
End Sub
Private Sub cmdPEKL_WDAYAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKL_WDAY.Add()

      Set frmPEKL_WDAY_.Item = u
again:       frmPEKL_WDAY_.NotFirstTime = False
      frmPEKL_WDAY_.OnInit
      frmPEKL_WDAY_.Show vbModal
      If frmPEKL_WDAY_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKL_WDAY.ItemCount = Item.PEKL_WDAY.Count
        gridPEKL_WDAY.Refresh
        gridPEKL_WDAY.RefreshGroups
        gridPEKL_WDAY.RefreshSort
        gridPEKL_WDAY.MoveToBookmark u.ID & "PEKL_WDAY"
      Else
        Item.PEKL_WDAY.Delete u.ID
        Item.PEKL_WDAY.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKL_WDAYFnd_Click()
  On Error Resume Next
  fndPEKL_WDAY.ShowForm
End Sub
Private Sub cmdPEKL_WDAYRun_Click()
  On Error Resume Next
  gridPEKL_WDAY_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKL_WDAY_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKL_WDAY.LoadRow gridPEKL_WDAY, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKL_WDAY_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("PEKL_WDAY", Left(Bookmark, 38))
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

Private Sub gridPEKL_WDAY_DblClick()
  cmdPEKL_WDAYEdit_Click
End Sub
Private Sub gridPEKL_WDAY_KeyPress(KeyAscii As Integer)
  If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKL_WDAY.FindOnPress KeyAscii
End Sub

Private Sub gridPEKL_WDAY_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKL_WDAY.Row And LastRow > 0 Then
  gridPEKL_WDAY.GetRowData(LastRow).RowStyle = "Default"
  gridPEKL_WDAY.GetRowData(gridPEKL_WDAY.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKL_WDAYPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKL_WDAY.Add()
    If GetFromBuffer(u) Then
      gridPEKL_WDAY.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKL_WDAY_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKL_WDAYCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKL_WDAY_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKL_WDAY
End If
End Sub
Private Sub mnuPEKL_WDAYAdd_click()
   menuActionPEKL_WDAY = "ADD"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYEdit_click()
   menuActionPEKL_WDAY = "EDIT"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYDelete_click()
   menuActionPEKL_WDAY = "DEL"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYOpen_click()
   menuActionPEKL_WDAY = "RUN"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYRef_click()
   menuActionPEKL_WDAY = "REF"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
  Private Sub mnuPEKL_WDAYCOPY_Click()
    On Error Resume Next
    If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
    If gridPEKL_WDAY.Row > 0 Then
     If gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKL_WDAY.RowBookmark(gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKL_WDAYCUT_Click()
    On Error Resume Next
    If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
    If gridPEKL_WDAY.Row > 0 Then
     If gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKL_WDAY.RowBookmark(gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKL_WDAY.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKL_WDAYCHANGE_Click()
  On Error Resume Next
  If gridPEKL_WDAY.ItemCount = 0 Then Exit Sub
  If gridPEKL_WDAY.Row > 0 Then
   If gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKL_WDAY.RowBookmark(gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKL_WDAY.ItemCount = u.Parent.Count
      gridPEKL_WDAY.RefreshRowIndex gridPEKL_WDAY.RowIndex(gridPEKL_WDAY.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKL_WDAYCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKL_WDAYPrn_click()
   menuActionPEKL_WDAY = "PRN"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYCfg_click()
   menuActionPEKL_WDAY = "CFG"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYFind_click()
   menuActionPEKL_WDAY = "FND"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub mnuPEKL_WDAYAcc_click()
   menuActionPEKL_WDAY = "ACC"
   menuTimerPEKL_WDAY.Enabled = True
End Sub
Private Sub menuTimerPEKL_WDAY_timer()
   menuTimerPEKL_WDAY.Enabled = False
   If menuActionPEKL_WDAY = "ADD" Then cmdPEKL_WDAYAdd_Click
   If menuActionPEKL_WDAY = "EDIT" Then cmdPEKL_WDAYEdit_Click
   If menuActionPEKL_WDAY = "DEL" Then cmdPEKL_WDAYDel_Click
   If menuActionPEKL_WDAY = "RUN" Then cmdPEKL_WDAYRun_Click
   If menuActionPEKL_WDAY = "REF" Then cmdPEKL_WDAYRef_Click
   If menuActionPEKL_WDAY = "PRN" Then cmdPEKL_WDAYPrn_Click
   If menuActionPEKL_WDAY = "CFG" Then cmdPEKL_WDAYCfg_Click
   If menuActionPEKL_WDAY = "FND" Then cmdPEKL_WDAYFnd_Click
   If menuActionPEKL_WDAY = "ACC" Then cmdPEKL_WDAYAcc_Click
   menuActionPEKL_WDAY = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKL_WDAYAdd, cmdPEKL_WDAYAdd.Tag
  LoadBtnPictures cmdPEKL_WDAYEdit, cmdPEKL_WDAYEdit.Tag
  LoadBtnPictures cmdPEKL_WDAYDel, cmdPEKL_WDAYDel.Tag
  LoadBtnPictures cmdPEKL_WDAYRef, cmdPEKL_WDAYRef.Tag
  LoadBtnPictures cmdPEKL_WDAYPrn, cmdPEKL_WDAYPrn.Tag
  LoadBtnPictures cmdPEKL_WDAYFnd, cmdPEKL_WDAYFnd.Tag
  LoadBtnPictures cmdPEKL_WDAYRun, cmdPEKL_WDAYRun.Tag
  LoadBtnPictures cmdPEKL_WDAYAcc, cmdPEKL_WDAYAcc.Tag
  LoadBtnPictures cmdPEKL_WDAYCfg, cmdPEKL_WDAYCfg.Tag
  Item.PEKL_WDAY.PrepareGrid gridPEKL_WDAY
  LoadGridLayout gridPEKL_WDAY
  Set fndPEKL_WDAY = Nothing
  On Error Resume Next
  Set fndPEKL_WDAY = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKL_WDAY.Init gridPEKL_WDAY
End Sub
Private Sub OnTabClick()

      gridPEKL_WDAY.Top = 40 * Screen.TwipsPerPixelX
      gridPEKL_WDAY.Left = 5 * Screen.TwipsPerPixelX
      gridPEKL_WDAY.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKL_WDAY.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKL_WDAY.Top = 40 * Screen.TwipsPerPixelX
      gridPEKL_WDAY.Left = 5 * Screen.TwipsPerPixelX
      gridPEKL_WDAY.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKL_WDAY.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKL_WDAY.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKL_WDAY = Nothing
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





