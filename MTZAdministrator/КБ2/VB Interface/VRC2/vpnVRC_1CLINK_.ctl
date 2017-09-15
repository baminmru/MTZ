VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRC_1CLINK_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRC_1CLINK 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRC_1CLINK 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRC_1CLINKAcc 
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
      Begin VB.CommandButton cmdVRC_1CLINKFnd 
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
      Begin VB.CommandButton cmdVRC_1CLINKCfg 
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
      Begin VB.CommandButton cmdVRC_1CLINKPrn 
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
      Begin VB.CommandButton cmdVRC_1CLINKRef 
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
      Begin VB.CommandButton cmdVRC_1CLINKDel 
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
      Begin VB.CommandButton cmdVRC_1CLINKEdit 
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
      Begin VB.CommandButton cmdVRC_1CLINKAdd 
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
      Begin GridEX20.GridEX gridVRC_1CLINK 
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
         Column(1)       =   "vpnVRC_1CLINK_.ctx":0000
         Column(2)       =   "vpnVRC_1CLINK_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRC_1CLINK_.ctx":016C
         FormatStyle(2)  =   "vpnVRC_1CLINK_.ctx":02C8
         FormatStyle(3)  =   "vpnVRC_1CLINK_.ctx":0378
         FormatStyle(4)  =   "vpnVRC_1CLINK_.ctx":042C
         FormatStyle(5)  =   "vpnVRC_1CLINK_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRC_1CLINK_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRC_1CLINKRun 
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
   Begin VB.Menu mnuPopupVRC_1CLINK 
      Caption         =   "Меню для Связь с 1С"
      Visible         =   0   'False
      Begin VB.Menu mnuVRC_1CLINKAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRC_1CLINKEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRC_1CLINKDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRC_1CLINKOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRC_1CLINKRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRC_1CLINKS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRC_1CLINKBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRC_1CLINKCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRC_1CLINKCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRC_1CLINKPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRC_1CLINKCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRC_1CLINKCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRC_1CLINKPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRC_1CLINKCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRC_1CLINKFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRC_1CLINKAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRC_1CLINK_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRC_1CLINK As Object
Private menuActionVRC_1CLINK As String





Private Sub cmdVRC_1CLINKCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRC_1CLINK, "gridVRC_1CLINK"
Set jset = Nothing
End Sub

Private Sub cmdVRC_1CLINKPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRC_1CLINK, "Связь с 1С"
Set jset = Nothing
End Sub

Private Sub cmdVRC_1CLINKRef_Click()
  On Error Resume Next
  item.VRC_1CLINK.Refresh
  gridVRC_1CLINK.ItemCount = item.VRC_1CLINK.Count
  gridVRC_1CLINK.Refetch
  gridVRC_1CLINK.Refresh
End Sub
Private Sub cmdVRC_1CLINKAcc_Click()
On Error Resume Next
If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
If gridVRC_1CLINK.Row > 0 Then
 If gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRC_1CLINK.RowBookmark(gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRC_1CLINKEdit_Click()
  On Error Resume Next
If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
If gridVRC_1CLINK.Row > 0 Then
 If gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRC_1CLINK.RowBookmark(gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRC_1CLINK_.item = u
again:     frmVRC_1CLINK_.NotFirstTime = False
    frmVRC_1CLINK_.OnInit
    frmVRC_1CLINK_.Show vbModal
    If frmVRC_1CLINK_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRC_1CLINK.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRC_1CLINKDel_Click()
  On Error Resume Next
  gridVRC_1CLINK.Delete
End Sub
Private Sub cmdVRC_1CLINKAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = item.VRC_1CLINK.Add()

      Set frmVRC_1CLINK_.item = u
again:       frmVRC_1CLINK_.NotFirstTime = False
      frmVRC_1CLINK_.OnInit
      frmVRC_1CLINK_.Show vbModal
      If frmVRC_1CLINK_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridVRC_1CLINK.ItemCount = item.VRC_1CLINK.Count
        gridVRC_1CLINK.Refresh
        gridVRC_1CLINK.RefreshGroups
        gridVRC_1CLINK.RefreshSort
        gridVRC_1CLINK.MoveToBookmark u.ID & "VRC_1CLINK"
      Else
        item.VRC_1CLINK.Delete u.ID
        item.VRC_1CLINK.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRC_1CLINKFnd_Click()
  On Error Resume Next
  fndVRC_1CLINK.ShowForm
End Sub
Private Sub cmdVRC_1CLINKRun_Click()
  On Error Resume Next
  gridVRC_1CLINK_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRC_1CLINK_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
item.VRC_1CLINK.LoadRow gridVRC_1CLINK, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRC_1CLINK_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = item.FindRowObject("VRC_1CLINK", Left(Bookmark, 38))
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

Private Sub gridVRC_1CLINK_DblClick()
  cmdVRC_1CLINKEdit_Click
End Sub
Private Sub gridVRC_1CLINK_KeyPress(KeyAscii As Integer)
  If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRC_1CLINK.FindOnPress KeyAscii
End Sub

Private Sub gridVRC_1CLINK_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRC_1CLINK.Row And LastRow > 0 Then
  gridVRC_1CLINK.GetRowData(LastRow).RowStyle = "Default"
  gridVRC_1CLINK.GetRowData(gridVRC_1CLINK.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRC_1CLINKPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = item.VRC_1CLINK.Add()
    If GetFromBuffer(u) Then
      gridVRC_1CLINK.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRC_1CLINK_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRC_1CLINKCfg_Click
        End If
    End If
End Sub

Private Sub gridVRC_1CLINK_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRC_1CLINK
End If
End Sub
Private Sub mnuVRC_1CLINKAdd_click()
   menuActionVRC_1CLINK = "ADD"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKEdit_click()
   menuActionVRC_1CLINK = "EDIT"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKDelete_click()
   menuActionVRC_1CLINK = "DEL"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKOpen_click()
   menuActionVRC_1CLINK = "RUN"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKRef_click()
   menuActionVRC_1CLINK = "REF"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
  Private Sub mnuVRC_1CLINKCOPY_Click()
    On Error Resume Next
    If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
    If gridVRC_1CLINK.Row > 0 Then
     If gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRC_1CLINK.RowBookmark(gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRC_1CLINKCUT_Click()
    On Error Resume Next
    If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
    If gridVRC_1CLINK.Row > 0 Then
     If gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRC_1CLINK.RowBookmark(gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row))
        Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRC_1CLINK.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRC_1CLINKCHANGE_Click()
  On Error Resume Next
  If gridVRC_1CLINK.ItemCount = 0 Then Exit Sub
  If gridVRC_1CLINK.Row > 0 Then
   If gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRC_1CLINK.RowBookmark(gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row))
    Set u = item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRC_1CLINK.ItemCount = u.Parent.Count
      gridVRC_1CLINK.RefreshRowIndex gridVRC_1CLINK.RowIndex(gridVRC_1CLINK.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRC_1CLINKCLEAN_Click()
    item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRC_1CLINKPrn_click()
   menuActionVRC_1CLINK = "PRN"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKCfg_click()
   menuActionVRC_1CLINK = "CFG"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKFind_click()
   menuActionVRC_1CLINK = "FND"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub mnuVRC_1CLINKAcc_click()
   menuActionVRC_1CLINK = "ACC"
   menuTimerVRC_1CLINK.Enabled = True
End Sub
Private Sub menuTimerVRC_1CLINK_timer()
   menuTimerVRC_1CLINK.Enabled = False
   If menuActionVRC_1CLINK = "ADD" Then cmdVRC_1CLINKAdd_Click
   If menuActionVRC_1CLINK = "EDIT" Then cmdVRC_1CLINKEdit_Click
   If menuActionVRC_1CLINK = "DEL" Then cmdVRC_1CLINKDel_Click
   If menuActionVRC_1CLINK = "RUN" Then cmdVRC_1CLINKRun_Click
   If menuActionVRC_1CLINK = "REF" Then cmdVRC_1CLINKRef_Click
   If menuActionVRC_1CLINK = "PRN" Then cmdVRC_1CLINKPrn_Click
   If menuActionVRC_1CLINK = "CFG" Then cmdVRC_1CLINKCfg_Click
   If menuActionVRC_1CLINK = "FND" Then cmdVRC_1CLINKFnd_Click
   If menuActionVRC_1CLINK = "ACC" Then cmdVRC_1CLINKAcc_Click
   menuActionVRC_1CLINK = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRC_1CLINKAdd, cmdVRC_1CLINKAdd.Tag
  LoadBtnPictures cmdVRC_1CLINKEdit, cmdVRC_1CLINKEdit.Tag
  LoadBtnPictures cmdVRC_1CLINKDel, cmdVRC_1CLINKDel.Tag
  LoadBtnPictures cmdVRC_1CLINKRef, cmdVRC_1CLINKRef.Tag
  LoadBtnPictures cmdVRC_1CLINKPrn, cmdVRC_1CLINKPrn.Tag
  LoadBtnPictures cmdVRC_1CLINKFnd, cmdVRC_1CLINKFnd.Tag
  LoadBtnPictures cmdVRC_1CLINKRun, cmdVRC_1CLINKRun.Tag
  LoadBtnPictures cmdVRC_1CLINKAcc, cmdVRC_1CLINKAcc.Tag
  LoadBtnPictures cmdVRC_1CLINKCfg, cmdVRC_1CLINKCfg.Tag
  item.VRC_1CLINK.PrepareGrid gridVRC_1CLINK
  LoadGridLayout gridVRC_1CLINK
  Set fndVRC_1CLINK = Nothing
  On Error Resume Next
  Set fndVRC_1CLINK = CreateObject("MTZ_JSetup.GridFinder")
  fndVRC_1CLINK.Init gridVRC_1CLINK
End Sub
Private Sub OnTabClick()

      gridVRC_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridVRC_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridVRC_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRC_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRC_1CLINK.Top = 40 * Screen.TwipsPerPixelX
      gridVRC_1CLINK.Left = 5 * Screen.TwipsPerPixelX
      gridVRC_1CLINK.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRC_1CLINK.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRC_1CLINK.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set item = Nothing
  Set fndVRC_1CLINK = Nothing
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





