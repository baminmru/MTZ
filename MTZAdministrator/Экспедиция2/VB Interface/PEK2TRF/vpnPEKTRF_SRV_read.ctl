VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKTRF_SRV_read 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKTRF_SRV 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKTRF_SRV 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKTRF_SRVAcc 
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
      Begin VB.CommandButton cmdPEKTRF_SRVFnd 
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
      Begin VB.CommandButton cmdPEKTRF_SRVCfg 
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
      Begin VB.CommandButton cmdPEKTRF_SRVPrn 
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
      Begin VB.CommandButton cmdPEKTRF_SRVRef 
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
      Begin VB.CommandButton cmdPEKTRF_SRVDel 
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
      Begin VB.CommandButton cmdPEKTRF_SRVEdit 
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
      Begin VB.CommandButton cmdPEKTRF_SRVAdd 
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
      Begin GridEX20.GridEX gridPEKTRF_SRV 
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
         Column(1)       =   "vpnPEKTRF_SRV_read.ctx":0000
         Column(2)       =   "vpnPEKTRF_SRV_read.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKTRF_SRV_read.ctx":016C
         FormatStyle(2)  =   "vpnPEKTRF_SRV_read.ctx":02C8
         FormatStyle(3)  =   "vpnPEKTRF_SRV_read.ctx":0378
         FormatStyle(4)  =   "vpnPEKTRF_SRV_read.ctx":042C
         FormatStyle(5)  =   "vpnPEKTRF_SRV_read.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKTRF_SRV_read.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKTRF_SRVRun 
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
   Begin VB.Menu mnuPopupPEKTRF_SRV 
      Caption         =   "Меню для Тарифы на услуги"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKTRF_SRVAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKTRF_SRVEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKTRF_SRVDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKTRF_SRVOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKTRF_SRVRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKTRF_SRVS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKTRF_SRVBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKTRF_SRVCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKTRF_SRVCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKTRF_SRVPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKTRF_SRVCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKTRF_SRVCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKTRF_SRVPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKTRF_SRVCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKTRF_SRVFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKTRF_SRVAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKTRF_SRV_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKTRF_SRV As Object
Private menuActionPEKTRF_SRV As String





Private Sub cmdPEKTRF_SRVCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKTRF_SRV, "gridPEKTRF_SRV"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_SRVPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKTRF_SRV, "Тарифы на услуги"
Set jset = Nothing
End Sub

Private Sub cmdPEKTRF_SRVRef_Click()
  On Error Resume Next
  Item.PEKTRF_SRV.Refresh
  gridPEKTRF_SRV.ItemCount = Item.PEKTRF_SRV.Count
  gridPEKTRF_SRV.Refetch
  gridPEKTRF_SRV.Refresh
End Sub
Private Sub cmdPEKTRF_SRVAcc_Click()
On Error Resume Next
If gridPEKTRF_SRV.ItemCount = 0 Then Exit Sub
If gridPEKTRF_SRV.Row > 0 Then
 If gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_SRV.RowBookmark(gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKTRF_SRVEdit_Click()
  On Error Resume Next
If gridPEKTRF_SRV.ItemCount = 0 Then Exit Sub
If gridPEKTRF_SRV.Row > 0 Then
 If gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_SRV.RowBookmark(gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKTRF_SRV_read.Item = u
again:     frmPEKTRF_SRV_read.NotFirstTime = False
    frmPEKTRF_SRV_read.OnInit
    frmPEKTRF_SRV_read.Show vbModal
    If frmPEKTRF_SRV_read.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKTRF_SRV.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKTRF_SRVDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKTRF_SRVAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKTRF_SRVFnd_Click()
  On Error Resume Next
  fndPEKTRF_SRV.ShowForm
End Sub
Private Sub cmdPEKTRF_SRVRun_Click()
  On Error Resume Next
  gridPEKTRF_SRV_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKTRF_SRV_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKTRF_SRV.LoadRow gridPEKTRF_SRV, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKTRF_SRV_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKTRF_SRV_DblClick()
  cmdPEKTRF_SRVEdit_Click
End Sub
Private Sub gridPEKTRF_SRV_KeyPress(KeyAscii As Integer)
  If gridPEKTRF_SRV.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKTRF_SRV.FindOnPress KeyAscii
End Sub

Private Sub gridPEKTRF_SRV_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKTRF_SRV.Row And LastRow > 0 Then
  gridPEKTRF_SRV.GetRowData(LastRow).RowStyle = "Default"
  gridPEKTRF_SRV.GetRowData(gridPEKTRF_SRV.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKTRF_SRVPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKTRF_SRV.Add()
    If GetFromBuffer(u) Then
      gridPEKTRF_SRV.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKTRF_SRV_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKTRF_SRVCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKTRF_SRV_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKTRF_SRV
End If
End Sub
Private Sub mnuPEKTRF_SRVAdd_click()
   menuActionPEKTRF_SRV = "ADD"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVEdit_click()
   menuActionPEKTRF_SRV = "EDIT"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVDelete_click()
   menuActionPEKTRF_SRV = "DEL"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVOpen_click()
   menuActionPEKTRF_SRV = "RUN"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVRef_click()
   menuActionPEKTRF_SRV = "REF"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
  Private Sub mnuPEKTRF_SRVCOPY_Click()
    On Error Resume Next
    If gridPEKTRF_SRV.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_SRV.Row > 0 Then
     If gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_SRV.RowBookmark(gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKTRF_SRVCUT_Click()
    On Error Resume Next
    If gridPEKTRF_SRV.ItemCount = 0 Then Exit Sub
    If gridPEKTRF_SRV.Row > 0 Then
     If gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKTRF_SRV.RowBookmark(gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKTRF_SRV.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKTRF_SRVCHANGE_Click()
  On Error Resume Next
  If gridPEKTRF_SRV.ItemCount = 0 Then Exit Sub
  If gridPEKTRF_SRV.Row > 0 Then
   If gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKTRF_SRV.RowBookmark(gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKTRF_SRV.ItemCount = u.Parent.Count
      gridPEKTRF_SRV.RefreshRowIndex gridPEKTRF_SRV.RowIndex(gridPEKTRF_SRV.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKTRF_SRVCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKTRF_SRVPrn_click()
   menuActionPEKTRF_SRV = "PRN"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVCfg_click()
   menuActionPEKTRF_SRV = "CFG"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVFind_click()
   menuActionPEKTRF_SRV = "FND"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub mnuPEKTRF_SRVAcc_click()
   menuActionPEKTRF_SRV = "ACC"
   menuTimerPEKTRF_SRV.Enabled = True
End Sub
Private Sub menuTimerPEKTRF_SRV_timer()
   menuTimerPEKTRF_SRV.Enabled = False
   If menuActionPEKTRF_SRV = "ADD" Then cmdPEKTRF_SRVAdd_Click
   If menuActionPEKTRF_SRV = "EDIT" Then cmdPEKTRF_SRVEdit_Click
   If menuActionPEKTRF_SRV = "DEL" Then cmdPEKTRF_SRVDel_Click
   If menuActionPEKTRF_SRV = "RUN" Then cmdPEKTRF_SRVRun_Click
   If menuActionPEKTRF_SRV = "REF" Then cmdPEKTRF_SRVRef_Click
   If menuActionPEKTRF_SRV = "PRN" Then cmdPEKTRF_SRVPrn_Click
   If menuActionPEKTRF_SRV = "CFG" Then cmdPEKTRF_SRVCfg_Click
   If menuActionPEKTRF_SRV = "FND" Then cmdPEKTRF_SRVFnd_Click
   If menuActionPEKTRF_SRV = "ACC" Then cmdPEKTRF_SRVAcc_Click
   menuActionPEKTRF_SRV = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKTRF_SRVAdd, cmdPEKTRF_SRVAdd.Tag
  LoadBtnPictures cmdPEKTRF_SRVEdit, cmdPEKTRF_SRVEdit.Tag
  LoadBtnPictures cmdPEKTRF_SRVDel, cmdPEKTRF_SRVDel.Tag
  LoadBtnPictures cmdPEKTRF_SRVRef, cmdPEKTRF_SRVRef.Tag
  LoadBtnPictures cmdPEKTRF_SRVPrn, cmdPEKTRF_SRVPrn.Tag
  LoadBtnPictures cmdPEKTRF_SRVFnd, cmdPEKTRF_SRVFnd.Tag
  LoadBtnPictures cmdPEKTRF_SRVRun, cmdPEKTRF_SRVRun.Tag
  LoadBtnPictures cmdPEKTRF_SRVAcc, cmdPEKTRF_SRVAcc.Tag
  LoadBtnPictures cmdPEKTRF_SRVCfg, cmdPEKTRF_SRVCfg.Tag
  Item.PEKTRF_SRV.PrepareGrid gridPEKTRF_SRV
  LoadGridLayout gridPEKTRF_SRV
  Set fndPEKTRF_SRV = Nothing
  On Error Resume Next
  Set fndPEKTRF_SRV = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKTRF_SRV.Init gridPEKTRF_SRV
End Sub
Private Sub OnTabClick()

      gridPEKTRF_SRV.Top = 40 * Screen.TwipsPerPixelX
      gridPEKTRF_SRV.Left = 5 * Screen.TwipsPerPixelX
      gridPEKTRF_SRV.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKTRF_SRV.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKTRF_SRV.Top = 40 * Screen.TwipsPerPixelX
      gridPEKTRF_SRV.Left = 5 * Screen.TwipsPerPixelX
      gridPEKTRF_SRV.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKTRF_SRV.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKTRF_SRV.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKTRF_SRV = Nothing
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





