VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKTRF_REGALL_read 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKTRF_REGALL 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKTRF_REGALL 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKTRF_REGALLAcc 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLFnd 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLCfg 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLPrn 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLRef 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLDel 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLEdit 
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
      Begin VB.CommandButton cmdPEKTRF_REGALLAdd 
         Enabled         =   0   'False
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
      Begin GridEX20.GridEX gridPEKTRF_REGALL 
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
         Column(1)       =   "vpnPEKTRF_REGALL_read.ctx":0000
         Column(2)       =   "vpnPEKTRF_REGALL_read.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKTRF_REGALL_read.ctx":016C
         FormatStyle(2)  =   "vpnPEKTRF_REGALL_read.ctx":02C8
         FormatStyle(3)  =   "vpnPEKTRF_REGALL_read.ctx":0378
         FormatStyle(4)  =   "vpnPEKTRF_REGALL_read.ctx":042C
         FormatStyle(5)  =   "vpnPEKTRF_REGALL_read.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKTRF_REGALL_read.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKTRF_REGALLRun 
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
   Begin VB.Menu mnuPopupPEKTRF_REGALL 
      Caption         =   "Меню для Регресс по общему весу"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKTRF_REGALLAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKTRF_REGALLEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKTRF_REGALLDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKTRF_REGALLOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKTRF_REGALLRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKTRF_REGALLS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKTRF_REGALLBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKTRF_REGALLCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKTRF_REGALLCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKTRF_REGALLPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKTRF_REGALLCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKTRF_REGALLCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKTRF_REGALLPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKTRF_REGALLCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKTRF_REGALLFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKTRF_REGALLAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKTRF_REGALL_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKTRF_REGALL As Object
Private menuActionPEKTRF_REGALL As String





Private Sub cmdPEKTRF_REGALLCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKTRF_REGALL, "gridPEKTRF_REGALL"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_REGALLPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKTRF_REGALL, "Регресс по общему весу"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_REGALLRef_Click()
  On Error Resume Next
  Item.PEKTRF_REGALL.Refresh
  gridPEKTRF_REGALL.ItemCount = Item.PEKTRF_REGALL.Count
  gridPEKTRF_REGALL.Refetch
  gridPEKTRF_REGALL.Refresh
End Sub
Private Sub cmdPEKTRF_REGALLAcc_Click()
On Error Resume Next
If gridPEKTRF_REGALL.ItemCount = 0 Then Exit Sub
If gridPEKTRF_REGALL.Row > 0 Then
 If gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_REGALL.RowBookmark(gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKTRF_REGALLEdit_Click()
  On Error Resume Next
If gridPEKTRF_REGALL.ItemCount = 0 Then Exit Sub
If gridPEKTRF_REGALL.Row > 0 Then
 If gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_REGALL.RowBookmark(gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKTRF_REGALL_read.Item = u
again:     frmPEKTRF_REGALL_read.NotFirstTime = False
    frmPEKTRF_REGALL_read.OnInit
    frmPEKTRF_REGALL_read.Show vbModal
    If frmPEKTRF_REGALL_read.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKTRF_REGALL.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKTRF_REGALLDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKTRF_REGALLAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKTRF_REGALLFnd_Click()
  On Error Resume Next
  fndPEKTRF_REGALL.ShowForm
End Sub
Private Sub cmdPEKTRF_REGALLRun_Click()
  On Error Resume Next
  gridPEKTRF_REGALL_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKTRF_REGALL_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKTRF_REGALL.LoadRow gridPEKTRF_REGALL, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKTRF_REGALL_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKTRF_REGALL_DblClick()
  cmdPEKTRF_REGALLEdit_Click
End Sub
Private Sub gridPEKTRF_REGALL_KeyPress(KeyAscii As Integer)
  If gridPEKTRF_REGALL.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKTRF_REGALL.FindOnPress KeyAscii
End Sub

Private Sub gridPEKTRF_REGALL_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKTRF_REGALL.Row And LastRow > 0 Then
  gridPEKTRF_REGALL.GetRowData(LastRow).RowStyle = "Default"
  gridPEKTRF_REGALL.GetRowData(gridPEKTRF_REGALL.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKTRF_REGALLPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKTRF_REGALL.Add()
    If GetFromBuffer(u) Then
      gridPEKTRF_REGALL.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKTRF_REGALL_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKTRF_REGALLCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKTRF_REGALL_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKTRF_REGALL
End If
End Sub
Private Sub mnuPEKTRF_REGALLAdd_click()
   menuActionPEKTRF_REGALL = "ADD"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLEdit_click()
   menuActionPEKTRF_REGALL = "EDIT"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLDelete_click()
   menuActionPEKTRF_REGALL = "DEL"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLOpen_click()
   menuActionPEKTRF_REGALL = "RUN"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLRef_click()
   menuActionPEKTRF_REGALL = "REF"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
  Private Sub mnuPEKTRF_REGALLCOPY_Click()
    On Error Resume Next
    If gridPEKTRF_REGALL.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_REGALL.Row > 0 Then
     If gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_REGALL.RowBookmark(gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKTRF_REGALLCUT_Click()
    On Error Resume Next
    If gridPEKTRF_REGALL.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_REGALL.Row > 0 Then
     If gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_REGALL.RowBookmark(gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKTRF_REGALL.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKTRF_REGALLCHANGE_Click()
  On Error Resume Next
  If gridPEKTRF_REGALL.ItemCount = 0 Then Exit Sub
  If gridPEKTRF_REGALL.Row > 0 Then
   If gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_REGALL.RowBookmark(gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKTRF_REGALL.ItemCount = u.Parent.Count
      gridPEKTRF_REGALL.RefreshRowIndex gridPEKTRF_REGALL.RowIndex(gridPEKTRF_REGALL.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKTRF_REGALLCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKTRF_REGALLPrn_click()
   menuActionPEKTRF_REGALL = "PRN"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLCfg_click()
   menuActionPEKTRF_REGALL = "CFG"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLFind_click()
   menuActionPEKTRF_REGALL = "FND"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub mnuPEKTRF_REGALLAcc_click()
   menuActionPEKTRF_REGALL = "ACC"
   menuTimerPEKTRF_REGALL.Enabled = True
End Sub
Private Sub menuTimerPEKTRF_REGALL_timer()
   menuTimerPEKTRF_REGALL.Enabled = False
   If menuActionPEKTRF_REGALL = "ADD" Then cmdPEKTRF_REGALLAdd_Click
   If menuActionPEKTRF_REGALL = "EDIT" Then cmdPEKTRF_REGALLEdit_Click
   If menuActionPEKTRF_REGALL = "DEL" Then cmdPEKTRF_REGALLDel_Click
   If menuActionPEKTRF_REGALL = "RUN" Then cmdPEKTRF_REGALLRun_Click
   If menuActionPEKTRF_REGALL = "REF" Then cmdPEKTRF_REGALLRef_Click
   If menuActionPEKTRF_REGALL = "PRN" Then cmdPEKTRF_REGALLPrn_Click
   If menuActionPEKTRF_REGALL = "CFG" Then cmdPEKTRF_REGALLCfg_Click
   If menuActionPEKTRF_REGALL = "FND" Then cmdPEKTRF_REGALLFnd_Click
   If menuActionPEKTRF_REGALL = "ACC" Then cmdPEKTRF_REGALLAcc_Click
   menuActionPEKTRF_REGALL = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKTRF_REGALLAdd, cmdPEKTRF_REGALLAdd.Tag
  LoadBtnPictures cmdPEKTRF_REGALLEdit, cmdPEKTRF_REGALLEdit.Tag
  LoadBtnPictures cmdPEKTRF_REGALLDel, cmdPEKTRF_REGALLDel.Tag
  LoadBtnPictures cmdPEKTRF_REGALLRef, cmdPEKTRF_REGALLRef.Tag
  LoadBtnPictures cmdPEKTRF_REGALLPrn, cmdPEKTRF_REGALLPrn.Tag
  LoadBtnPictures cmdPEKTRF_REGALLFnd, cmdPEKTRF_REGALLFnd.Tag
  LoadBtnPictures cmdPEKTRF_REGALLRun, cmdPEKTRF_REGALLRun.Tag
  LoadBtnPictures cmdPEKTRF_REGALLAcc, cmdPEKTRF_REGALLAcc.Tag
  LoadBtnPictures cmdPEKTRF_REGALLCfg, cmdPEKTRF_REGALLCfg.Tag
  Item.PEKTRF_REGALL.PrepareGrid gridPEKTRF_REGALL
  LoadGridLayout gridPEKTRF_REGALL
  Set fndPEKTRF_REGALL = Nothing
  On Error Resume Next
  Set fndPEKTRF_REGALL = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKTRF_REGALL.Init gridPEKTRF_REGALL
End Sub
Private Sub OnTabClick()

      gridPEKTRF_REGALL.Top = 40 * Screen.TwipsPerPixelX
      gridPEKTRF_REGALL.Left = 5 * Screen.TwipsPerPixelX
      gridPEKTRF_REGALL.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKTRF_REGALL.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKTRF_REGALL.Top = 40 * Screen.TwipsPerPixelX
      gridPEKTRF_REGALL.Left = 5 * Screen.TwipsPerPixelX
      gridPEKTRF_REGALL.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKTRF_REGALL.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKTRF_REGALL.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKTRF_REGALL = Nothing
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





