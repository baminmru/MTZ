VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEK103_LINES_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEK103_LINES 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEK103_LINES 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEK103_LINESAcc 
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
      Begin VB.CommandButton cmdPEK103_LINESFnd 
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
      Begin VB.CommandButton cmdPEK103_LINESCfg 
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
      Begin VB.CommandButton cmdPEK103_LINESPrn 
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
      Begin VB.CommandButton cmdPEK103_LINESRef 
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
      Begin VB.CommandButton cmdPEK103_LINESDel 
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
      Begin VB.CommandButton cmdPEK103_LINESEdit 
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
      Begin VB.CommandButton cmdPEK103_LINESAdd 
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
      Begin GridEX20.GridEX gridPEK103_LINES 
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
         Column(1)       =   "vpnPEK103_LINES_main.ctx":0000
         Column(2)       =   "vpnPEK103_LINES_main.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEK103_LINES_main.ctx":016C
         FormatStyle(2)  =   "vpnPEK103_LINES_main.ctx":02C8
         FormatStyle(3)  =   "vpnPEK103_LINES_main.ctx":0378
         FormatStyle(4)  =   "vpnPEK103_LINES_main.ctx":042C
         FormatStyle(5)  =   "vpnPEK103_LINES_main.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEK103_LINES_main.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEK103_LINESRun 
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
   Begin VB.Menu mnuPopupPEK103_LINES 
      Caption         =   "Меню для Cтроки формы"
      Visible         =   0   'False
      Begin VB.Menu mnuPEK103_LINESAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEK103_LINESEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEK103_LINESDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEK103_LINESOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEK103_LINESRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEK103_LINESS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEK103_LINESBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEK103_LINESCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEK103_LINESCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEK103_LINESPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEK103_LINESCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEK103_LINESCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEK103_LINESPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEK103_LINESCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEK103_LINESFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEK103_LINESAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEK103_LINES_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEK103_LINES As Object
Private menuActionPEK103_LINES As String





Private Sub cmdPEK103_LINESCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEK103_LINES, "gridPEK103_LINES"
Set jset = Nothing
End Sub

Private Sub cmdPEK103_LINESPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEK103_LINES, "Cтроки формы"
Set jset = Nothing
End Sub

Private Sub cmdPEK103_LINESRef_Click()
  On Error Resume Next
  Item.PEK103_LINES.Refresh
  gridPEK103_LINES.ItemCount = Item.PEK103_LINES.Count
  gridPEK103_LINES.Refetch
  gridPEK103_LINES.Refresh
End Sub
Private Sub cmdPEK103_LINESAcc_Click()
On Error Resume Next
If gridPEK103_LINES.ItemCount = 0 Then Exit Sub
If gridPEK103_LINES.Row > 0 Then
 If gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEK103_LINES.RowBookmark(gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEK103_LINESEdit_Click()
  On Error Resume Next
If gridPEK103_LINES.ItemCount = 0 Then Exit Sub
If gridPEK103_LINES.Row > 0 Then
 If gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEK103_LINES.RowBookmark(gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEK103_LINES_main.Item = u
again:     frmPEK103_LINES_main.NotFirstTime = False
    frmPEK103_LINES_main.OnInit
    frmPEK103_LINES_main.Show vbModal
    If frmPEK103_LINES_main.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEK103_LINES.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEK103_LINESDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEK103_LINESAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEK103_LINESFnd_Click()
  On Error Resume Next
  fndPEK103_LINES.ShowForm
End Sub
Private Sub cmdPEK103_LINESRun_Click()
  On Error Resume Next
  gridPEK103_LINES_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEK103_LINES_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEK103_LINES.LoadRow gridPEK103_LINES, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEK103_LINES_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEK103_LINES_DblClick()
  cmdPEK103_LINESEdit_Click
End Sub
Private Sub gridPEK103_LINES_KeyPress(KeyAscii As Integer)
  If gridPEK103_LINES.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEK103_LINES.FindOnPress KeyAscii
End Sub

Private Sub gridPEK103_LINES_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEK103_LINES.Row And LastRow > 0 Then
  gridPEK103_LINES.GetRowData(LastRow).RowStyle = "Default"
  gridPEK103_LINES.GetRowData(gridPEK103_LINES.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEK103_LINESPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEK103_LINES.Add()
    If GetFromBuffer(u) Then
      gridPEK103_LINES.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEK103_LINES_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEK103_LINESCfg_Click
        End If
    End If
End Sub

Private Sub gridPEK103_LINES_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEK103_LINES
End If
End Sub
Private Sub mnuPEK103_LINESAdd_click()
   menuActionPEK103_LINES = "ADD"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESEdit_click()
   menuActionPEK103_LINES = "EDIT"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESDelete_click()
   menuActionPEK103_LINES = "DEL"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESOpen_click()
   menuActionPEK103_LINES = "RUN"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESRef_click()
   menuActionPEK103_LINES = "REF"
   menuTimerPEK103_LINES.Enabled = True
End Sub
  Private Sub mnuPEK103_LINESCOPY_Click()
    On Error Resume Next
    If gridPEK103_LINES.ItemCount = 0 Then Exit Sub
    If gridPEK103_LINES.Row > 0 Then
     If gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEK103_LINES.RowBookmark(gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEK103_LINESCUT_Click()
    On Error Resume Next
    If gridPEK103_LINES.ItemCount = 0 Then Exit Sub
    If gridPEK103_LINES.Row > 0 Then
     If gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEK103_LINES.RowBookmark(gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEK103_LINES.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEK103_LINESCHANGE_Click()
  On Error Resume Next
  If gridPEK103_LINES.ItemCount = 0 Then Exit Sub
  If gridPEK103_LINES.Row > 0 Then
   If gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEK103_LINES.RowBookmark(gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEK103_LINES.ItemCount = u.Parent.Count
      gridPEK103_LINES.RefreshRowIndex gridPEK103_LINES.RowIndex(gridPEK103_LINES.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEK103_LINESCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEK103_LINESPrn_click()
   menuActionPEK103_LINES = "PRN"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESCfg_click()
   menuActionPEK103_LINES = "CFG"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESFind_click()
   menuActionPEK103_LINES = "FND"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub mnuPEK103_LINESAcc_click()
   menuActionPEK103_LINES = "ACC"
   menuTimerPEK103_LINES.Enabled = True
End Sub
Private Sub menuTimerPEK103_LINES_timer()
   menuTimerPEK103_LINES.Enabled = False
   If menuActionPEK103_LINES = "ADD" Then cmdPEK103_LINESAdd_Click
   If menuActionPEK103_LINES = "EDIT" Then cmdPEK103_LINESEdit_Click
   If menuActionPEK103_LINES = "DEL" Then cmdPEK103_LINESDel_Click
   If menuActionPEK103_LINES = "RUN" Then cmdPEK103_LINESRun_Click
   If menuActionPEK103_LINES = "REF" Then cmdPEK103_LINESRef_Click
   If menuActionPEK103_LINES = "PRN" Then cmdPEK103_LINESPrn_Click
   If menuActionPEK103_LINES = "CFG" Then cmdPEK103_LINESCfg_Click
   If menuActionPEK103_LINES = "FND" Then cmdPEK103_LINESFnd_Click
   If menuActionPEK103_LINES = "ACC" Then cmdPEK103_LINESAcc_Click
   menuActionPEK103_LINES = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEK103_LINESAdd, cmdPEK103_LINESAdd.Tag
  LoadBtnPictures cmdPEK103_LINESEdit, cmdPEK103_LINESEdit.Tag
  LoadBtnPictures cmdPEK103_LINESDel, cmdPEK103_LINESDel.Tag
  LoadBtnPictures cmdPEK103_LINESRef, cmdPEK103_LINESRef.Tag
  LoadBtnPictures cmdPEK103_LINESPrn, cmdPEK103_LINESPrn.Tag
  LoadBtnPictures cmdPEK103_LINESFnd, cmdPEK103_LINESFnd.Tag
  LoadBtnPictures cmdPEK103_LINESRun, cmdPEK103_LINESRun.Tag
  LoadBtnPictures cmdPEK103_LINESAcc, cmdPEK103_LINESAcc.Tag
  LoadBtnPictures cmdPEK103_LINESCfg, cmdPEK103_LINESCfg.Tag
  Item.PEK103_LINES.PrepareGrid gridPEK103_LINES
  LoadGridLayout gridPEK103_LINES
  Set fndPEK103_LINES = Nothing
  On Error Resume Next
  Set fndPEK103_LINES = CreateObject("MTZ_JSetup.GridFinder")
  fndPEK103_LINES.Init gridPEK103_LINES
End Sub
Private Sub OnTabClick()

      gridPEK103_LINES.Top = 40 * Screen.TwipsPerPixelX
      gridPEK103_LINES.Left = 5 * Screen.TwipsPerPixelX
      gridPEK103_LINES.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEK103_LINES.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEK103_LINES.Top = 40 * Screen.TwipsPerPixelX
      gridPEK103_LINES.Left = 5 * Screen.TwipsPerPixelX
      gridPEK103_LINES.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEK103_LINES.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEK103_LINES.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEK103_LINES = Nothing
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





