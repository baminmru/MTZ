VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl vpnPEKACT_ITOG_fill 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.Timer menuTimerPEKACT_ITOG 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1800
      Top             =   1560
   End
   Begin VB.Frame pnlPEKACT_ITOG 
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   6000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9000
      Begin VB.CommandButton cmdPEKACT_ITOGAcc 
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
      Begin VB.CommandButton cmdPEKACT_ITOGFnd 
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
      Begin VB.CommandButton cmdPEKACT_ITOGCfg 
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
      Begin VB.CommandButton cmdPEKACT_ITOGPrn 
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
      Begin VB.CommandButton cmdPEKACT_ITOGRef 
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
      Begin VB.CommandButton cmdPEKACT_ITOGDel 
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
      Begin VB.CommandButton cmdPEKACT_ITOGEdit 
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
      Begin VB.CommandButton cmdPEKACT_ITOGAdd 
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
      Begin GridEX20.GridEX gridPEKACT_ITOG 
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
         Column(1)       =   "vpnPEKACT_ITOG_fill.ctx":0000
         Column(2)       =   "vpnPEKACT_ITOG_fill.ctx":00C8
         FormatStylesCount=   5
         FormatStyle(1)  =   "vpnPEKACT_ITOG_fill.ctx":016C
         FormatStyle(2)  =   "vpnPEKACT_ITOG_fill.ctx":02C8
         FormatStyle(3)  =   "vpnPEKACT_ITOG_fill.ctx":0378
         FormatStyle(4)  =   "vpnPEKACT_ITOG_fill.ctx":042C
         FormatStyle(5)  =   "vpnPEKACT_ITOG_fill.ctx":0504
         ImageCount      =   0
         PrinterProperties=   "vpnPEKACT_ITOG_fill.ctx":05BC
      End
      Begin MTZ_PANEL.DropButton cmdPEKACT_ITOGRun 
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
   Begin VB.Menu mnuPopupPEKACT_ITOG 
      Caption         =   "Меню для Итоги по акту"
      Visible         =   0   'False
      Begin VB.Menu mnuPEKACT_ITOGAdd 
         Caption         =   "Создать"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKACT_ITOGEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuPEKACT_ITOGDelete 
         Caption         =   "Удалить"
         Enabled         =   0   'False
      End
      Begin VB.Menu mnuPEKACT_ITOGOpen 
         Caption         =   "Открыть"
      End
      Begin VB.Menu mnuPEKACT_ITOGRef 
         Caption         =   "Обновить"
      End
      Begin VB.Menu mnuPEKACT_ITOGS1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPEKACT_ITOGBuffer 
         Caption         =   "Буфер"
         Begin VB.Menu mnuPEKACT_ITOGCOPY 
            Caption         =   "Копировать"
         End
         Begin VB.Menu mnuPEKACT_ITOGCUT 
            Caption         =   "Вырезать"
         End
         Begin VB.Menu mnuPEKACT_ITOGPASTE 
            Caption         =   "Вставить"
         End
         Begin VB.Menu mnuPEKACT_ITOGCHANGE 
            Caption         =   "Заменить"
         End
         Begin VB.Menu mnuPEKACT_ITOGCLEAN 
            Caption         =   "Очистить"
         End
      End
      Begin VB.Menu mnuPEKACT_ITOGPrn 
         Caption         =   "Печать"
      End
      Begin VB.Menu mnuPEKACT_ITOGCfg 
         Caption         =   "Настроить"
      End
      Begin VB.Menu mnuPEKACT_ITOGFind 
         Caption         =   "Поиск"
      End
      Begin VB.Menu mnuPEKACT_ITOGAcc 
         Caption         =   "Стиль защиты"
      End
   End
End
Attribute VB_Name = "vpnPEKACT_ITOG_fill"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public ParentForm As Object
Public ModalMode As Boolean
Private fndPEKACT_ITOG As Object
Private menuActionPEKACT_ITOG As String





Private Sub cmdPEKACT_ITOGCfg_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.ShowSumary gridPEKACT_ITOG, "gridPEKACT_ITOG"
Set jset = Nothing
End Sub

Private Sub cmdPEKACT_ITOGPrn_Click()
  On Error Resume Next
Dim jset As Object 'MTZ_JSetup.Customizer
Set jset = CreateObject("MTZ_JSetup.Customizer")
jset.Preview gridPEKACT_ITOG, "Итоги по акту"
Set jset = Nothing
End Sub

Private Sub cmdPEKACT_ITOGRef_Click()
  On Error Resume Next
  Item.PEKACT_ITOG.Refresh
  gridPEKACT_ITOG.ItemCount = Item.PEKACT_ITOG.Count
  gridPEKACT_ITOG.Refetch
  gridPEKACT_ITOG.Refresh
End Sub
Private Sub cmdPEKACT_ITOGAcc_Click()
On Error Resume Next
If gridPEKACT_ITOG.ItemCount = 0 Then Exit Sub
If gridPEKACT_ITOG.Row > 0 Then
 If gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKACT_ITOG.RowBookmark(gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Item.Application.Manager.ShowSecurityDialog u
 End If
End If
End Sub
Private Sub cmdPEKACT_ITOGEdit_Click()
  On Error Resume Next
If gridPEKACT_ITOG.ItemCount = 0 Then Exit Sub
If gridPEKACT_ITOG.Row > 0 Then
 If gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKACT_ITOG.RowBookmark(gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    Set frmPEKACT_ITOG_fill.Item = u
again:     frmPEKACT_ITOG_fill.NotFirstTime = False
    frmPEKACT_ITOG_fill.OnInit
    frmPEKACT_ITOG_fill.Show vbModal
    If frmPEKACT_ITOG_fill.OK Then
    On Error Resume Next
    err.Clear
    u.Save
    If err.Number <> 0 Then
      MsgBox err.Description, vbOKOnly + vbExclamation, "Изменение"
      GoTo again
    End If
    gridPEKACT_ITOG.RefreshRowBookmark bm
    Else
     u.Refresh
    End If
 End If
End If
End Sub
Private Sub cmdPEKACT_ITOGDel_Click()
  On Error Resume Next
End Sub
Private Sub cmdPEKACT_ITOGAdd_Click()
  On Error Resume Next
      Exit Sub
bye:
   MsgBox err.Description, vbOKOnly + vbExclamation, "Создание"
End Sub
Private Sub cmdPEKACT_ITOGFnd_Click()
  On Error Resume Next
  fndPEKACT_ITOG.ShowForm
End Sub
Private Sub cmdPEKACT_ITOGRun_Click()
  On Error Resume Next
  gridPEKACT_ITOG_DblClick
End Sub
Public Function IsOK() As Boolean
        IsOK = True
End Function
Private Sub gridPEKACT_ITOG_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
On Error Resume Next
Item.PEKACT_ITOG.LoadRow gridPEKACT_ITOG, RowIndex, Bookmark, Values
End Sub
Private Sub gridPEKACT_ITOG_BeforeDeleteEX(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Cancel As GridEX20.JSRetBoolean)
   Cancel = True
End Sub

Private Sub gridPEKACT_ITOG_DblClick()
  cmdPEKACT_ITOGEdit_Click
End Sub
Private Sub gridPEKACT_ITOG_KeyPress(KeyAscii As Integer)
  If gridPEKACT_ITOG.ItemCount = 0 Then Exit Sub
  On Error Resume Next
  fndPEKACT_ITOG.FindOnPress KeyAscii
End Sub

Private Sub gridPEKACT_ITOG_RowColChange(ByVal LastRow As Long, ByVal LastCol As Integer)
 On Error Resume Next
If LastRow <> gridPEKACT_ITOG.Row And LastRow > 0 Then
  gridPEKACT_ITOG.GetRowData(LastRow).RowStyle = "Default"
  gridPEKACT_ITOG.GetRowData(gridPEKACT_ITOG.Row).RowStyle = "SelectedRow"
End If
End Sub
Private Sub mnuPEKACT_ITOGPASTE_Click()
On Error Resume Next
    Dim u As Object
    Set u = Item.PEKACT_ITOG.Add()
    If GetFromBuffer(u) Then
      gridPEKACT_ITOG.ItemCount = u.Parent.Count
    End If
End Sub
'Hidden GRID Setup...
Private Sub gridPEKACT_ITOG_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim ShiftDown, AltDown, CtrlDown
    ShiftDown = (Shift And vbShiftMask) > 0
    AltDown = (Shift And vbAltMask) > 0
    CtrlDown = (Shift And vbCtrlMask) > 0
    If KeyCode = vbKeyF4 Then
        If ShiftDown And CtrlDown And AltDown Then
            cmdPEKACT_ITOGCfg_Click
        End If
    End If
End Sub

Private Sub gridPEKACT_ITOG_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
  On Error Resume Next
  PopupMenu mnuPopupPEKACT_ITOG
End If
End Sub
Private Sub mnuPEKACT_ITOGAdd_click()
   menuActionPEKACT_ITOG = "ADD"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGEdit_click()
   menuActionPEKACT_ITOG = "EDIT"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGDelete_click()
   menuActionPEKACT_ITOG = "DEL"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGOpen_click()
   menuActionPEKACT_ITOG = "RUN"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGRef_click()
   menuActionPEKACT_ITOG = "REF"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
  Private Sub mnuPEKACT_ITOGCOPY_Click()
    On Error Resume Next
    If gridPEKACT_ITOG.ItemCount = 0 Then Exit Sub
    If gridPEKACT_ITOG.Row > 0 Then
     If gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKACT_ITOG.RowBookmark(gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
      End If
    End If
  End Sub
  Private Sub mnuPEKACT_ITOGCUT_Click()
    On Error Resume Next
    If gridPEKACT_ITOG.ItemCount = 0 Then Exit Sub
    If gridPEKACT_ITOG.Row > 0 Then
     If gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row) > 0 Then
        Dim u As Object
        Dim bm
        bm = gridPEKACT_ITOG.RowBookmark(gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row))
        Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
        SaveToBuffer u
        Set bm = u.Parent
        u.Parent.Delete u.ID
        gridPEKACT_ITOG.ItemCount = bm.Count
      End If
    End If
  End Sub
Private Sub mnuPEKACT_ITOGCHANGE_Click()
  On Error Resume Next
  If gridPEKACT_ITOG.ItemCount = 0 Then Exit Sub
  If gridPEKACT_ITOG.Row > 0 Then
   If gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row) > 0 Then
    Dim u As Object
    Dim bm
    bm = gridPEKACT_ITOG.RowBookmark(gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row))
    Set u = Item.FindRowObject(Right(bm, Len(bm) - 38), Left(bm, 38))
    If GetFromBuffer(u) Then
      gridPEKACT_ITOG.ItemCount = u.Parent.Count
      gridPEKACT_ITOG.RefreshRowIndex gridPEKACT_ITOG.RowIndex(gridPEKACT_ITOG.Row)
    End If
   End If
  End If
End Sub
  Private Sub mnuPEKACT_ITOGCLEAN_Click()
    Item.Manager.ClearBuffer " & p.name & "
  End Sub
Private Sub mnuPEKACT_ITOGPrn_click()
   menuActionPEKACT_ITOG = "PRN"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGCfg_click()
   menuActionPEKACT_ITOG = "CFG"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGFind_click()
   menuActionPEKACT_ITOG = "FND"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub mnuPEKACT_ITOGAcc_click()
   menuActionPEKACT_ITOG = "ACC"
   menuTimerPEKACT_ITOG.Enabled = True
End Sub
Private Sub menuTimerPEKACT_ITOG_timer()
   menuTimerPEKACT_ITOG.Enabled = False
   If menuActionPEKACT_ITOG = "ADD" Then cmdPEKACT_ITOGAdd_Click
   If menuActionPEKACT_ITOG = "EDIT" Then cmdPEKACT_ITOGEdit_Click
   If menuActionPEKACT_ITOG = "DEL" Then cmdPEKACT_ITOGDel_Click
   If menuActionPEKACT_ITOG = "RUN" Then cmdPEKACT_ITOGRun_Click
   If menuActionPEKACT_ITOG = "REF" Then cmdPEKACT_ITOGRef_Click
   If menuActionPEKACT_ITOG = "PRN" Then cmdPEKACT_ITOGPrn_Click
   If menuActionPEKACT_ITOG = "CFG" Then cmdPEKACT_ITOGCfg_Click
   If menuActionPEKACT_ITOG = "FND" Then cmdPEKACT_ITOGFnd_Click
   If menuActionPEKACT_ITOG = "ACC" Then cmdPEKACT_ITOGAcc_Click
   menuActionPEKACT_ITOG = ""
End Sub
Public Sub OnInit(aItem As Object, Optional pForm As Object = Nothing)
 On Error Resume Next
 Set Item = aItem
 Set ParentForm = pForm

  LoadBtnPictures cmdPEKACT_ITOGAdd, cmdPEKACT_ITOGAdd.Tag
  LoadBtnPictures cmdPEKACT_ITOGEdit, cmdPEKACT_ITOGEdit.Tag
  LoadBtnPictures cmdPEKACT_ITOGDel, cmdPEKACT_ITOGDel.Tag
  LoadBtnPictures cmdPEKACT_ITOGRef, cmdPEKACT_ITOGRef.Tag
  LoadBtnPictures cmdPEKACT_ITOGPrn, cmdPEKACT_ITOGPrn.Tag
  LoadBtnPictures cmdPEKACT_ITOGFnd, cmdPEKACT_ITOGFnd.Tag
  LoadBtnPictures cmdPEKACT_ITOGRun, cmdPEKACT_ITOGRun.Tag
  LoadBtnPictures cmdPEKACT_ITOGAcc, cmdPEKACT_ITOGAcc.Tag
  LoadBtnPictures cmdPEKACT_ITOGCfg, cmdPEKACT_ITOGCfg.Tag
  Item.PEKACT_ITOG.PrepareGrid gridPEKACT_ITOG
  LoadGridLayout gridPEKACT_ITOG
  Set fndPEKACT_ITOG = Nothing
  On Error Resume Next
  Set fndPEKACT_ITOG = CreateObject("MTZ_JSetup.GridFinder")
  fndPEKACT_ITOG.Init gridPEKACT_ITOG
End Sub
Private Sub OnTabClick()

      gridPEKACT_ITOG.Top = 40 * Screen.TwipsPerPixelX
      gridPEKACT_ITOG.Left = 5 * Screen.TwipsPerPixelX
      gridPEKACT_ITOG.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKACT_ITOG.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
      gridPEKACT_ITOG.Top = 40 * Screen.TwipsPerPixelX
      gridPEKACT_ITOG.Left = 5 * Screen.TwipsPerPixelX
      gridPEKACT_ITOG.Width = UserControl.Width - 10 * Screen.TwipsPerPixelX
      gridPEKACT_ITOG.Height = UserControl.Height - 45 * Screen.TwipsPerPixelY
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
  pnlPEKACT_ITOG.Move 0, 0, UserControl.Width, UserControl.Height
  OnTabClick
End Sub
Public Sub CloseClass()
  On Error Resume Next
  Set ParentForm = Nothing
  Set Item = Nothing
  Set fndPEKACT_ITOG = Nothing
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





