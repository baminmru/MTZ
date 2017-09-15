VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnpekmsg_path_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerpekmsg_path 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlpekmsg_path 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdpekmsg_pathAcc 
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
      Begin VB.CommandButton cmdpekmsg_pathFnd 
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
      Begin VB.CommandButton cmdpekmsg_pathCfg 
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
      Begin VB.CommandButton cmdpekmsg_pathPrn 
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
      Begin VB.CommandButton cmdpekmsg_pathRef 
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
      Begin VB.CommandButton cmdpekmsg_pathDel 
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
      Begin VB.CommandButton cmdpekmsg_pathEdit 
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
      Begin VB.CommandButton cmdpekmsg_pathAdd 
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
      Begin GridEX20.GridEX gridpekmsg_path 
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
         Column(1)       =   "vpnpekmsg_path_main.ctx":0000
         Column(2)       =   "vpnpekmsg_path_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnpekmsg_path_main.ctx":016C
         FormatStyle(2)  =   "vpnpekmsg_path_main.ctx":02C8
         FormatStyle(3)  =   "vpnpekmsg_path_main.ctx":0378
         FormatStyle(4)  =   "vpnpekmsg_path_main.ctx":042C
         FormatStyle(5)  =   "vpnpekmsg_path_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnpekmsg_path_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdpekmsg_pathRun 
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
   Begin VB.Menu mnuPopuppekmsg_path 
      Caption         =   "Меню для Ожидаемые грузы"
      Visible         =   0   'False
      Begin VB.Menu mnupekmsg_pathAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnupekmsg_pathEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnupekmsg_pathDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnupekmsg_pathOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnupekmsg_pathRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnupekmsg_pathS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnupekmsg_pathBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnupekmsg_pathCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnupekmsg_pathCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnupekmsg_pathPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnupekmsg_pathCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnupekmsg_pathCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnupekmsg_pathPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnupekmsg_pathCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnupekmsg_pathFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnupekmsg_pathAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnpekmsg_path_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndpekmsg_path As Object
Private menuActionpekmsg_path As String





Private Sub cmdpekmsg_pathCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridpekmsg_path, "gridpekmsg_path"
Set jset = Nothing
End Sub

Private Sub cmdpekmsg_pathPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridpekmsg_path, "Ожидаемые грузы"
Set jset = Nothing
End Sub

Private Sub cmdpekmsg_pathRef_Click()
  On Error Resume Next
  Item.pekmsg_path.Refresh
  gridpekmsg_path.ItemCount = Item.pekmsg_path.Count
  gridpekmsg_path.Refetch
  gridpekmsg_path.Refresh
End Sub
Private Sub cmdpekmsg_pathAcc_Click()
On Error Resume Next
If gridpekmsg_path.ItemCount = 0 Then Exit Sub
If gridpekmsg_path.Row > 0 Then
 If gridpekmsg_path.RowIndex(gridpekmsg_path.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekmsg_path.RowBookmark(gridpekmsg_path.RowIndex(gridpekmsg_path.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdpekmsg_pathEdit_Click()
  On Error Resume Next
If gridpekmsg_path.ItemCount = 0 Then Exit Sub
If gridpekmsg_path.Row > 0 Then
 If gridpekmsg_path.RowIndex(gridpekmsg_path.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekmsg_path.RowBookmark(gridpekmsg_path.RowIndex(gridpekmsg_path.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmpekmsg_path_main.Item = u
again:     frmpekmsg_path_main.NotFirstTime = False
    frmpekmsg_path_main.OnInit
    frmpekmsg_path_main.Show vbModal
    If frmpekmsg_path_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridpekmsg_path.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdpekmsg_pathDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdpekmsg_pathAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.pekmsg_path.Add()
On Error Resume Next
Set u.PathFilial = u.Application.FindRowObject("PEKD_DEPT", GetSetting("MUROMETZ", "PEK", "CurrentFIL", ""))
On Error Resume Next
Set u.TransSupplier = u.Application.FindRowObject("PEKD_DEPT", GetSetting("MUROMETZ", "PEK", "CurrentFIL", "")).supplier
On Error Resume Next
Set u.TheDirection = u.Application.FindRowObject("PEKD_DIRECTION", GetSetting("MUROMETZ", "PEK", "DIRECTION", ""))
Set u.weightedizm = u.Application.FindRowObject("ENTDIC_EDIZM", GetSetting("MUROMETZ", "PEK", "WED"))
Set u.Valueedizm = u.Application.FindRowObject("ENTDIC_EDIZM", GetSetting("MUROMETZ", "PEK", "VED"))

      Set frmpekmsg_path_main.Item = u
again:       frmpekmsg_path_main.NotFirstTime = False
      frmpekmsg_path_main.OnInit
      frmpekmsg_path_main.Show vbModal
      If frmpekmsg_path_main.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridpekmsg_path.ItemCount = Item.pekmsg_path.Count
        gridpekmsg_path.Refresh
        gridpekmsg_path.RefreshGroups
        gridpekmsg_path.RefreshSort
        gridpekmsg_path.MoveToBookmark u.ID & "pekmsg_path"
      Else
        Item.pekmsg_path.Delete u.ID
        Item.pekmsg_path.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdpekmsg_pathFnd_Click()
  On Error Resume Next
  fndpekmsg_path.ShowForm
End Sub
Private Sub cmdpekmsg_pathRun_Click()
  On Error Resume Next
  gridpekmsg_path_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridpekmsg_path_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.pekmsg_path.LoadRow gridpekmsg_path, RowIndex, Bookmark, Values
End Sub
Private Sub gridpekmsg_path_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridpekmsg_path_DblClick()
  cmdpekmsg_pathEdit_Click
End Sub
Private Sub gridpekmsg_path_KeyPress(KeyAscii As Integer)
  If gridpekmsg_path.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndpekmsg_path.FindOnPress KeyAscii
End Sub

Private Sub gridpekmsg_path_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridpekmsg_path.Row And LastRow > 0 Then
  gridpekmsg_path.GetRowData(LastRow).RowStyle = "Default"
  gridpekmsg_path.GetRowData(gridpekmsg_path.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnupekmsg_pathPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.pekmsg_path.Add()
    If GetFromBuffer(u) Then
      gridpekmsg_path.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridpekmsg_path_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdpekmsg_pathCfg_Click
        End If
    End If
End Sub

Private Sub gridpekmsg_path_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopuppekmsg_path
End If
End Sub
Private Sub mnupekmsg_pathAdd_click()
   menuActionpekmsg_path = "ADD"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathEdit_click()
   menuActionpekmsg_path = "EDIT"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathDelete_click()
   menuActionpekmsg_path = "DEL"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathOpen_click()
   menuActionpekmsg_path = "RUN"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathRef_click()
   menuActionpekmsg_path = "REF"
   menuTimerpekmsg_path.Enabled = True
End Sub
  Private Sub mnupekmsg_pathCOPY_Click()
    On Error Resume Next
    If gridpekmsg_path.ItemCount = 0 Then Exit Sub
    If gridpekmsg_path.Row > 0 Then
     If gridpekmsg_path.RowIndex(gridpekmsg_path.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridpekmsg_path.RowBookmark(gridpekmsg_path.RowIndex(gridpekmsg_path.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnupekmsg_pathCUT_Click()
    On Error Resume Next
    If gridpekmsg_path.ItemCount = 0 Then Exit Sub
    If gridpekmsg_path.Row > 0 Then
     If gridpekmsg_path.RowIndex(gridpekmsg_path.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridpekmsg_path.RowBookmark(gridpekmsg_path.RowIndex(gridpekmsg_path.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridpekmsg_path.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnupekmsg_pathCHANGE_Click()
  On Error Resume Next
  If gridpekmsg_path.ItemCount = 0 Then Exit Sub
  If gridpekmsg_path.Row > 0 Then
   If gridpekmsg_path.RowIndex(gridpekmsg_path.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridpekmsg_path.RowBookmark(gridpekmsg_path.RowIndex(gridpekmsg_path.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridpekmsg_path.ItemCount = u.Parent.Count
      gridpekmsg_path.RefreshRowIndex gridpekmsg_path.RowIndex(gridpekmsg_path.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnupekmsg_pathCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnupekmsg_pathPrn_click()
   menuActionpekmsg_path = "PRN"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathCfg_click()
   menuActionpekmsg_path = "CFG"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathFind_click()
   menuActionpekmsg_path = "FND"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub mnupekmsg_pathAcc_click()
   menuActionpekmsg_path = "ACC"
   menuTimerpekmsg_path.Enabled = True
End Sub
Private Sub menuTimerpekmsg_path_timer()
   menuTimerpekmsg_path.Enabled = False
   If menuActionpekmsg_path = "ADD" Then cmdpekmsg_pathAdd_Click
   If menuActionpekmsg_path = "EDIT" Then cmdpekmsg_pathEdit_Click
   If menuActionpekmsg_path = "DEL" Then cmdpekmsg_pathDel_Click
   If menuActionpekmsg_path = "RUN" Then cmdpekmsg_pathRun_Click
   If menuActionpekmsg_path = "REF" Then cmdpekmsg_pathRef_Click
   If menuActionpekmsg_path = "PRN" Then cmdpekmsg_pathPrn_Click
   If menuActionpekmsg_path = "CFG" Then cmdpekmsg_pathCfg_Click
   If menuActionpekmsg_path = "FND" Then cmdpekmsg_pathFnd_Click
   If menuActionpekmsg_path = "ACC" Then cmdpekmsg_pathAcc_Click
   menuActionpekmsg_path = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdpekmsg_pathAdd, cmdpekmsg_pathAdd.Tag
  LoadBtnPictures cmdpekmsg_pathEdit, cmdpekmsg_pathEdit.Tag
  LoadBtnPictures cmdpekmsg_pathDel, cmdpekmsg_pathDel.Tag
  LoadBtnPictures cmdpekmsg_pathRef, cmdpekmsg_pathRef.Tag
  LoadBtnPictures cmdpekmsg_pathPrn, cmdpekmsg_pathPrn.Tag
  LoadBtnPictures cmdpekmsg_pathFnd, cmdpekmsg_pathFnd.Tag
  LoadBtnPictures cmdpekmsg_pathRun, cmdpekmsg_pathRun.Tag
  LoadBtnPictures cmdpekmsg_pathAcc, cmdpekmsg_pathAcc.Tag
  LoadBtnPictures cmdpekmsg_pathCfg, cmdpekmsg_pathCfg.Tag
  Item.pekmsg_path.PrepareGrid gridpekmsg_path
  LoadGridLayout gridpekmsg_path
  Set fndpekmsg_path = Nothing
  On Error Resume Next
  Set fndpekmsg_path = CreateObject("MTZ_JSetup.GridFinder")
  fndpekmsg_path.Init gridpekmsg_path
End Sub
Private Sub OnTabClick()

      gridpekmsg_path.Top = 40 * Screen.TwipsPerPixelX
      gridpekmsg_path.Left = 5 * Screen.TwipsPerPixelX
      gridpekmsg_path.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridpekmsg_path.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridpekmsg_path.Top = 40 * Screen.TwipsPerPixelX
      gridpekmsg_path.Left = 5 * Screen.TwipsPerPixelX
      gridpekmsg_path.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridpekmsg_path.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlpekmsg_path.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndpekmsg_path = Nothing
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





