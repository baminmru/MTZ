VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKZ_ACLCT_done 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKZ_ACLCT 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKZ_ACLCT 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKZ_ACLCTAcc 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTFnd 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTCfg 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTPrn 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTRef 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTDel 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTEdit 
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
      Begin VB.CommandButton cmdPEKZ_ACLCTAdd 
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
      Begin GridEX20.GridEX gridPEKZ_ACLCT 
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
         Column(1)       =   "vpnPEKZ_ACLCT_done.ctx":0000
         Column(2)       =   "vpnPEKZ_ACLCT_done.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKZ_ACLCT_done.ctx":016C
         FormatStyle(2)  =   "vpnPEKZ_ACLCT_done.ctx":02C8
         FormatStyle(3)  =   "vpnPEKZ_ACLCT_done.ctx":0378
         FormatStyle(4)  =   "vpnPEKZ_ACLCT_done.ctx":042C
         FormatStyle(5)  =   "vpnPEKZ_ACLCT_done.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKZ_ACLCT_done.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKZ_ACLCTRun 
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
   Begin VB.Menu mnuPopupPEKZ_ACLCT 
      Caption         =   "Меню для Сбор груза"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKZ_ACLCTAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKZ_ACLCTEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKZ_ACLCTDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKZ_ACLCTOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKZ_ACLCTRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKZ_ACLCTS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKZ_ACLCTBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKZ_ACLCTCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKZ_ACLCTCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKZ_ACLCTPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKZ_ACLCTCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKZ_ACLCTCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKZ_ACLCTPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKZ_ACLCTCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKZ_ACLCTFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKZ_ACLCTAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKZ_ACLCT_done"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKZ_ACLCT As Object
Private menuActionPEKZ_ACLCT As String





Private Sub cmdPEKZ_ACLCTCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKZ_ACLCT, "gridPEKZ_ACLCT"
Set jset = Nothing
End Sub

Private Sub cmdPEKZ_ACLCTPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKZ_ACLCT, "Сбор груза"
Set jset = Nothing
End Sub

Private Sub cmdPEKZ_ACLCTRef_Click()
  On Error Resume Next
  item.PEKZ_ACLCT.Refresh
  gridPEKZ_ACLCT.ItemCount = item.PEKZ_ACLCT.Count
  gridPEKZ_ACLCT.Refetch
  gridPEKZ_ACLCT.Refresh
End Sub
Private Sub cmdPEKZ_ACLCTAcc_Click()
On Error Resume Next
If gridPEKZ_ACLCT.ItemCount = 0 Then Exit Sub
If gridPEKZ_ACLCT.Row > 0 Then
 If gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_ACLCT.RowBookmark(gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKZ_ACLCTEdit_Click()
  On Error Resume Next
If gridPEKZ_ACLCT.ItemCount = 0 Then Exit Sub
If gridPEKZ_ACLCT.Row > 0 Then
 If gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_ACLCT.RowBookmark(gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKZ_ACLCT_done.item = u
again:     frmPEKZ_ACLCT_done.NotFirstTime = False
    frmPEKZ_ACLCT_done.OnInit
    frmPEKZ_ACLCT_done.Show vbModal
    If frmPEKZ_ACLCT_done.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKZ_ACLCT.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKZ_ACLCTDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKZ_ACLCTAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKZ_ACLCTFnd_Click()
  On Error Resume Next
  fndPEKZ_ACLCT.ShowForm
End Sub
Private Sub cmdPEKZ_ACLCTRun_Click()
  On Error Resume Next
  gridPEKZ_ACLCT_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKZ_ACLCT_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.PEKZ_ACLCT.LoadRow gridPEKZ_ACLCT, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKZ_ACLCT_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKZ_ACLCT_DblClick()
  cmdPEKZ_ACLCTEdit_Click
End Sub
Private Sub gridPEKZ_ACLCT_KeyPress(KeyAscii As Integer)
  If gridPEKZ_ACLCT.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKZ_ACLCT.FindOnPress KeyAscii
End Sub

Private Sub gridPEKZ_ACLCT_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKZ_ACLCT.Row And LastRow > 0 Then
  gridPEKZ_ACLCT.GetRowData(LastRow).RowStyle = "Default"
  gridPEKZ_ACLCT.GetRowData(gridPEKZ_ACLCT.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKZ_ACLCTPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.PEKZ_ACLCT.Add()
    If GetFromBuffer(u) Then
      gridPEKZ_ACLCT.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKZ_ACLCT_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKZ_ACLCTCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKZ_ACLCT_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKZ_ACLCT
End If
End Sub
Private Sub mnuPEKZ_ACLCTAdd_click()
   menuActionPEKZ_ACLCT = "ADD"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTEdit_click()
   menuActionPEKZ_ACLCT = "EDIT"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTDelete_click()
   menuActionPEKZ_ACLCT = "DEL"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTOpen_click()
   menuActionPEKZ_ACLCT = "RUN"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTRef_click()
   menuActionPEKZ_ACLCT = "REF"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
  Private Sub mnuPEKZ_ACLCTCOPY_Click()
    On Error Resume Next
    If gridPEKZ_ACLCT.ItemCount = 0 Then Exit Sub
    If gridPEKZ_ACLCT.Row > 0 Then
     If gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKZ_ACLCT.RowBookmark(gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKZ_ACLCTCUT_Click()
    On Error Resume Next
    If gridPEKZ_ACLCT.ItemCount = 0 Then Exit Sub
    If gridPEKZ_ACLCT.Row > 0 Then
     If gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKZ_ACLCT.RowBookmark(gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKZ_ACLCT.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKZ_ACLCTCHANGE_Click()
  On Error Resume Next
  If gridPEKZ_ACLCT.ItemCount = 0 Then Exit Sub
  If gridPEKZ_ACLCT.Row > 0 Then
   If gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKZ_ACLCT.RowBookmark(gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKZ_ACLCT.ItemCount = u.Parent.Count
      gridPEKZ_ACLCT.RefreshRowIndex gridPEKZ_ACLCT.RowIndex(gridPEKZ_ACLCT.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKZ_ACLCTCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKZ_ACLCTPrn_click()
   menuActionPEKZ_ACLCT = "PRN"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTCfg_click()
   menuActionPEKZ_ACLCT = "CFG"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTFind_click()
   menuActionPEKZ_ACLCT = "FND"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub mnuPEKZ_ACLCTAcc_click()
   menuActionPEKZ_ACLCT = "ACC"
   menuTimerPEKZ_ACLCT.Enabled = True
End Sub
Private Sub menuTimerPEKZ_ACLCT_timer()
   menuTimerPEKZ_ACLCT.Enabled = False
   If menuActionPEKZ_ACLCT = "ADD" Then cmdPEKZ_ACLCTAdd_Click
   If menuActionPEKZ_ACLCT = "EDIT" Then cmdPEKZ_ACLCTEdit_Click
   If menuActionPEKZ_ACLCT = "DEL" Then cmdPEKZ_ACLCTDel_Click
   If menuActionPEKZ_ACLCT = "RUN" Then cmdPEKZ_ACLCTRun_Click
   If menuActionPEKZ_ACLCT = "REF" Then cmdPEKZ_ACLCTRef_Click
   If menuActionPEKZ_ACLCT = "PRN" Then cmdPEKZ_ACLCTPrn_Click
   If menuActionPEKZ_ACLCT = "CFG" Then cmdPEKZ_ACLCTCfg_Click
   If menuActionPEKZ_ACLCT = "FND" Then cmdPEKZ_ACLCTFnd_Click
   If menuActionPEKZ_ACLCT = "ACC" Then cmdPEKZ_ACLCTAcc_Click
   menuActionPEKZ_ACLCT = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKZ_ACLCTAdd, cmdPEKZ_ACLCTAdd.Tag
  LoadBtnPictures cmdPEKZ_ACLCTEdit, cmdPEKZ_ACLCTEdit.Tag
  LoadBtnPictures cmdPEKZ_ACLCTDel, cmdPEKZ_ACLCTDel.Tag
  LoadBtnPictures cmdPEKZ_ACLCTRef, cmdPEKZ_ACLCTRef.Tag
  LoadBtnPictures cmdPEKZ_ACLCTPrn, cmdPEKZ_ACLCTPrn.Tag
  LoadBtnPictures cmdPEKZ_ACLCTFnd, cmdPEKZ_ACLCTFnd.Tag
  LoadBtnPictures cmdPEKZ_ACLCTRun, cmdPEKZ_ACLCTRun.Tag
  LoadBtnPictures cmdPEKZ_ACLCTAcc, cmdPEKZ_ACLCTAcc.Tag
  LoadBtnPictures cmdPEKZ_ACLCTCfg, cmdPEKZ_ACLCTCfg.Tag
  item.PEKZ_ACLCT.PrepareGrid gridPEKZ_ACLCT
  LoadGridLayout gridPEKZ_ACLCT
  Set fndPEKZ_ACLCT = Nothing
  On Error Resume Next
  Set fndPEKZ_ACLCT = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKZ_ACLCT.Init gridPEKZ_ACLCT
End Sub
Private Sub OnTabClick()

      gridPEKZ_ACLCT.Top = 40 * Screen.TwipsPerPixelX
      gridPEKZ_ACLCT.Left = 5 * Screen.TwipsPerPixelX
      gridPEKZ_ACLCT.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKZ_ACLCT.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKZ_ACLCT.Top = 40 * Screen.TwipsPerPixelX
      gridPEKZ_ACLCT.Left = 5 * Screen.TwipsPerPixelX
      gridPEKZ_ACLCT.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKZ_ACLCT.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKZ_ACLCT.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndPEKZ_ACLCT = Nothing
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

  RowItem.Person.Secure item.SecureStyleID
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
 Call RowItem.Application.Manager.NewInstance(ID, "PEK2Z", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.pekz_def.Add
 Else
  Set Obj = RowItem.TheDocument.pekz_def.item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub





