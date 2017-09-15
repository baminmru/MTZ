VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRRPT_COSTS_PERS 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRRPT_COSTS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRRPT_COSTS 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRRPT_COSTSAcc 
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
      Begin VB.CommandButton cmdVRRPT_COSTSFnd 
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
      Begin VB.CommandButton cmdVRRPT_COSTSCfg 
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
      Begin VB.CommandButton cmdVRRPT_COSTSPrn 
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
      Begin VB.CommandButton cmdVRRPT_COSTSRef 
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
      Begin VB.CommandButton cmdVRRPT_COSTSDel 
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
      Begin VB.CommandButton cmdVRRPT_COSTSEdit 
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
      Begin VB.CommandButton cmdVRRPT_COSTSAdd 
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
      Begin GridEX20.GridEX gridVRRPT_COSTS 
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
         Column(1)       =   "vpnVRRPT_COSTS_PERS.ctx":0000
         Column(2)       =   "vpnVRRPT_COSTS_PERS.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRRPT_COSTS_PERS.ctx":016C
         FormatStyle(2)  =   "vpnVRRPT_COSTS_PERS.ctx":02C8
         FormatStyle(3)  =   "vpnVRRPT_COSTS_PERS.ctx":0378
         FormatStyle(4)  =   "vpnVRRPT_COSTS_PERS.ctx":042C
         FormatStyle(5)  =   "vpnVRRPT_COSTS_PERS.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRRPT_COSTS_PERS.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRRPT_COSTSRun 
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
   Begin VB.Menu mnuPopupVRRPT_COSTS 
      Caption         =   "Меню для Затраты"
      Visible         =   0   'False
      Begin VB.Menu mnuVRRPT_COSTSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRRPT_COSTSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRRPT_COSTSDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRRPT_COSTSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRRPT_COSTSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRRPT_COSTSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRRPT_COSTSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRRPT_COSTSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRRPT_COSTSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRRPT_COSTSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRRPT_COSTSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRRPT_COSTSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRRPT_COSTSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRRPT_COSTSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRRPT_COSTSFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRRPT_COSTSAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRRPT_COSTS_PERS"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRRPT_COSTS As Object
Private menuActionVRRPT_COSTS As String





Private Sub cmdVRRPT_COSTSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRRPT_COSTS, "gridVRRPT_COSTS"
Set jset = Nothing
End Sub

Private Sub cmdVRRPT_COSTSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRRPT_COSTS, "Затраты"
Set jset = Nothing
End Sub

Private Sub cmdVRRPT_COSTSRef_Click()
  On Error Resume Next
  Item.VRRPT_COSTS.Refresh
  gridVRRPT_COSTS.ItemCount = Item.VRRPT_COSTS.Count
  gridVRRPT_COSTS.Refetch
  gridVRRPT_COSTS.Refresh
End Sub
Private Sub cmdVRRPT_COSTSAcc_Click()
On Error Resume Next
If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
If gridVRRPT_COSTS.Row > 0 Then
 If gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_COSTS.RowBookmark(gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRRPT_COSTSEdit_Click()
  On Error Resume Next
If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
If gridVRRPT_COSTS.Row > 0 Then
 If gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_COSTS.RowBookmark(gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRRPT_COSTS_PERS.Item = u
again:     frmVRRPT_COSTS_PERS.NotFirstTime = False
    frmVRRPT_COSTS_PERS.OnInit
    frmVRRPT_COSTS_PERS.Show vbModal
    If frmVRRPT_COSTS_PERS.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRRPT_COSTS.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRRPT_COSTSDel_Click()
  On Error Resume Next
  gridVRRPT_COSTS.Delete
End Sub
Private Sub cmdVRRPT_COSTSAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRRPT_COSTS.Add()

      Set frmVRRPT_COSTS_PERS.Item = u
again:       frmVRRPT_COSTS_PERS.NotFirstTime = False
      frmVRRPT_COSTS_PERS.OnInit
      frmVRRPT_COSTS_PERS.Show vbModal
      If frmVRRPT_COSTS_PERS.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridVRRPT_COSTS.ItemCount = Item.VRRPT_COSTS.Count
        gridVRRPT_COSTS.Refresh
        gridVRRPT_COSTS.RefreshGroups
        gridVRRPT_COSTS.RefreshSort
        gridVRRPT_COSTS.MoveToBookmark u.ID & "VRRPT_COSTS"
      Else
        Item.VRRPT_COSTS.Delete u.ID
        Item.VRRPT_COSTS.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRRPT_COSTSFnd_Click()
  On Error Resume Next
  fndVRRPT_COSTS.ShowForm
End Sub
Private Sub cmdVRRPT_COSTSRun_Click()
  On Error Resume Next
  gridVRRPT_COSTS_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRRPT_COSTS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRRPT_COSTS.LoadRow gridVRRPT_COSTS, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRRPT_COSTS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("VRRPT_COSTS", Left(Bookmark, 38))
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

Private Sub gridVRRPT_COSTS_DblClick()
  cmdVRRPT_COSTSEdit_Click
End Sub
Private Sub gridVRRPT_COSTS_KeyPress(KeyAscii As Integer)
  If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRRPT_COSTS.FindOnPress KeyAscii
End Sub

Private Sub gridVRRPT_COSTS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRRPT_COSTS.Row And LastRow > 0 Then
  gridVRRPT_COSTS.GetRowData(LastRow).RowStyle = "Default"
  gridVRRPT_COSTS.GetRowData(gridVRRPT_COSTS.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRRPT_COSTSPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRRPT_COSTS.Add()
    If GetFromBuffer(u) Then
      gridVRRPT_COSTS.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRRPT_COSTS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRRPT_COSTSCfg_Click
        End If
    End If
End Sub

Private Sub gridVRRPT_COSTS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRRPT_COSTS
End If
End Sub
Private Sub mnuVRRPT_COSTSAdd_click()
   menuActionVRRPT_COSTS = "ADD"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSEdit_click()
   menuActionVRRPT_COSTS = "EDIT"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSDelete_click()
   menuActionVRRPT_COSTS = "DEL"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSOpen_click()
   menuActionVRRPT_COSTS = "RUN"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSRef_click()
   menuActionVRRPT_COSTS = "REF"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
  Private Sub mnuVRRPT_COSTSCOPY_Click()
    On Error Resume Next
    If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
    If gridVRRPT_COSTS.Row > 0 Then
     If gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRRPT_COSTS.RowBookmark(gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRRPT_COSTSCUT_Click()
    On Error Resume Next
    If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
    If gridVRRPT_COSTS.Row > 0 Then
     If gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRRPT_COSTS.RowBookmark(gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRRPT_COSTS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRRPT_COSTSCHANGE_Click()
  On Error Resume Next
  If gridVRRPT_COSTS.ItemCount = 0 Then Exit Sub
  If gridVRRPT_COSTS.Row > 0 Then
   If gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRRPT_COSTS.RowBookmark(gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRRPT_COSTS.ItemCount = u.Parent.Count
      gridVRRPT_COSTS.RefreshRowIndex gridVRRPT_COSTS.RowIndex(gridVRRPT_COSTS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRRPT_COSTSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRRPT_COSTSPrn_click()
   menuActionVRRPT_COSTS = "PRN"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSCfg_click()
   menuActionVRRPT_COSTS = "CFG"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSFind_click()
   menuActionVRRPT_COSTS = "FND"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub mnuVRRPT_COSTSAcc_click()
   menuActionVRRPT_COSTS = "ACC"
   menuTimerVRRPT_COSTS.Enabled = True
End Sub
Private Sub menuTimerVRRPT_COSTS_timer()
   menuTimerVRRPT_COSTS.Enabled = False
   If menuActionVRRPT_COSTS = "ADD" Then cmdVRRPT_COSTSAdd_Click
   If menuActionVRRPT_COSTS = "EDIT" Then cmdVRRPT_COSTSEdit_Click
   If menuActionVRRPT_COSTS = "DEL" Then cmdVRRPT_COSTSDel_Click
   If menuActionVRRPT_COSTS = "RUN" Then cmdVRRPT_COSTSRun_Click
   If menuActionVRRPT_COSTS = "REF" Then cmdVRRPT_COSTSRef_Click
   If menuActionVRRPT_COSTS = "PRN" Then cmdVRRPT_COSTSPrn_Click
   If menuActionVRRPT_COSTS = "CFG" Then cmdVRRPT_COSTSCfg_Click
   If menuActionVRRPT_COSTS = "FND" Then cmdVRRPT_COSTSFnd_Click
   If menuActionVRRPT_COSTS = "ACC" Then cmdVRRPT_COSTSAcc_Click
   menuActionVRRPT_COSTS = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRRPT_COSTSAdd, cmdVRRPT_COSTSAdd.Tag
  LoadBtnPictures cmdVRRPT_COSTSEdit, cmdVRRPT_COSTSEdit.Tag
  LoadBtnPictures cmdVRRPT_COSTSDel, cmdVRRPT_COSTSDel.Tag
  LoadBtnPictures cmdVRRPT_COSTSRef, cmdVRRPT_COSTSRef.Tag
  LoadBtnPictures cmdVRRPT_COSTSPrn, cmdVRRPT_COSTSPrn.Tag
  LoadBtnPictures cmdVRRPT_COSTSFnd, cmdVRRPT_COSTSFnd.Tag
  LoadBtnPictures cmdVRRPT_COSTSRun, cmdVRRPT_COSTSRun.Tag
  LoadBtnPictures cmdVRRPT_COSTSAcc, cmdVRRPT_COSTSAcc.Tag
  LoadBtnPictures cmdVRRPT_COSTSCfg, cmdVRRPT_COSTSCfg.Tag
  Item.VRRPT_COSTS.PrepareGrid gridVRRPT_COSTS
  LoadGridLayout gridVRRPT_COSTS
  Set fndVRRPT_COSTS = Nothing
  On Error Resume Next
  Set fndVRRPT_COSTS = CreateObject("MTZ_JSetup.GridFinder")
  fndVRRPT_COSTS.Init gridVRRPT_COSTS
End Sub
Private Sub OnTabClick()

      gridVRRPT_COSTS.Top = 40 * Screen.TwipsPerPixelX
      gridVRRPT_COSTS.Left = 5 * Screen.TwipsPerPixelX
      gridVRRPT_COSTS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRRPT_COSTS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRRPT_COSTS.Top = 40 * Screen.TwipsPerPixelX
      gridVRRPT_COSTS.Left = 5 * Screen.TwipsPerPixelX
      gridVRRPT_COSTS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRRPT_COSTS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRRPT_COSTS.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRRPT_COSTS = Nothing
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





