VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnpekz_dop_read 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerpekz_dop 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlpekz_dop 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdpekz_dopAcc 
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
      Begin VB.CommandButton cmdpekz_dopFnd 
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
      Begin VB.CommandButton cmdpekz_dopCfg 
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
      Begin VB.CommandButton cmdpekz_dopPrn 
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
      Begin VB.CommandButton cmdpekz_dopRef 
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
      Begin VB.CommandButton cmdpekz_dopDel 
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
      Begin VB.CommandButton cmdpekz_dopEdit 
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
      Begin VB.CommandButton cmdpekz_dopAdd 
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
      Begin GridEX20.GridEX gridpekz_dop 
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
         Column(1)       =   "vpnpekz_dop_read.ctx":0000
         Column(2)       =   "vpnpekz_dop_read.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnpekz_dop_read.ctx":016C
         FormatStyle(2)  =   "vpnpekz_dop_read.ctx":02C8
         FormatStyle(3)  =   "vpnpekz_dop_read.ctx":0378
         FormatStyle(4)  =   "vpnpekz_dop_read.ctx":042C
         FormatStyle(5)  =   "vpnpekz_dop_read.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnpekz_dop_read.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdpekz_dopRun 
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
   Begin VB.Menu mnuPopuppekz_dop 
      Caption         =   "Меню для Дополнительные услуги"
      Visible         =   0   'False
      Begin VB.Menu mnupekz_dopAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnupekz_dopEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnupekz_dopDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnupekz_dopOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnupekz_dopRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnupekz_dopS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnupekz_dopBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnupekz_dopCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnupekz_dopCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnupekz_dopPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnupekz_dopCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnupekz_dopCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnupekz_dopPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnupekz_dopCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnupekz_dopFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnupekz_dopAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnpekz_dop_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndpekz_dop As Object
Private menuActionpekz_dop As String





Private Sub cmdpekz_dopCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridpekz_dop, "gridpekz_dop"
Set jset = Nothing
End Sub

Private Sub cmdpekz_dopPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridpekz_dop, "Дополнительные услуги"
Set jset = Nothing
End Sub

Private Sub cmdpekz_dopRef_Click()
  On Error Resume Next
  item.pekz_dop.Refresh
  gridpekz_dop.ItemCount = item.pekz_dop.Count
  gridpekz_dop.Refetch
  gridpekz_dop.Refresh
End Sub
Private Sub cmdpekz_dopAcc_Click()
On Error Resume Next
If gridpekz_dop.ItemCount = 0 Then Exit Sub
If gridpekz_dop.Row > 0 Then
 If gridpekz_dop.RowIndex(gridpekz_dop.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekz_dop.RowBookmark(gridpekz_dop.RowIndex(gridpekz_dop.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdpekz_dopEdit_Click()
  On Error Resume Next
If gridpekz_dop.ItemCount = 0 Then Exit Sub
If gridpekz_dop.Row > 0 Then
 If gridpekz_dop.RowIndex(gridpekz_dop.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekz_dop.RowBookmark(gridpekz_dop.RowIndex(gridpekz_dop.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmpekz_dop_read.item = u
again:     frmpekz_dop_read.NotFirstTime = False
    frmpekz_dop_read.OnInit
    frmpekz_dop_read.Show vbModal
    If frmpekz_dop_read.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridpekz_dop.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdpekz_dopDel_Click()
  On Error Resume Next
  gridpekz_dop.Delete
End Sub
Private Sub cmdpekz_dopAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.pekz_dop.Add()
On Error Resume Next
Set u.PathFilial = u.Application.FindRowObject("PEKD_DEPT", GetSetting("MUROMETZ", "PEK", "CurrentFIL", ""))
Set u.dopsupplier = u.Application.FindRowObject("PEKD_DEPT", GetSetting("MUROMETZ", "PEK", "CurrentFIL", "")).supplier

      Set frmpekz_dop_read.item = u
again:       frmpekz_dop_read.NotFirstTime = False
      frmpekz_dop_read.OnInit
      frmpekz_dop_read.Show vbModal
      If frmpekz_dop_read.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridpekz_dop.ItemCount = item.pekz_dop.Count
        gridpekz_dop.Refresh
        gridpekz_dop.RefreshGroups
        gridpekz_dop.RefreshSort
        gridpekz_dop.MoveToBookmark u.ID & "pekz_dop"
      Else
        item.pekz_dop.Delete u.ID
        item.pekz_dop.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdpekz_dopFnd_Click()
  On Error Resume Next
  fndpekz_dop.ShowForm
End Sub
Private Sub cmdpekz_dopRun_Click()
  On Error Resume Next
  gridpekz_dop_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridpekz_dop_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.pekz_dop.LoadRow gridpekz_dop, RowIndex, Bookmark, Values
End Sub
Private Sub gridpekz_dop_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridpekz_dop.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("pekz_dop", Left(Bookmark, 38))
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

Private Sub gridpekz_dop_DblClick()
  cmdpekz_dopEdit_Click
End Sub
Private Sub gridpekz_dop_KeyPress(KeyAscii As Integer)
  If gridpekz_dop.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndpekz_dop.FindOnPress KeyAscii
End Sub

Private Sub gridpekz_dop_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridpekz_dop.Row And LastRow > 0 Then
  gridpekz_dop.GetRowData(LastRow).RowStyle = "Default"
  gridpekz_dop.GetRowData(gridpekz_dop.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnupekz_dopPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.pekz_dop.Add()
    If GetFromBuffer(u) Then
      gridpekz_dop.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridpekz_dop_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdpekz_dopCfg_Click
        End If
    End If
End Sub

Private Sub gridpekz_dop_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopuppekz_dop
End If
End Sub
Private Sub mnupekz_dopAdd_click()
   menuActionpekz_dop = "ADD"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopEdit_click()
   menuActionpekz_dop = "EDIT"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopDelete_click()
   menuActionpekz_dop = "DEL"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopOpen_click()
   menuActionpekz_dop = "RUN"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopRef_click()
   menuActionpekz_dop = "REF"
   menuTimerpekz_dop.Enabled = True
End Sub
  Private Sub mnupekz_dopCOPY_Click()
    On Error Resume Next
    If gridpekz_dop.ItemCount = 0 Then Exit Sub
    If gridpekz_dop.Row > 0 Then
     If gridpekz_dop.RowIndex(gridpekz_dop.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridpekz_dop.RowBookmark(gridpekz_dop.RowIndex(gridpekz_dop.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnupekz_dopCUT_Click()
    On Error Resume Next
    If gridpekz_dop.ItemCount = 0 Then Exit Sub
    If gridpekz_dop.Row > 0 Then
     If gridpekz_dop.RowIndex(gridpekz_dop.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridpekz_dop.RowBookmark(gridpekz_dop.RowIndex(gridpekz_dop.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridpekz_dop.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnupekz_dopCHANGE_Click()
  On Error Resume Next
  If gridpekz_dop.ItemCount = 0 Then Exit Sub
  If gridpekz_dop.Row > 0 Then
   If gridpekz_dop.RowIndex(gridpekz_dop.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekz_dop.RowBookmark(gridpekz_dop.RowIndex(gridpekz_dop.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridpekz_dop.ItemCount = u.Parent.Count
      gridpekz_dop.RefreshRowIndex gridpekz_dop.RowIndex(gridpekz_dop.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnupekz_dopCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnupekz_dopPrn_click()
   menuActionpekz_dop = "PRN"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopCfg_click()
   menuActionpekz_dop = "CFG"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopFind_click()
   menuActionpekz_dop = "FND"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub mnupekz_dopAcc_click()
   menuActionpekz_dop = "ACC"
   menuTimerpekz_dop.Enabled = True
End Sub
Private Sub menuTimerpekz_dop_timer()
   menuTimerpekz_dop.Enabled = False
   If menuActionpekz_dop = "ADD" Then cmdpekz_dopAdd_Click
   If menuActionpekz_dop = "EDIT" Then cmdpekz_dopEdit_Click
   If menuActionpekz_dop = "DEL" Then cmdpekz_dopDel_Click
   If menuActionpekz_dop = "RUN" Then cmdpekz_dopRun_Click
   If menuActionpekz_dop = "REF" Then cmdpekz_dopRef_Click
   If menuActionpekz_dop = "PRN" Then cmdpekz_dopPrn_Click
   If menuActionpekz_dop = "CFG" Then cmdpekz_dopCfg_Click
   If menuActionpekz_dop = "FND" Then cmdpekz_dopFnd_Click
   If menuActionpekz_dop = "ACC" Then cmdpekz_dopAcc_Click
   menuActionpekz_dop = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdpekz_dopAdd, cmdpekz_dopAdd.Tag
  LoadBtnPictures cmdpekz_dopEdit, cmdpekz_dopEdit.Tag
  LoadBtnPictures cmdpekz_dopDel, cmdpekz_dopDel.Tag
  LoadBtnPictures cmdpekz_dopRef, cmdpekz_dopRef.Tag
  LoadBtnPictures cmdpekz_dopPrn, cmdpekz_dopPrn.Tag
  LoadBtnPictures cmdpekz_dopFnd, cmdpekz_dopFnd.Tag
  LoadBtnPictures cmdpekz_dopRun, cmdpekz_dopRun.Tag
  LoadBtnPictures cmdpekz_dopAcc, cmdpekz_dopAcc.Tag
  LoadBtnPictures cmdpekz_dopCfg, cmdpekz_dopCfg.Tag
  item.pekz_dop.PrepareGrid gridpekz_dop
  LoadGridLayout gridpekz_dop
  Set fndpekz_dop = Nothing
  On Error Resume Next
  Set fndpekz_dop = CreateObject("MTZ_JSetup.GridFinder")
  fndpekz_dop.Init gridpekz_dop
End Sub
Private Sub OnTabClick()

      gridpekz_dop.Top = 40 * Screen.TwipsPerPixelX
      gridpekz_dop.Left = 5 * Screen.TwipsPerPixelX
      gridpekz_dop.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridpekz_dop.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridpekz_dop.Top = 40 * Screen.TwipsPerPixelX
      gridpekz_dop.Left = 5 * Screen.TwipsPerPixelX
      gridpekz_dop.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridpekz_dop.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlpekz_dop.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndpekz_dop = Nothing
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





