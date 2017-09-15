VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKORD_DATA_read 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKORD_DATA 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKORD_DATA 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKORD_DATAAcc 
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
      Begin VB.CommandButton cmdPEKORD_DATAFnd 
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
      Begin VB.CommandButton cmdPEKORD_DATACfg 
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
      Begin VB.CommandButton cmdPEKORD_DATAPrn 
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
      Begin VB.CommandButton cmdPEKORD_DATARef 
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
      Begin VB.CommandButton cmdPEKORD_DATADel 
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
      Begin VB.CommandButton cmdPEKORD_DATAEdit 
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
      Begin VB.CommandButton cmdPEKORD_DATAAdd 
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
      Begin GridEX20.GridEX gridPEKORD_DATA 
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
         Column(1)       =   "vpnPEKORD_DATA_read.ctx":0000
         Column(2)       =   "vpnPEKORD_DATA_read.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKORD_DATA_read.ctx":016C
         FormatStyle(2)  =   "vpnPEKORD_DATA_read.ctx":02C8
         FormatStyle(3)  =   "vpnPEKORD_DATA_read.ctx":0378
         FormatStyle(4)  =   "vpnPEKORD_DATA_read.ctx":042C
         FormatStyle(5)  =   "vpnPEKORD_DATA_read.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKORD_DATA_read.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKORD_DATARun 
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
   Begin VB.Menu mnuPopupPEKORD_DATA 
      Caption         =   "Меню для Таблица тарифов"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKORD_DATAAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKORD_DATAEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKORD_DATADelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKORD_DATAOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKORD_DATARef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKORD_DATAS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKORD_DATABuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKORD_DATACOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKORD_DATACUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKORD_DATAPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKORD_DATACHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKORD_DATACLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKORD_DATAPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKORD_DATACfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKORD_DATAFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKORD_DATAAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKORD_DATA_read"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKORD_DATA As Object
Private menuActionPEKORD_DATA As String





Private Sub cmdPEKORD_DATACfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKORD_DATA, "gridPEKORD_DATA"
Set jset = Nothing
End Sub

Private Sub cmdPEKORD_DATAPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKORD_DATA, "Таблица тарифов"
Set jset = Nothing
End Sub

Private Sub cmdPEKORD_DATARef_Click()
  On Error Resume Next
  Item.PEKORD_DATA.Refresh
  gridPEKORD_DATA.ItemCount = Item.PEKORD_DATA.Count
  gridPEKORD_DATA.Refetch
  gridPEKORD_DATA.Refresh
End Sub
Private Sub cmdPEKORD_DATAAcc_Click()
On Error Resume Next
If gridPEKORD_DATA.ItemCount = 0 Then Exit Sub
If gridPEKORD_DATA.Row > 0 Then
 If gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKORD_DATA.RowBookmark(gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKORD_DATAEdit_Click()
  On Error Resume Next
If gridPEKORD_DATA.ItemCount = 0 Then Exit Sub
If gridPEKORD_DATA.Row > 0 Then
 If gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKORD_DATA.RowBookmark(gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKORD_DATA_read.Item = u
again:     frmPEKORD_DATA_read.NotFirstTime = False
    frmPEKORD_DATA_read.OnInit
    frmPEKORD_DATA_read.Show vbModal
    If frmPEKORD_DATA_read.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKORD_DATA.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKORD_DATADel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKORD_DATAAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKORD_DATAFnd_Click()
  On Error Resume Next
  fndPEKORD_DATA.ShowForm
End Sub
Private Sub cmdPEKORD_DATARun_Click()
  On Error Resume Next
  gridPEKORD_DATA_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKORD_DATA_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKORD_DATA.LoadRow gridPEKORD_DATA, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKORD_DATA_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKORD_DATA_DblClick()
  cmdPEKORD_DATAEdit_Click
End Sub
Private Sub gridPEKORD_DATA_KeyPress(KeyAscii As Integer)
  If gridPEKORD_DATA.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKORD_DATA.FindOnPress KeyAscii
End Sub

Private Sub gridPEKORD_DATA_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKORD_DATA.Row And LastRow > 0 Then
  gridPEKORD_DATA.GetRowData(LastRow).RowStyle = "Default"
  gridPEKORD_DATA.GetRowData(gridPEKORD_DATA.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKORD_DATAPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKORD_DATA.Add()
    If GetFromBuffer(u) Then
      gridPEKORD_DATA.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKORD_DATA_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKORD_DATACfg_Click
        End If
    End If
End Sub

Private Sub gridPEKORD_DATA_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKORD_DATA
End If
End Sub
Private Sub mnuPEKORD_DATAAdd_click()
   menuActionPEKORD_DATA = "ADD"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATAEdit_click()
   menuActionPEKORD_DATA = "EDIT"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATADelete_click()
   menuActionPEKORD_DATA = "DEL"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATAOpen_click()
   menuActionPEKORD_DATA = "RUN"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATARef_click()
   menuActionPEKORD_DATA = "REF"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
  Private Sub mnuPEKORD_DATACOPY_Click()
    On Error Resume Next
    If gridPEKORD_DATA.ItemCount = 0 Then Exit Sub
    If gridPEKORD_DATA.Row > 0 Then
     If gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKORD_DATA.RowBookmark(gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKORD_DATACUT_Click()
    On Error Resume Next
    If gridPEKORD_DATA.ItemCount = 0 Then Exit Sub
    If gridPEKORD_DATA.Row > 0 Then
     If gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKORD_DATA.RowBookmark(gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKORD_DATA.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKORD_DATACHANGE_Click()
  On Error Resume Next
  If gridPEKORD_DATA.ItemCount = 0 Then Exit Sub
  If gridPEKORD_DATA.Row > 0 Then
   If gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKORD_DATA.RowBookmark(gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKORD_DATA.ItemCount = u.Parent.Count
      gridPEKORD_DATA.RefreshRowIndex gridPEKORD_DATA.RowIndex(gridPEKORD_DATA.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKORD_DATACLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKORD_DATAPrn_click()
   menuActionPEKORD_DATA = "PRN"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATACfg_click()
   menuActionPEKORD_DATA = "CFG"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATAFind_click()
   menuActionPEKORD_DATA = "FND"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub mnuPEKORD_DATAAcc_click()
   menuActionPEKORD_DATA = "ACC"
   menuTimerPEKORD_DATA.Enabled = True
End Sub
Private Sub menuTimerPEKORD_DATA_timer()
   menuTimerPEKORD_DATA.Enabled = False
   If menuActionPEKORD_DATA = "ADD" Then cmdPEKORD_DATAAdd_Click
   If menuActionPEKORD_DATA = "EDIT" Then cmdPEKORD_DATAEdit_Click
   If menuActionPEKORD_DATA = "DEL" Then cmdPEKORD_DATADel_Click
   If menuActionPEKORD_DATA = "RUN" Then cmdPEKORD_DATARun_Click
   If menuActionPEKORD_DATA = "REF" Then cmdPEKORD_DATARef_Click
   If menuActionPEKORD_DATA = "PRN" Then cmdPEKORD_DATAPrn_Click
   If menuActionPEKORD_DATA = "CFG" Then cmdPEKORD_DATACfg_Click
   If menuActionPEKORD_DATA = "FND" Then cmdPEKORD_DATAFnd_Click
   If menuActionPEKORD_DATA = "ACC" Then cmdPEKORD_DATAAcc_Click
   menuActionPEKORD_DATA = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKORD_DATAAdd, cmdPEKORD_DATAAdd.Tag
  LoadBtnPictures cmdPEKORD_DATAEdit, cmdPEKORD_DATAEdit.Tag
  LoadBtnPictures cmdPEKORD_DATADel, cmdPEKORD_DATADel.Tag
  LoadBtnPictures cmdPEKORD_DATARef, cmdPEKORD_DATARef.Tag
  LoadBtnPictures cmdPEKORD_DATAPrn, cmdPEKORD_DATAPrn.Tag
  LoadBtnPictures cmdPEKORD_DATAFnd, cmdPEKORD_DATAFnd.Tag
  LoadBtnPictures cmdPEKORD_DATARun, cmdPEKORD_DATARun.Tag
  LoadBtnPictures cmdPEKORD_DATAAcc, cmdPEKORD_DATAAcc.Tag
  LoadBtnPictures cmdPEKORD_DATACfg, cmdPEKORD_DATACfg.Tag
  Item.PEKORD_DATA.PrepareGrid gridPEKORD_DATA
  LoadGridLayout gridPEKORD_DATA
  Set fndPEKORD_DATA = Nothing
  On Error Resume Next
  Set fndPEKORD_DATA = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKORD_DATA.Init gridPEKORD_DATA
End Sub
Private Sub OnTabClick()

      gridPEKORD_DATA.Top = 40 * Screen.TwipsPerPixelX
      gridPEKORD_DATA.Left = 5 * Screen.TwipsPerPixelX
      gridPEKORD_DATA.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKORD_DATA.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKORD_DATA.Top = 40 * Screen.TwipsPerPixelX
      gridPEKORD_DATA.Left = 5 * Screen.TwipsPerPixelX
      gridPEKORD_DATA.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKORD_DATA.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKORD_DATA.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKORD_DATA = Nothing
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





