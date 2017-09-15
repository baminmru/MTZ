VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnVRCPInterest_ 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerVRCPInterest 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlVRCPInterest 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdVRCPInterestAcc 
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
      Begin VB.CommandButton cmdVRCPInterestFnd 
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
      Begin VB.CommandButton cmdVRCPInterestCfg 
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
      Begin VB.CommandButton cmdVRCPInterestPrn 
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
      Begin VB.CommandButton cmdVRCPInterestRef 
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
      Begin VB.CommandButton cmdVRCPInterestDel 
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
      Begin VB.CommandButton cmdVRCPInterestEdit 
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
      Begin VB.CommandButton cmdVRCPInterestAdd 
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
      Begin GridEX20.GridEX gridVRCPInterest 
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
         Column(1)       =   "vpnVRCPInterest_.ctx":0000
         Column(2)       =   "vpnVRCPInterest_.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnVRCPInterest_.ctx":016C
         FormatStyle(2)  =   "vpnVRCPInterest_.ctx":02C8
         FormatStyle(3)  =   "vpnVRCPInterest_.ctx":0378
         FormatStyle(4)  =   "vpnVRCPInterest_.ctx":042C
         FormatStyle(5)  =   "vpnVRCPInterest_.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnVRCPInterest_.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdVRCPInterestRun 
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
   Begin VB.Menu mnuPopupVRCPInterest 
      Caption         =   "Меню для Увлечения"
      Visible         =   0   'False
      Begin VB.Menu mnuVRCPInterestAdd 
         Caption         =   "Создать"
      End
      Begin VB.Menu mnuVRCPInterestEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuVRCPInterestDelete 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnuVRCPInterestOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuVRCPInterestRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuVRCPInterestS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuVRCPInterestBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuVRCPInterestCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuVRCPInterestCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuVRCPInterestPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuVRCPInterestCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuVRCPInterestCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuVRCPInterestPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuVRCPInterestCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuVRCPInterestFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuVRCPInterestAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnVRCPInterest_"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndVRCPInterest As Object
Private menuActionVRCPInterest As String





Private Sub cmdVRCPInterestCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridVRCPInterest, "gridVRCPInterest"
Set jset = Nothing
End Sub

Private Sub cmdVRCPInterestPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridVRCPInterest, "Увлечения"
Set jset = Nothing
End Sub

Private Sub cmdVRCPInterestRef_Click()
  On Error Resume Next
  Item.VRCPInterest.Refresh
  gridVRCPInterest.ItemCount = Item.VRCPInterest.Count
  gridVRCPInterest.Refetch
  gridVRCPInterest.Refresh
End Sub
Private Sub cmdVRCPInterestAcc_Click()
On Error Resume Next
If gridVRCPInterest.ItemCount = 0 Then Exit Sub
If gridVRCPInterest.Row > 0 Then
 If gridVRCPInterest.RowIndex(gridVRCPInterest.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPInterest.RowBookmark(gridVRCPInterest.RowIndex(gridVRCPInterest.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdVRCPInterestEdit_Click()
  On Error Resume Next
If gridVRCPInterest.ItemCount = 0 Then Exit Sub
If gridVRCPInterest.Row > 0 Then
 If gridVRCPInterest.RowIndex(gridVRCPInterest.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPInterest.RowBookmark(gridVRCPInterest.RowIndex(gridVRCPInterest.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmVRCPInterest_.Item = u
again:     frmVRCPInterest_.NotFirstTime = False
    frmVRCPInterest_.OnInit
    frmVRCPInterest_.Show vbModal
    If frmVRCPInterest_.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridVRCPInterest.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdVRCPInterestDel_Click()
  On Error Resume Next
  gridVRCPInterest.Delete
End Sub
Private Sub cmdVRCPInterestAdd_Click()
  On Error Resume Next
      Dim u As Object
      Set u = Item.VRCPInterest.Add()

      Set frmVRCPInterest_.Item = u
again:       frmVRCPInterest_.NotFirstTime = False
      frmVRCPInterest_.OnInit
      frmVRCPInterest_.Show vbModal
      If frmVRCPInterest_.OK Then
        err.Clear
        u.Save
        If err.Number <> 0 Then
          MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
          GoTo again
        End If
        gridVRCPInterest.ItemCount = Item.VRCPInterest.Count
        gridVRCPInterest.Refresh
        gridVRCPInterest.RefreshGroups
        gridVRCPInterest.RefreshSort
        gridVRCPInterest.MoveToBookmark u.ID & "VRCPInterest"
      Else
        Item.VRCPInterest.Delete u.ID
        Item.VRCPInterest.Remove u.ID
      End If
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdVRCPInterestFnd_Click()
  On Error Resume Next
  fndVRCPInterest.ShowForm
End Sub
Private Sub cmdVRCPInterestRun_Click()
  On Error Resume Next
  gridVRCPInterest_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridVRCPInterest_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.VRCPInterest.LoadRow gridVRCPInterest, RowIndex, Bookmark, Values
End Sub
Private Sub gridVRCPInterest_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
  If gridVRCPInterest.ItemCount = 0 Then Exit Sub
  Dim u As Object
  Set u = Item.FindRowObject("VRCPInterest", Left(Bookmark, 38))
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

Private Sub gridVRCPInterest_DblClick()
  cmdVRCPInterestEdit_Click
End Sub
Private Sub gridVRCPInterest_KeyPress(KeyAscii As Integer)
  If gridVRCPInterest.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndVRCPInterest.FindOnPress KeyAscii
End Sub

Private Sub gridVRCPInterest_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridVRCPInterest.Row And LastRow > 0 Then
  gridVRCPInterest.GetRowData(LastRow).RowStyle = "Default"
  gridVRCPInterest.GetRowData(gridVRCPInterest.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuVRCPInterestPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.VRCPInterest.Add()
    If GetFromBuffer(u) Then
      gridVRCPInterest.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridVRCPInterest_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdVRCPInterestCfg_Click
        End If
    End If
End Sub

Private Sub gridVRCPInterest_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupVRCPInterest
End If
End Sub
Private Sub mnuVRCPInterestAdd_click()
   menuActionVRCPInterest = "ADD"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestEdit_click()
   menuActionVRCPInterest = "EDIT"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestDelete_click()
   menuActionVRCPInterest = "DEL"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestOpen_click()
   menuActionVRCPInterest = "RUN"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestRef_click()
   menuActionVRCPInterest = "REF"
   menuTimerVRCPInterest.Enabled = True
End Sub
  Private Sub mnuVRCPInterestCOPY_Click()
    On Error Resume Next
    If gridVRCPInterest.ItemCount = 0 Then Exit Sub
    If gridVRCPInterest.Row > 0 Then
     If gridVRCPInterest.RowIndex(gridVRCPInterest.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRCPInterest.RowBookmark(gridVRCPInterest.RowIndex(gridVRCPInterest.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuVRCPInterestCUT_Click()
    On Error Resume Next
    If gridVRCPInterest.ItemCount = 0 Then Exit Sub
    If gridVRCPInterest.Row > 0 Then
     If gridVRCPInterest.RowIndex(gridVRCPInterest.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridVRCPInterest.RowBookmark(gridVRCPInterest.RowIndex(gridVRCPInterest.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridVRCPInterest.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuVRCPInterestCHANGE_Click()
  On Error Resume Next
  If gridVRCPInterest.ItemCount = 0 Then Exit Sub
  If gridVRCPInterest.Row > 0 Then
   If gridVRCPInterest.RowIndex(gridVRCPInterest.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridVRCPInterest.RowBookmark(gridVRCPInterest.RowIndex(gridVRCPInterest.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridVRCPInterest.ItemCount = u.Parent.Count
      gridVRCPInterest.RefreshRowIndex gridVRCPInterest.RowIndex(gridVRCPInterest.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuVRCPInterestCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuVRCPInterestPrn_click()
   menuActionVRCPInterest = "PRN"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestCfg_click()
   menuActionVRCPInterest = "CFG"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestFind_click()
   menuActionVRCPInterest = "FND"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub mnuVRCPInterestAcc_click()
   menuActionVRCPInterest = "ACC"
   menuTimerVRCPInterest.Enabled = True
End Sub
Private Sub menuTimerVRCPInterest_timer()
   menuTimerVRCPInterest.Enabled = False
   If menuActionVRCPInterest = "ADD" Then cmdVRCPInterestAdd_Click
   If menuActionVRCPInterest = "EDIT" Then cmdVRCPInterestEdit_Click
   If menuActionVRCPInterest = "DEL" Then cmdVRCPInterestDel_Click
   If menuActionVRCPInterest = "RUN" Then cmdVRCPInterestRun_Click
   If menuActionVRCPInterest = "REF" Then cmdVRCPInterestRef_Click
   If menuActionVRCPInterest = "PRN" Then cmdVRCPInterestPrn_Click
   If menuActionVRCPInterest = "CFG" Then cmdVRCPInterestCfg_Click
   If menuActionVRCPInterest = "FND" Then cmdVRCPInterestFnd_Click
   If menuActionVRCPInterest = "ACC" Then cmdVRCPInterestAcc_Click
   menuActionVRCPInterest = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdVRCPInterestAdd, cmdVRCPInterestAdd.Tag
  LoadBtnPictures cmdVRCPInterestEdit, cmdVRCPInterestEdit.Tag
  LoadBtnPictures cmdVRCPInterestDel, cmdVRCPInterestDel.Tag
  LoadBtnPictures cmdVRCPInterestRef, cmdVRCPInterestRef.Tag
  LoadBtnPictures cmdVRCPInterestPrn, cmdVRCPInterestPrn.Tag
  LoadBtnPictures cmdVRCPInterestFnd, cmdVRCPInterestFnd.Tag
  LoadBtnPictures cmdVRCPInterestRun, cmdVRCPInterestRun.Tag
  LoadBtnPictures cmdVRCPInterestAcc, cmdVRCPInterestAcc.Tag
  LoadBtnPictures cmdVRCPInterestCfg, cmdVRCPInterestCfg.Tag
  Item.VRCPInterest.PrepareGrid gridVRCPInterest
  LoadGridLayout gridVRCPInterest
  Set fndVRCPInterest = Nothing
  On Error Resume Next
  Set fndVRCPInterest = CreateObject("MTZ_JSetup.GridFinder")
  fndVRCPInterest.Init gridVRCPInterest
End Sub
Private Sub OnTabClick()

      gridVRCPInterest.Top = 40 * Screen.TwipsPerPixelX
      gridVRCPInterest.Left = 5 * Screen.TwipsPerPixelX
      gridVRCPInterest.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRCPInterest.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridVRCPInterest.Top = 40 * Screen.TwipsPerPixelX
      gridVRCPInterest.Left = 5 * Screen.TwipsPerPixelX
      gridVRCPInterest.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridVRCPInterest.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlVRCPInterest.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndVRCPInterest = Nothing
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





