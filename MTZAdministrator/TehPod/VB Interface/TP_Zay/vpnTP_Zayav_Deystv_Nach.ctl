VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnTP_Zayav_Deystv_Nach 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerTP_Zayav_Deystv 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlTP_Zayav_Deystv 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdTP_Zayav_DeystvAcc 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvFnd 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvCfg 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvPrn 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvRef 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvDel 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvEdit 
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
      Begin VB.CommandButton cmdTP_Zayav_DeystvAdd 
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
      Begin GridEX20.GridEX gridTP_Zayav_Deystv 
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
         Column(1)       =   "vpnTP_Zayav_Deystv_Nach.ctx":0000
         Column(2)       =   "vpnTP_Zayav_Deystv_Nach.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnTP_Zayav_Deystv_Nach.ctx":016C
         FormatStyle(2)  =   "vpnTP_Zayav_Deystv_Nach.ctx":02C8
         FormatStyle(3)  =   "vpnTP_Zayav_Deystv_Nach.ctx":0378
         FormatStyle(4)  =   "vpnTP_Zayav_Deystv_Nach.ctx":042C
         FormatStyle(5)  =   "vpnTP_Zayav_Deystv_Nach.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnTP_Zayav_Deystv_Nach.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdTP_Zayav_DeystvRun 
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
   Begin VB.Menu mnuPopupTP_Zayav_Deystv 
      Caption         =   "Меню для Действия над заявкой"
      Visible         =   0   'False
      Begin VB.Menu mnuTP_Zayav_DeystvAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuTP_Zayav_DeystvCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuTP_Zayav_DeystvCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuTP_Zayav_DeystvPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuTP_Zayav_DeystvCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuTP_Zayav_DeystvCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuTP_Zayav_DeystvPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuTP_Zayav_DeystvAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnTP_Zayav_Deystv_Nach"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True

Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndTP_Zayav_Deystv As Object
Private menuActionTP_Zayav_Deystv As String





Private Sub cmdTP_Zayav_DeystvCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridTP_Zayav_Deystv, "gridTP_Zayav_Deystv"
Set jset = Nothing
End Sub

Private Sub cmdTP_Zayav_DeystvPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridTP_Zayav_Deystv, "Действия над заявкой"
Set jset = Nothing
End Sub

Private Sub cmdTP_Zayav_DeystvRef_Click()
  On Error Resume Next
  item.TP_Zayav_Deystv.Refresh
  gridTP_Zayav_Deystv.ItemCount = item.TP_Zayav_Deystv.Count
  gridTP_Zayav_Deystv.Refetch
  gridTP_Zayav_Deystv.Refresh
End Sub
Private Sub cmdTP_Zayav_DeystvAcc_Click()
On Error Resume Next
If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
If gridTP_Zayav_Deystv.Row > 0 Then
 If gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTP_Zayav_Deystv.RowBookmark(gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdTP_Zayav_DeystvEdit_Click()
  On Error Resume Next
If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
If gridTP_Zayav_Deystv.Row > 0 Then
 If gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTP_Zayav_Deystv.RowBookmark(gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmTP_Zayav_Deystv_Nach.item = u
again:     frmTP_Zayav_Deystv_Nach.NotFirstTime = False
    frmTP_Zayav_Deystv_Nach.OnInit
    frmTP_Zayav_Deystv_Nach.Show vbModal
    If frmTP_Zayav_Deystv_Nach.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridTP_Zayav_Deystv.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdTP_Zayav_DeystvDel_Click()
  On Error Resume Next
  gridTP_Zayav_Deystv.Delete
End Sub
Private Sub cmdTP_Zayav_DeystvAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.TP_Zayav_Deystv.Add()

      Set frmTP_Zayav_Deystv_Nach.item = u
again:       frmTP_Zayav_Deystv_Nach.NotFirstTime = False
      frmTP_Zayav_Deystv_Nach.OnInit
      frmTP_Zayav_Deystv_Nach.Show vbModal
      If frmTP_Zayav_Deystv_Nach.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridTP_Zayav_Deystv.ItemCount = item.TP_Zayav_Deystv.Count
        gridTP_Zayav_Deystv.Refresh
        gridTP_Zayav_Deystv.RefreshGroups
        gridTP_Zayav_Deystv.RefreshSort
        gridTP_Zayav_Deystv.MoveToBookmark u.ID & "TP_Zayav_Deystv"
      Else
        item.TP_Zayav_Deystv.Delete u.ID
        item.TP_Zayav_Deystv.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdTP_Zayav_DeystvFnd_Click()
  On Error Resume Next
  fndTP_Zayav_Deystv.ShowForm
End Sub
Private Sub cmdTP_Zayav_DeystvRun_Click()
  On Error Resume Next
  gridTP_Zayav_Deystv_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridTP_Zayav_Deystv_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.TP_Zayav_Deystv.LoadRow gridTP_Zayav_Deystv, RowIndex, Bookmark, Values
End Sub
Private Sub gridTP_Zayav_Deystv_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("TP_Zayav_Deystv", Left(Bookmark, 38))
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

Private Sub gridTP_Zayav_Deystv_DblClick()
  cmdTP_Zayav_DeystvEdit_Click
End Sub
Private Sub gridTP_Zayav_Deystv_KeyPress(KeyAscii As Integer)
  If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndTP_Zayav_Deystv.FindOnPress KeyAscii
End Sub

Private Sub gridTP_Zayav_Deystv_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridTP_Zayav_Deystv.Row And LastRow > 0 Then
  gridTP_Zayav_Deystv.GetRowData(LastRow).RowStyle = "Default"
  gridTP_Zayav_Deystv.GetRowData(gridTP_Zayav_Deystv.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuTP_Zayav_DeystvPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.TP_Zayav_Deystv.Add()
    If GetFromBuffer(u) Then
      gridTP_Zayav_Deystv.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridTP_Zayav_Deystv_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdTP_Zayav_DeystvCfg_Click
        End If
    End If
End Sub

Private Sub gridTP_Zayav_Deystv_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupTP_Zayav_Deystv
End If
End Sub
Private Sub mnuTP_Zayav_DeystvAdd_click()
   menuActionTP_Zayav_Deystv = "ADD"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvEdit_click()
   menuActionTP_Zayav_Deystv = "EDIT"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvDelete_click()
   menuActionTP_Zayav_Deystv = "DEL"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvOpen_click()
   menuActionTP_Zayav_Deystv = "RUN"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvRef_click()
   menuActionTP_Zayav_Deystv = "REF"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
  Private Sub mnuTP_Zayav_DeystvCOPY_Click()
    On Error Resume Next
    If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
    If gridTP_Zayav_Deystv.Row > 0 Then
     If gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridTP_Zayav_Deystv.RowBookmark(gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuTP_Zayav_DeystvCUT_Click()
    On Error Resume Next
    If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
    If gridTP_Zayav_Deystv.Row > 0 Then
     If gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridTP_Zayav_Deystv.RowBookmark(gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridTP_Zayav_Deystv.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuTP_Zayav_DeystvCHANGE_Click()
  On Error Resume Next
  If gridTP_Zayav_Deystv.ItemCount = 0 Then Exit Sub
  If gridTP_Zayav_Deystv.Row > 0 Then
   If gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridTP_Zayav_Deystv.RowBookmark(gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridTP_Zayav_Deystv.ItemCount = u.Parent.Count
      gridTP_Zayav_Deystv.RefreshRowIndex gridTP_Zayav_Deystv.RowIndex(gridTP_Zayav_Deystv.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuTP_Zayav_DeystvCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuTP_Zayav_DeystvPrn_click()
   menuActionTP_Zayav_Deystv = "PRN"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvCfg_click()
   menuActionTP_Zayav_Deystv = "CFG"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvFind_click()
   menuActionTP_Zayav_Deystv = "FND"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub mnuTP_Zayav_DeystvAcc_click()
   menuActionTP_Zayav_Deystv = "ACC"
   menuTimerTP_Zayav_Deystv.Enabled = True
End Sub
Private Sub menuTimerTP_Zayav_Deystv_timer()
   menuTimerTP_Zayav_Deystv.Enabled = False
   If menuActionTP_Zayav_Deystv = "ADD" Then cmdTP_Zayav_DeystvAdd_Click
   If menuActionTP_Zayav_Deystv = "EDIT" Then cmdTP_Zayav_DeystvEdit_Click
   If menuActionTP_Zayav_Deystv = "DEL" Then cmdTP_Zayav_DeystvDel_Click
   If menuActionTP_Zayav_Deystv = "RUN" Then cmdTP_Zayav_DeystvRun_Click
   If menuActionTP_Zayav_Deystv = "REF" Then cmdTP_Zayav_DeystvRef_Click
   If menuActionTP_Zayav_Deystv = "PRN" Then cmdTP_Zayav_DeystvPrn_Click
   If menuActionTP_Zayav_Deystv = "CFG" Then cmdTP_Zayav_DeystvCfg_Click
   If menuActionTP_Zayav_Deystv = "FND" Then cmdTP_Zayav_DeystvFnd_Click
   If menuActionTP_Zayav_Deystv = "ACC" Then cmdTP_Zayav_DeystvAcc_Click
   menuActionTP_Zayav_Deystv = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdTP_Zayav_DeystvAdd, cmdTP_Zayav_DeystvAdd.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvEdit, cmdTP_Zayav_DeystvEdit.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvDel, cmdTP_Zayav_DeystvDel.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvRef, cmdTP_Zayav_DeystvRef.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvPrn, cmdTP_Zayav_DeystvPrn.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvFnd, cmdTP_Zayav_DeystvFnd.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvRun, cmdTP_Zayav_DeystvRun.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvAcc, cmdTP_Zayav_DeystvAcc.Tag
  LoadBtnPictures cmdTP_Zayav_DeystvCfg, cmdTP_Zayav_DeystvCfg.Tag
  item.TP_Zayav_Deystv.PrepareGrid gridTP_Zayav_Deystv
  LoadGridLayout gridTP_Zayav_Deystv
  Set fndTP_Zayav_Deystv = Nothing
  On Error Resume Next
  Set fndTP_Zayav_Deystv = CreateObject("MTZ_JSetup.GridFinder")
  fndTP_Zayav_Deystv.Init gridTP_Zayav_Deystv
End Sub
Private Sub OnTabClick()

      gridTP_Zayav_Deystv.Top = 40 * Screen.TwipsPerPixelX
      gridTP_Zayav_Deystv.Left = 5 * Screen.TwipsPerPixelX
      gridTP_Zayav_Deystv.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridTP_Zayav_Deystv.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridTP_Zayav_Deystv.Top = 40 * Screen.TwipsPerPixelX
      gridTP_Zayav_Deystv.Left = 5 * Screen.TwipsPerPixelX
      gridTP_Zayav_Deystv.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridTP_Zayav_Deystv.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlTP_Zayav_Deystv.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndTP_Zayav_Deystv = Nothing
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



'Так же проверяет Square >0
'{53371FFA-B514-447A-A1F9-26EE4FD409C9}
Private Sub Run_VBUpdateObjNamePEO(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save

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
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Проверка наличия коллекции характеристик
'{79E6BDEB-91D5-4B2E-81F7-3E091FB65E3A}
Private Sub Run_VBCheckDescrs(DesPartName As Variant, Optional RowItem As Object)
On Error Resume Next

    On Error Resume Next

    Dim part_col As Variant
    Dim part_item As Object
    Set part_col = CallByName(RowItem.Parent.Parent, DesPartName, VbGet, False)
    Set part_item = part_col.item(1)
    If RowItem.Parent.Count = 1 Then
        If part_item.HasDescrs = -1 Then
            part_item.HasDescrs = 0
        Else
            part_item.HasDescrs = -1
        End If
    End If
    part_item.Save

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
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

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
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'
'{AA4085E6-745B-4A37-8EC4-65D99A653966}
Private Sub Run_VBRemoveSymmetricObjRef(ForwardFieldName As Variant, ObjTypeName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String

    On Error Resume Next
'     On Error GoTo bye

    Dim Obj As Object
    Dim part_col As Variant
    Dim part_item As Object
    Set Obj = CallByName(RowItem, ForwardFieldName, VbGet)
    Set part_col = CallByName(Obj, SymmetricPartName, VbGet, False)
    part_col.Filter = SymmetricFieldName + "='" + RowItem.Application.ID + "'"
'    RowItem.Parent.Remove RowItem.ID
    Set part_item = part_col.item(1)
    part_col.Delete part_item.ID
    Exit Sub
bye:
Resume

End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
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



'Для раздела, в котором есть поле - ссылка, создает/выбирает объект без открытия окна редактирования ссылки
'{A2EEE876-54D8-4AED-B124-775F5DA2D911}
Private Sub Run_VBAddObjByRef(ObjTypeName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
    Dim Mode As String
    Dim ResObject As Object
    On Error Resume Next
    Mode = Mid(TypeName(Me), InStr(TypeName(Me), "_") + 1)
    
'     On Error GoTo bye
    If Len(Mode) = 0 Then
        OK = item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = item.Application.Manager.GetInstanceObject(ID)
    If Obj Is Nothing Then
        OK = False
    End If
    If OK Then
    Dim Coll As New Collection
        Dim part_col As Variant
        Dim part_item As Object
        CallByName RowItem, ForwardFieldName, VbSet, Obj
        Coll.Add TypeName(RowItem) + ":" + RowItem.ID
        RowItem.Save
        If Len(SymmetricPartName) > 0 And Len(SymmetricFieldName) > 0 Then
          Set part_col = CallByName(Obj, SymmetricPartName, VbGet, True)
          Set part_item = part_col.Add
          CallByName part_item, SymmetricFieldName, VbSet, RowItem.Application
          part_item.Save
          Coll.Add SymmetricPartName + ":" + part_item.ID
        End If
        Call item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
    Else
        RowItem.Parent.Remove RowItem.ID
    End If
    Exit Sub
bye:
Resume
End Sub



'
'{5B376AF5-339B-4365-BA80-785E28BCF4DA}
Private Sub Run_VBUpdateSymmetricObjRef(SymmetricFieldName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, ObjTypeName As Variant, Optional RowItem As Object)
On Error Resume Next

 
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
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



'Обновление Имени объекта
'{61393545-ABF7-46F7-82F3-9B7E610DD9C0}
Private Sub Run_VBUpdateObjName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save
End Sub



'Метод создает новый элемент в иерархии Имущественных Комплексов (приложение RealEstate) при создании нового элемента к нему линкуется объект ИК, форма которого и вызывается на редактирование
'{477B8D25-4FF7-491A-A0B0-D3437EC16957}
Private Sub Run_MakeNewFolderEC(FolderID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
 Dim ID As String
 Dim Obj As Object ' EstComplex.Application ' Object
 Dim GObj As Object
 Dim fold As Object 'EstCatalog.Application ' Object
 
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "EstComplex", RowItem.TheName & " " & Date)
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 If Obj.EC_Def.Count = 0 Then
    With Obj.EC_Def.Add
        .TheName = RowItem.TheName
    End With
 Else
    Obj.EC_Def.item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.item(1).TheName
 RowItem.Save
 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание ИК"

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
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





