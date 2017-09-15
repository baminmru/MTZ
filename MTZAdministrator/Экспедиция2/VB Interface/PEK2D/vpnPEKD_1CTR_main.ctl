VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKD_1CTR_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKD_1CTR 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKD_1CTR 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKD_1CTRAcc 
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
      Begin VB.CommandButton cmdPEKD_1CTRFnd 
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
      Begin VB.CommandButton cmdPEKD_1CTRCfg 
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
      Begin VB.CommandButton cmdPEKD_1CTRPrn 
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
      Begin VB.CommandButton cmdPEKD_1CTRRef 
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
      Begin VB.CommandButton cmdPEKD_1CTRDel 
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
      Begin VB.CommandButton cmdPEKD_1CTREdit 
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
      Begin VB.CommandButton cmdPEKD_1CTRAdd 
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
      Begin GridEX20.GridEX gridPEKD_1CTR 
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
         Column(1)       =   "vpnPEKD_1CTR_main.ctx":0000
         Column(2)       =   "vpnPEKD_1CTR_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKD_1CTR_main.ctx":016C
         FormatStyle(2)  =   "vpnPEKD_1CTR_main.ctx":02C8
         FormatStyle(3)  =   "vpnPEKD_1CTR_main.ctx":0378
         FormatStyle(4)  =   "vpnPEKD_1CTR_main.ctx":042C
         FormatStyle(5)  =   "vpnPEKD_1CTR_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKD_1CTR_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKD_1CTRRun 
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
   Begin VB.Menu mnuPopupPEKD_1CTR 
      Caption         =   "Меню для Коды основных услуг"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_1CTRAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_1CTREdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_1CTRDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKD_1CTROpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKD_1CTRRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_1CTRS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_1CTRBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_1CTRCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_1CTRCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_1CTRPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_1CTRCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_1CTRCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_1CTRPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKD_1CTRCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKD_1CTRFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKD_1CTRAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKD_1CTR_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKD_1CTR As Object
Private menuActionPEKD_1CTR As String





Private Sub cmdPEKD_1CTRCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKD_1CTR, "gridPEKD_1CTR"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_1CTRPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKD_1CTR, "Коды основных услуг"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_1CTRRef_Click()
  On Error Resume Next
  Item.PEKD_1CTR.Refresh
  gridPEKD_1CTR.ItemCount = Item.PEKD_1CTR.Count
  gridPEKD_1CTR.Refetch
  gridPEKD_1CTR.Refresh
End Sub
Private Sub cmdPEKD_1CTRAcc_Click()
On Error Resume Next
If gridPEKD_1CTR.ItemCount = 0 Then Exit Sub
If gridPEKD_1CTR.Row > 0 Then
 If gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_1CTR.RowBookmark(gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKD_1CTREdit_Click()
  On Error Resume Next
If gridPEKD_1CTR.ItemCount = 0 Then Exit Sub
If gridPEKD_1CTR.Row > 0 Then
 If gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_1CTR.RowBookmark(gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKD_1CTR_main.Item = u
again:     frmPEKD_1CTR_main.NotFirstTime = False
    frmPEKD_1CTR_main.OnInit
    frmPEKD_1CTR_main.Show vbModal
    If frmPEKD_1CTR_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKD_1CTR.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKD_1CTRDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKD_1CTRAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKD_1CTR.Add()

      Set frmPEKD_1CTR_main.Item = u
again:       frmPEKD_1CTR_main.NotFirstTime = False
      frmPEKD_1CTR_main.OnInit
      frmPEKD_1CTR_main.Show vbModal
      If frmPEKD_1CTR_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKD_1CTR.ItemCount = Item.PEKD_1CTR.Count
        gridPEKD_1CTR.Refresh
        gridPEKD_1CTR.RefreshGroups
        gridPEKD_1CTR.RefreshSort
        gridPEKD_1CTR.MoveToBookmark u.ID & "PEKD_1CTR"
      Else
        Item.PEKD_1CTR.Delete u.ID
        Item.PEKD_1CTR.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKD_1CTRFnd_Click()
  On Error Resume Next
  fndPEKD_1CTR.ShowForm
End Sub
Private Sub cmdPEKD_1CTRRun_Click()
  On Error Resume Next
  gridPEKD_1CTR_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKD_1CTR_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKD_1CTR.LoadRow gridPEKD_1CTR, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKD_1CTR_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKD_1CTR_DblClick()
  cmdPEKD_1CTREdit_Click
End Sub
Private Sub gridPEKD_1CTR_KeyPress(KeyAscii As Integer)
  If gridPEKD_1CTR.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKD_1CTR.FindOnPress KeyAscii
End Sub

Private Sub gridPEKD_1CTR_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKD_1CTR.Row And LastRow > 0 Then
  gridPEKD_1CTR.GetRowData(LastRow).RowStyle = "Default"
  gridPEKD_1CTR.GetRowData(gridPEKD_1CTR.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKD_1CTRPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKD_1CTR.Add()
    If GetFromBuffer(u) Then
      gridPEKD_1CTR.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKD_1CTR_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKD_1CTRCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKD_1CTR_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKD_1CTR
End If
End Sub
Private Sub mnuPEKD_1CTRAdd_click()
   menuActionPEKD_1CTR = "ADD"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTREdit_click()
   menuActionPEKD_1CTR = "EDIT"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTRDelete_click()
   menuActionPEKD_1CTR = "DEL"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTROpen_click()
   menuActionPEKD_1CTR = "RUN"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTRRef_click()
   menuActionPEKD_1CTR = "REF"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
  Private Sub mnuPEKD_1CTRCOPY_Click()
    On Error Resume Next
    If gridPEKD_1CTR.ItemCount = 0 Then Exit Sub
    If gridPEKD_1CTR.Row > 0 Then
     If gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_1CTR.RowBookmark(gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKD_1CTRCUT_Click()
    On Error Resume Next
    If gridPEKD_1CTR.ItemCount = 0 Then Exit Sub
    If gridPEKD_1CTR.Row > 0 Then
     If gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_1CTR.RowBookmark(gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKD_1CTR.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKD_1CTRCHANGE_Click()
  On Error Resume Next
  If gridPEKD_1CTR.ItemCount = 0 Then Exit Sub
  If gridPEKD_1CTR.Row > 0 Then
   If gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_1CTR.RowBookmark(gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKD_1CTR.ItemCount = u.Parent.Count
      gridPEKD_1CTR.RefreshRowIndex gridPEKD_1CTR.RowIndex(gridPEKD_1CTR.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKD_1CTRCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_1CTRPrn_click()
   menuActionPEKD_1CTR = "PRN"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTRCfg_click()
   menuActionPEKD_1CTR = "CFG"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTRFind_click()
   menuActionPEKD_1CTR = "FND"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub mnuPEKD_1CTRAcc_click()
   menuActionPEKD_1CTR = "ACC"
   menuTimerPEKD_1CTR.Enabled = True
End Sub
Private Sub menuTimerPEKD_1CTR_timer()
   menuTimerPEKD_1CTR.Enabled = False
   If menuActionPEKD_1CTR = "ADD" Then cmdPEKD_1CTRAdd_Click
   If menuActionPEKD_1CTR = "EDIT" Then cmdPEKD_1CTREdit_Click
   If menuActionPEKD_1CTR = "DEL" Then cmdPEKD_1CTRDel_Click
   If menuActionPEKD_1CTR = "RUN" Then cmdPEKD_1CTRRun_Click
   If menuActionPEKD_1CTR = "REF" Then cmdPEKD_1CTRRef_Click
   If menuActionPEKD_1CTR = "PRN" Then cmdPEKD_1CTRPrn_Click
   If menuActionPEKD_1CTR = "CFG" Then cmdPEKD_1CTRCfg_Click
   If menuActionPEKD_1CTR = "FND" Then cmdPEKD_1CTRFnd_Click
   If menuActionPEKD_1CTR = "ACC" Then cmdPEKD_1CTRAcc_Click
   menuActionPEKD_1CTR = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKD_1CTRAdd, cmdPEKD_1CTRAdd.Tag
  LoadBtnPictures cmdPEKD_1CTREdit, cmdPEKD_1CTREdit.Tag
  LoadBtnPictures cmdPEKD_1CTRDel, cmdPEKD_1CTRDel.Tag
  LoadBtnPictures cmdPEKD_1CTRRef, cmdPEKD_1CTRRef.Tag
  LoadBtnPictures cmdPEKD_1CTRPrn, cmdPEKD_1CTRPrn.Tag
  LoadBtnPictures cmdPEKD_1CTRFnd, cmdPEKD_1CTRFnd.Tag
  LoadBtnPictures cmdPEKD_1CTRRun, cmdPEKD_1CTRRun.Tag
  LoadBtnPictures cmdPEKD_1CTRAcc, cmdPEKD_1CTRAcc.Tag
  LoadBtnPictures cmdPEKD_1CTRCfg, cmdPEKD_1CTRCfg.Tag
  Item.PEKD_1CTR.PrepareGrid gridPEKD_1CTR
  LoadGridLayout gridPEKD_1CTR
  Set fndPEKD_1CTR = Nothing
  On Error Resume Next
  Set fndPEKD_1CTR = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKD_1CTR.Init gridPEKD_1CTR
End Sub
Private Sub OnTabClick()

      gridPEKD_1CTR.Top = 40 * Screen.TwipsPerPixelX
      gridPEKD_1CTR.Left = 5 * Screen.TwipsPerPixelX
      gridPEKD_1CTR.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKD_1CTR.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKD_1CTR.Top = 40 * Screen.TwipsPerPixelX
      gridPEKD_1CTR.Left = 5 * Screen.TwipsPerPixelX
      gridPEKD_1CTR.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKD_1CTR.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKD_1CTR.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKD_1CTR = Nothing
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





