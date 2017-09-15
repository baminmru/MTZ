VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKNAL_PZ_read 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKNAL_PZ 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKNAL_PZ 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKNAL_PZAcc 
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
      Begin VB.CommandButton cmdPEKNAL_PZFnd 
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
      Begin VB.CommandButton cmdPEKNAL_PZCfg 
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
      Begin VB.CommandButton cmdPEKNAL_PZPrn 
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
      Begin VB.CommandButton cmdPEKNAL_PZRef 
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
      Begin VB.CommandButton cmdPEKNAL_PZDel 
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
      Begin VB.CommandButton cmdPEKNAL_PZEdit 
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
      Begin VB.CommandButton cmdPEKNAL_PZAdd 
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
      Begin GridEX20.GridEX gridPEKNAL_PZ 
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
         Column(1)       =   "vpnPEKNAL_PZ_read.ctx":0000
         Column(2)       =   "vpnPEKNAL_PZ_read.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKNAL_PZ_read.ctx":016C
         FormatStyle(2)  =   "vpnPEKNAL_PZ_read.ctx":02C8
         FormatStyle(3)  =   "vpnPEKNAL_PZ_read.ctx":0378
         FormatStyle(4)  =   "vpnPEKNAL_PZ_read.ctx":042C
         FormatStyle(5)  =   "vpnPEKNAL_PZ_read.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKNAL_PZ_read.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKNAL_PZRun 
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
   Begin VB.Menu mnuPopupPEKNAL_PZ 
      Caption         =   "Меню для Привязка к заявкам"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKNAL_PZAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKNAL_PZEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKNAL_PZDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKNAL_PZOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKNAL_PZRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKNAL_PZS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKNAL_PZBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKNAL_PZCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKNAL_PZCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKNAL_PZPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKNAL_PZCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKNAL_PZCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKNAL_PZPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKNAL_PZCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKNAL_PZFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKNAL_PZAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKNAL_PZ_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKNAL_PZ As Object
Private menuActionPEKNAL_PZ As String





Private Sub cmdPEKNAL_PZCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKNAL_PZ, "gridPEKNAL_PZ"
Set jset = Nothing
End Sub

Private Sub cmdPEKNAL_PZPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKNAL_PZ, "Привязка к заявкам"
Set jset = Nothing
End Sub

Private Sub cmdPEKNAL_PZRef_Click()
  On Error Resume Next
  Item.PEKNAL_PZ.Refresh
  gridPEKNAL_PZ.ItemCount = Item.PEKNAL_PZ.Count
  gridPEKNAL_PZ.Refetch
  gridPEKNAL_PZ.Refresh
End Sub
Private Sub cmdPEKNAL_PZAcc_Click()
On Error Resume Next
If gridPEKNAL_PZ.ItemCount = 0 Then Exit Sub
If gridPEKNAL_PZ.Row > 0 Then
 If gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_PZ.RowBookmark(gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKNAL_PZEdit_Click()
  On Error Resume Next
If gridPEKNAL_PZ.ItemCount = 0 Then Exit Sub
If gridPEKNAL_PZ.Row > 0 Then
 If gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_PZ.RowBookmark(gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKNAL_PZ_read.Item = u
again:     frmPEKNAL_PZ_read.NotFirstTime = False
    frmPEKNAL_PZ_read.OnInit
    frmPEKNAL_PZ_read.Show vbModal
    If frmPEKNAL_PZ_read.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKNAL_PZ.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKNAL_PZDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKNAL_PZAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKNAL_PZFnd_Click()
  On Error Resume Next
  fndPEKNAL_PZ.ShowForm
End Sub
Private Sub cmdPEKNAL_PZRun_Click()
  On Error Resume Next
  gridPEKNAL_PZ_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKNAL_PZ_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKNAL_PZ.LoadRow gridPEKNAL_PZ, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKNAL_PZ_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKNAL_PZ_DblClick()
  cmdPEKNAL_PZEdit_Click
End Sub
Private Sub gridPEKNAL_PZ_KeyPress(KeyAscii As Integer)
  If gridPEKNAL_PZ.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKNAL_PZ.FindOnPress KeyAscii
End Sub

Private Sub gridPEKNAL_PZ_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKNAL_PZ.Row And LastRow > 0 Then
  gridPEKNAL_PZ.GetRowData(LastRow).RowStyle = "Default"
  gridPEKNAL_PZ.GetRowData(gridPEKNAL_PZ.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKNAL_PZPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKNAL_PZ.Add()
    If GetFromBuffer(u) Then
      gridPEKNAL_PZ.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKNAL_PZ_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKNAL_PZCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKNAL_PZ_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKNAL_PZ
End If
End Sub
Private Sub mnuPEKNAL_PZAdd_click()
   menuActionPEKNAL_PZ = "ADD"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZEdit_click()
   menuActionPEKNAL_PZ = "EDIT"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZDelete_click()
   menuActionPEKNAL_PZ = "DEL"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZOpen_click()
   menuActionPEKNAL_PZ = "RUN"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZRef_click()
   menuActionPEKNAL_PZ = "REF"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
  Private Sub mnuPEKNAL_PZCOPY_Click()
    On Error Resume Next
    If gridPEKNAL_PZ.ItemCount = 0 Then Exit Sub
    If gridPEKNAL_PZ.Row > 0 Then
     If gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKNAL_PZ.RowBookmark(gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKNAL_PZCUT_Click()
    On Error Resume Next
    If gridPEKNAL_PZ.ItemCount = 0 Then Exit Sub
    If gridPEKNAL_PZ.Row > 0 Then
     If gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKNAL_PZ.RowBookmark(gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKNAL_PZ.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKNAL_PZCHANGE_Click()
  On Error Resume Next
  If gridPEKNAL_PZ.ItemCount = 0 Then Exit Sub
  If gridPEKNAL_PZ.Row > 0 Then
   If gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKNAL_PZ.RowBookmark(gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKNAL_PZ.ItemCount = u.Parent.Count
      gridPEKNAL_PZ.RefreshRowIndex gridPEKNAL_PZ.RowIndex(gridPEKNAL_PZ.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKNAL_PZCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKNAL_PZPrn_click()
   menuActionPEKNAL_PZ = "PRN"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZCfg_click()
   menuActionPEKNAL_PZ = "CFG"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZFind_click()
   menuActionPEKNAL_PZ = "FND"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub mnuPEKNAL_PZAcc_click()
   menuActionPEKNAL_PZ = "ACC"
   menuTimerPEKNAL_PZ.Enabled = True
End Sub
Private Sub menuTimerPEKNAL_PZ_timer()
   menuTimerPEKNAL_PZ.Enabled = False
   If menuActionPEKNAL_PZ = "ADD" Then cmdPEKNAL_PZAdd_Click
   If menuActionPEKNAL_PZ = "EDIT" Then cmdPEKNAL_PZEdit_Click
   If menuActionPEKNAL_PZ = "DEL" Then cmdPEKNAL_PZDel_Click
   If menuActionPEKNAL_PZ = "RUN" Then cmdPEKNAL_PZRun_Click
   If menuActionPEKNAL_PZ = "REF" Then cmdPEKNAL_PZRef_Click
   If menuActionPEKNAL_PZ = "PRN" Then cmdPEKNAL_PZPrn_Click
   If menuActionPEKNAL_PZ = "CFG" Then cmdPEKNAL_PZCfg_Click
   If menuActionPEKNAL_PZ = "FND" Then cmdPEKNAL_PZFnd_Click
   If menuActionPEKNAL_PZ = "ACC" Then cmdPEKNAL_PZAcc_Click
   menuActionPEKNAL_PZ = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKNAL_PZAdd, cmdPEKNAL_PZAdd.Tag
  LoadBtnPictures cmdPEKNAL_PZEdit, cmdPEKNAL_PZEdit.Tag
  LoadBtnPictures cmdPEKNAL_PZDel, cmdPEKNAL_PZDel.Tag
  LoadBtnPictures cmdPEKNAL_PZRef, cmdPEKNAL_PZRef.Tag
  LoadBtnPictures cmdPEKNAL_PZPrn, cmdPEKNAL_PZPrn.Tag
  LoadBtnPictures cmdPEKNAL_PZFnd, cmdPEKNAL_PZFnd.Tag
  LoadBtnPictures cmdPEKNAL_PZRun, cmdPEKNAL_PZRun.Tag
  LoadBtnPictures cmdPEKNAL_PZAcc, cmdPEKNAL_PZAcc.Tag
  LoadBtnPictures cmdPEKNAL_PZCfg, cmdPEKNAL_PZCfg.Tag
  Item.PEKNAL_PZ.PrepareGrid gridPEKNAL_PZ
  LoadGridLayout gridPEKNAL_PZ
  Set fndPEKNAL_PZ = Nothing
  On Error Resume Next
  Set fndPEKNAL_PZ = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKNAL_PZ.Init gridPEKNAL_PZ
End Sub
Private Sub OnTabClick()

      gridPEKNAL_PZ.Top = 40 * Screen.TwipsPerPixelX
      gridPEKNAL_PZ.Left = 5 * Screen.TwipsPerPixelX
      gridPEKNAL_PZ.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKNAL_PZ.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKNAL_PZ.Top = 40 * Screen.TwipsPerPixelX
      gridPEKNAL_PZ.Left = 5 * Screen.TwipsPerPixelX
      gridPEKNAL_PZ.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKNAL_PZ.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKNAL_PZ.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKNAL_PZ = Nothing
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





