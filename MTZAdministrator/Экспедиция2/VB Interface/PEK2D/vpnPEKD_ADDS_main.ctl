VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKD_ADDS_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKD_ADDS 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKD_ADDS 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKD_ADDSAcc 
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
      Begin VB.CommandButton cmdPEKD_ADDSFnd 
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
      Begin VB.CommandButton cmdPEKD_ADDSCfg 
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
      Begin VB.CommandButton cmdPEKD_ADDSPrn 
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
      Begin VB.CommandButton cmdPEKD_ADDSRef 
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
      Begin VB.CommandButton cmdPEKD_ADDSDel 
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
      Begin VB.CommandButton cmdPEKD_ADDSEdit 
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
      Begin VB.CommandButton cmdPEKD_ADDSAdd 
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
      Begin GridEX20.GridEX gridPEKD_ADDS 
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
         Column(1)       =   "vpnPEKD_ADDS_main.ctx":0000
         Column(2)       =   "vpnPEKD_ADDS_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKD_ADDS_main.ctx":016C
         FormatStyle(2)  =   "vpnPEKD_ADDS_main.ctx":02C8
         FormatStyle(3)  =   "vpnPEKD_ADDS_main.ctx":0378
         FormatStyle(4)  =   "vpnPEKD_ADDS_main.ctx":042C
         FormatStyle(5)  =   "vpnPEKD_ADDS_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKD_ADDS_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKD_ADDSRun 
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
   Begin VB.Menu mnuPopupPEKD_ADDS 
      Caption         =   "Меню для Надбавки"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKD_ADDSAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuPEKD_ADDSEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKD_ADDSDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKD_ADDSOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKD_ADDSRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKD_ADDSS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKD_ADDSBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKD_ADDSCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKD_ADDSCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKD_ADDSPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKD_ADDSCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKD_ADDSCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKD_ADDSPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKD_ADDSCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKD_ADDSFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKD_ADDSAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKD_ADDS_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKD_ADDS As Object
Private menuActionPEKD_ADDS As String





Private Sub cmdPEKD_ADDSCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKD_ADDS, "gridPEKD_ADDS"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_ADDSPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKD_ADDS, "Надбавки"
Set jset = Nothing
End Sub

Private Sub cmdPEKD_ADDSRef_Click()
  On Error Resume Next
  Item.PEKD_ADDS.Refresh
  gridPEKD_ADDS.ItemCount = Item.PEKD_ADDS.Count
  gridPEKD_ADDS.Refetch
  gridPEKD_ADDS.Refresh
End Sub
Private Sub cmdPEKD_ADDSAcc_Click()
On Error Resume Next
If gridPEKD_ADDS.ItemCount = 0 Then Exit Sub
If gridPEKD_ADDS.Row > 0 Then
 If gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_ADDS.RowBookmark(gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKD_ADDSEdit_Click()
  On Error Resume Next
If gridPEKD_ADDS.ItemCount = 0 Then Exit Sub
If gridPEKD_ADDS.Row > 0 Then
 If gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_ADDS.RowBookmark(gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKD_ADDS_main.Item = u
again:     frmPEKD_ADDS_main.NotFirstTime = False
    frmPEKD_ADDS_main.OnInit
    frmPEKD_ADDS_main.Show vbModal
    If frmPEKD_ADDS_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKD_ADDS.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKD_ADDSDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKD_ADDSAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.PEKD_ADDS.Add()

      Set frmPEKD_ADDS_main.Item = u
again:       frmPEKD_ADDS_main.NotFirstTime = False
      frmPEKD_ADDS_main.OnInit
      frmPEKD_ADDS_main.Show vbModal
      If frmPEKD_ADDS_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridPEKD_ADDS.ItemCount = Item.PEKD_ADDS.Count
        gridPEKD_ADDS.Refresh
        gridPEKD_ADDS.RefreshGroups
        gridPEKD_ADDS.RefreshSort
        gridPEKD_ADDS.MoveToBookmark u.ID & "PEKD_ADDS"
      Else
        Item.PEKD_ADDS.Delete u.ID
        Item.PEKD_ADDS.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKD_ADDSFnd_Click()
  On Error Resume Next
  fndPEKD_ADDS.ShowForm
End Sub
Private Sub cmdPEKD_ADDSRun_Click()
  On Error Resume Next
  gridPEKD_ADDS_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKD_ADDS_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKD_ADDS.LoadRow gridPEKD_ADDS, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKD_ADDS_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKD_ADDS_DblClick()
  cmdPEKD_ADDSEdit_Click
End Sub
Private Sub gridPEKD_ADDS_KeyPress(KeyAscii As Integer)
  If gridPEKD_ADDS.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKD_ADDS.FindOnPress KeyAscii
End Sub

Private Sub gridPEKD_ADDS_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKD_ADDS.Row And LastRow > 0 Then
  gridPEKD_ADDS.GetRowData(LastRow).RowStyle = "Default"
  gridPEKD_ADDS.GetRowData(gridPEKD_ADDS.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKD_ADDSPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKD_ADDS.Add()
    If GetFromBuffer(u) Then
      gridPEKD_ADDS.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKD_ADDS_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKD_ADDSCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKD_ADDS_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKD_ADDS
End If
End Sub
Private Sub mnuPEKD_ADDSAdd_click()
   menuActionPEKD_ADDS = "ADD"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSEdit_click()
   menuActionPEKD_ADDS = "EDIT"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSDelete_click()
   menuActionPEKD_ADDS = "DEL"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSOpen_click()
   menuActionPEKD_ADDS = "RUN"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSRef_click()
   menuActionPEKD_ADDS = "REF"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
  Private Sub mnuPEKD_ADDSCOPY_Click()
    On Error Resume Next
    If gridPEKD_ADDS.ItemCount = 0 Then Exit Sub
    If gridPEKD_ADDS.Row > 0 Then
     If gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_ADDS.RowBookmark(gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKD_ADDSCUT_Click()
    On Error Resume Next
    If gridPEKD_ADDS.ItemCount = 0 Then Exit Sub
    If gridPEKD_ADDS.Row > 0 Then
     If gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKD_ADDS.RowBookmark(gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKD_ADDS.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKD_ADDSCHANGE_Click()
  On Error Resume Next
  If gridPEKD_ADDS.ItemCount = 0 Then Exit Sub
  If gridPEKD_ADDS.Row > 0 Then
   If gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKD_ADDS.RowBookmark(gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKD_ADDS.ItemCount = u.Parent.Count
      gridPEKD_ADDS.RefreshRowIndex gridPEKD_ADDS.RowIndex(gridPEKD_ADDS.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKD_ADDSCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKD_ADDSPrn_click()
   menuActionPEKD_ADDS = "PRN"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSCfg_click()
   menuActionPEKD_ADDS = "CFG"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSFind_click()
   menuActionPEKD_ADDS = "FND"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub mnuPEKD_ADDSAcc_click()
   menuActionPEKD_ADDS = "ACC"
   menuTimerPEKD_ADDS.Enabled = True
End Sub
Private Sub menuTimerPEKD_ADDS_timer()
   menuTimerPEKD_ADDS.Enabled = False
   If menuActionPEKD_ADDS = "ADD" Then cmdPEKD_ADDSAdd_Click
   If menuActionPEKD_ADDS = "EDIT" Then cmdPEKD_ADDSEdit_Click
   If menuActionPEKD_ADDS = "DEL" Then cmdPEKD_ADDSDel_Click
   If menuActionPEKD_ADDS = "RUN" Then cmdPEKD_ADDSRun_Click
   If menuActionPEKD_ADDS = "REF" Then cmdPEKD_ADDSRef_Click
   If menuActionPEKD_ADDS = "PRN" Then cmdPEKD_ADDSPrn_Click
   If menuActionPEKD_ADDS = "CFG" Then cmdPEKD_ADDSCfg_Click
   If menuActionPEKD_ADDS = "FND" Then cmdPEKD_ADDSFnd_Click
   If menuActionPEKD_ADDS = "ACC" Then cmdPEKD_ADDSAcc_Click
   menuActionPEKD_ADDS = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKD_ADDSAdd, cmdPEKD_ADDSAdd.Tag
  LoadBtnPictures cmdPEKD_ADDSEdit, cmdPEKD_ADDSEdit.Tag
  LoadBtnPictures cmdPEKD_ADDSDel, cmdPEKD_ADDSDel.Tag
  LoadBtnPictures cmdPEKD_ADDSRef, cmdPEKD_ADDSRef.Tag
  LoadBtnPictures cmdPEKD_ADDSPrn, cmdPEKD_ADDSPrn.Tag
  LoadBtnPictures cmdPEKD_ADDSFnd, cmdPEKD_ADDSFnd.Tag
  LoadBtnPictures cmdPEKD_ADDSRun, cmdPEKD_ADDSRun.Tag
  LoadBtnPictures cmdPEKD_ADDSAcc, cmdPEKD_ADDSAcc.Tag
  LoadBtnPictures cmdPEKD_ADDSCfg, cmdPEKD_ADDSCfg.Tag
  Item.PEKD_ADDS.PrepareGrid gridPEKD_ADDS
  LoadGridLayout gridPEKD_ADDS
  Set fndPEKD_ADDS = Nothing
  On Error Resume Next
  Set fndPEKD_ADDS = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKD_ADDS.Init gridPEKD_ADDS
End Sub
Private Sub OnTabClick()

      gridPEKD_ADDS.Top = 40 * Screen.TwipsPerPixelX
      gridPEKD_ADDS.Left = 5 * Screen.TwipsPerPixelX
      gridPEKD_ADDS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKD_ADDS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKD_ADDS.Top = 40 * Screen.TwipsPerPixelX
      gridPEKD_ADDS.Left = 5 * Screen.TwipsPerPixelX
      gridPEKD_ADDS.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKD_ADDS.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKD_ADDS.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKD_ADDS = Nothing
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





